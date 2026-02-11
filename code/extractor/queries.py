"""Extract query definitions (SQL) from MS Access via DAO."""

import logging
from pathlib import Path

logger = logging.getLogger(__name__)

# System query prefixes to skip
SYSTEM_QUERY_PREFIXES = ("~sq_", "~", "MSys")


def _is_user_query(name: str) -> bool:
    """Return True if query is a user query (not system)."""
    return not any(
        name.startswith(prefix) for prefix in SYSTEM_QUERY_PREFIXES
    )


def extract_queries(accdb_path: Path, output_dir: Path) -> list[str]:
    """
    Extract QueryDef SQL from Access database via DAO.
    Returns list of extracted query names.
    """
    try:
        import win32com.client
    except ImportError:
        logger.warning(
            "pywin32 not installed; cannot extract queries. "
            "Install with: pip install pywin32"
        )
        return []

    accdb_path = Path(accdb_path).resolve()
    if not accdb_path.exists():
        logger.error("Database not found: %s", accdb_path)
        return []

    output_dir = Path(output_dir)
    output_dir.mkdir(parents=True, exist_ok=True)

    extracted = []
    dao = None
    db = None

    try:
        # DAO.DBEngine.120 for Access 2016+; fallback to .36 for older
        for prog_id in ("DAO.DBEngine.120", "DAO.DBEngine.36", "DAO.DBEngine.35"):
            try:
                dao = win32com.client.Dispatch(prog_id)
                break
            except Exception:
                continue

        if dao is None:
            logger.warning("DAO.DBEngine not available; cannot extract queries")
            return []

        db = dao.OpenDatabase(str(accdb_path))

        for i in range(db.QueryDefs.Count):
            qdf = db.QueryDefs(i)
            name = qdf.Name
            if not _is_user_query(name):
                continue
            try:
                sql = qdf.SQL.strip()
                if not sql:
                    continue
                # Sanitize filename
                safe_name = "".join(
                    c if c.isalnum() or c in "._-" else "_" for c in name
                )
                out_path = output_dir / f"{safe_name}.sql"
                out_path.write_text(sql, encoding="utf-8")
                extracted.append(name)
            except Exception as e:
                logger.warning("Skipping query %s: %s", name, e)

    except Exception as e:
        logger.error("DAO extraction failed: %s", e)
    finally:
        if db is not None:
            try:
                db.Close()
            except Exception:
                pass

    return extracted
