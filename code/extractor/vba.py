"""Extract VBA code from forms, reports, modules, and class modules via Access.Application.SaveAsText.

Uses two strategies to connect to Access:
1. Direct COM Dispatch (preferred, requires Access.Application COM to be responsive)
2. Subprocess launch + GetActiveObject fallback (works with Click-to-Run Office)
"""

import logging
import subprocess
import time
import winreg
from pathlib import Path

logger = logging.getLogger(__name__)

# acForm=2, acReport=3, acModule=5
AC_FORM = 2
AC_REPORT = 3
AC_MODULE = 5

# Class module content hint
CLASS_MODULE_PREFIX = "VERSION 1.0 CLASS"

# Retry settings for GetActiveObject fallback
_LAUNCH_WAIT_SECONDS = 15
_POLL_INTERVAL_SECONDS = 3
_POLL_MAX_ATTEMPTS = 15


def _find_msaccess_exe() -> str | None:
    """Locate MSACCESS.EXE from the COM registry."""
    clsid_paths = [
        (winreg.HKEY_CLASSES_ROOT, r"CLSID\{73A4C9C1-D68D-11D0-98BF-00A0C90DC8D9}\LocalServer32"),
        (winreg.HKEY_LOCAL_MACHINE, r"SOFTWARE\Classes\CLSID\{73A4C9C1-D68D-11D0-98BF-00A0C90DC8D9}\LocalServer32"),
    ]
    for root, subkey in clsid_paths:
        try:
            key = winreg.OpenKey(root, subkey)
            val = winreg.QueryValueEx(key, "")[0]
            winreg.CloseKey(key)
            # Strip quotes if present
            exe_path = val.strip().strip('"')
            if Path(exe_path).exists():
                return exe_path
        except (FileNotFoundError, OSError):
            continue
    return None


def _connect_dispatch(accdb_path: str):
    """Try direct COM Dispatch to Access.Application."""
    import pythoncom
    import win32com.client

    # Ensure COM is initialized for this thread
    try:
        pythoncom.CoInitialize()
    except Exception:
        pass

    app = win32com.client.Dispatch("Access.Application")
    app.Visible = False
    app.OpenCurrentDatabase(accdb_path, False)
    # Quick test to confirm the connection is alive
    _ = app.CurrentProject.AllForms.Count
    return app


def _connect_subprocess(accdb_path: str):
    """Launch MSACCESS.EXE as a subprocess and connect via GetActiveObject."""
    import pythoncom
    import win32com.client

    # Ensure COM is initialized for this thread
    try:
        pythoncom.CoInitialize()
    except Exception:
        pass

    exe = _find_msaccess_exe()
    if not exe:
        raise RuntimeError("Cannot find MSACCESS.EXE in registry")

    logger.info("Launching Access subprocess: %s", exe)
    proc = subprocess.Popen([exe, accdb_path])
    logger.info("Waiting %ds for Access to load...", _LAUNCH_WAIT_SECONDS)
    time.sleep(_LAUNCH_WAIT_SECONDS)

    app = None
    for attempt in range(1, _POLL_MAX_ATTEMPTS + 1):
        try:
            app = win32com.client.GetActiveObject("Access.Application")
            # Verify connection is alive
            _ = app.CurrentProject.AllForms.Count
            logger.info("Connected to Access on attempt %d", attempt)
            break
        except Exception:
            logger.debug("GetActiveObject attempt %d failed, retrying...", attempt)
            time.sleep(_POLL_INTERVAL_SECONDS)

    if app is None:
        proc.terminate()
        raise RuntimeError(
            f"Failed to connect to Access.Application after {_POLL_MAX_ATTEMPTS} attempts"
        )

    # Stash the subprocess handle so we can clean up later
    app._msaccess_proc = proc
    return app


def _get_access_app(accdb_path: str):
    """Get a connected Access.Application instance using the best available method."""
    # Strategy 1: Direct COM Dispatch
    try:
        logger.debug("Trying direct COM Dispatch...")
        return _connect_dispatch(accdb_path)
    except Exception as e:
        logger.info("Direct COM Dispatch failed (%s), trying subprocess fallback...", e)

    # Strategy 2: Subprocess + GetActiveObject
    return _connect_subprocess(accdb_path)


def _quit_access(app):
    """Cleanly quit Access and terminate any subprocess."""
    try:
        app.Quit()
    except Exception:
        pass

    proc = getattr(app, "_msaccess_proc", None)
    if proc is not None:
        try:
            proc.wait(timeout=15)
        except subprocess.TimeoutExpired:
            logger.warning("Access process did not exit; terminating forcefully")
            proc.terminate()


def extract_vba(accdb_path: Path, output_dir: Path) -> dict[str, list[str]]:
    """
    Extract VBA from forms, reports, modules, and class modules via SaveAsText.
    Returns dict with keys: forms, reports, modules, classes (each a list of names).
    """
    try:
        import win32com.client  # noqa: F401
    except ImportError:
        logger.warning(
            "pywin32 not installed; cannot extract VBA. "
            "Install with: pip install pywin32"
        )
        return {"forms": [], "reports": [], "modules": [], "classes": []}

    accdb_path = Path(accdb_path).resolve()
    if not accdb_path.exists():
        logger.error("Database not found: %s", accdb_path)
        return {"forms": [], "reports": [], "modules": [], "classes": []}

    output_dir = Path(output_dir)
    result = {"forms": [], "reports": [], "modules": [], "classes": []}

    app = None
    try:
        app = _get_access_app(str(accdb_path))

        # Forms
        forms_dir = output_dir / "forms"
        forms_dir.mkdir(parents=True, exist_ok=True)
        form_count = app.CurrentProject.AllForms.Count
        logger.info("Exporting %d forms...", form_count)
        for i in range(form_count):
            obj = app.CurrentProject.AllForms.Item(i)
            name = obj.Name
            try:
                out_path = forms_dir / f"{_safe_filename(name)}.txt"
                app.SaveAsText(AC_FORM, name, str(out_path))
                result["forms"].append(name)
            except Exception as e:
                logger.warning("Skipping form %s: %s", name, e)

        # Reports
        reports_dir = output_dir / "reports"
        reports_dir.mkdir(parents=True, exist_ok=True)
        report_count = app.CurrentProject.AllReports.Count
        logger.info("Exporting %d reports...", report_count)
        for i in range(report_count):
            obj = app.CurrentProject.AllReports.Item(i)
            name = obj.Name
            try:
                out_path = reports_dir / f"{_safe_filename(name)}.txt"
                app.SaveAsText(AC_REPORT, name, str(out_path))
                result["reports"].append(name)
            except Exception as e:
                logger.warning("Skipping report %s: %s", name, e)

        # Modules and class modules (AllModules contains both)
        modules_dir = output_dir / "modules"
        classes_dir = output_dir / "classes"
        modules_dir.mkdir(parents=True, exist_ok=True)
        classes_dir.mkdir(parents=True, exist_ok=True)

        module_count = app.CurrentProject.AllModules.Count
        logger.info("Exporting %d modules...", module_count)
        for i in range(module_count):
            obj = app.CurrentProject.AllModules.Item(i)
            name = obj.Name
            try:
                tmp_path = output_dir / "_tmp_module.txt"
                app.SaveAsText(AC_MODULE, name, str(tmp_path))
                content = tmp_path.read_text(encoding="utf-8", errors="replace")
                tmp_path.unlink(missing_ok=True)

                if content.strip().upper().startswith(CLASS_MODULE_PREFIX):
                    out_path = classes_dir / f"{_safe_filename(name)}.txt"
                    result["classes"].append(name)
                else:
                    out_path = modules_dir / f"{_safe_filename(name)}.txt"
                    result["modules"].append(name)
                out_path.write_text(content, encoding="utf-8")
            except Exception as e:
                logger.warning("Skipping module %s: %s", name, e)

        # Macros (acMacro=4) — export as text for completeness
        macros_dir = output_dir / "macros"
        macros_dir.mkdir(parents=True, exist_ok=True)
        try:
            macro_count = app.CurrentProject.AllMacros.Count
            if macro_count > 0:
                logger.info("Exporting %d macros...", macro_count)
                for i in range(macro_count):
                    obj = app.CurrentProject.AllMacros.Item(i)
                    name = obj.Name
                    try:
                        out_path = macros_dir / f"{_safe_filename(name)}.txt"
                        app.SaveAsText(4, name, str(out_path))  # acMacro=4
                        result.setdefault("macros", []).append(name)
                    except Exception as e:
                        logger.warning("Skipping macro %s: %s", name, e)
        except Exception as e:
            logger.debug("Macro enumeration failed: %s", e)

    except Exception as e:
        logger.error("Access.Application extraction failed: %s", e)
    finally:
        if app is not None:
            _quit_access(app)

    return result


def _safe_filename(name: str) -> str:
    """Convert object name to safe filename."""
    return "".join(
        c if c.isalnum() or c in "._-" else "_" for c in name
    )
