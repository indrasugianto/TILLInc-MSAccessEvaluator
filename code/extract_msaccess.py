#!/usr/bin/env python3
"""MS Access Extractor - Extract schema, data, queries, and VBA from .accdb files."""

import argparse
import logging
import sys
from pathlib import Path

from extractor.schema import extract_schema
from extractor.data import export_table_data
from extractor.relationships import extract_relationships
from extractor.queries import extract_queries
from extractor.vba import extract_vba
from extractor.docs import generate_report

logger = logging.getLogger(__name__)

# Default paths relative to project root
MSACCESS_DIR = "msaccess"
ORIGINAL_DIR = "original"
EXTRACT_DIR = "extract"
DOCS_DIR = "docs"


def _get_project_root() -> Path:
    """Project root is parent of code/ directory."""
    return Path(__file__).resolve().parent.parent


def _discover_apps(project_root: Path, app_filter: str | None) -> list[tuple[str, Path]]:
    """Discover (app_name, accdb_path) for each app with original/*.accdb."""
    msaccess = project_root / MSACCESS_DIR
    if not msaccess.is_dir():
        return []

    results = []
    for app_dir in msaccess.iterdir():
        if not app_dir.is_dir():
            continue
        if app_filter and app_dir.name != app_filter:
            continue
        original = app_dir / ORIGINAL_DIR
        if not original.is_dir():
            continue
        for accdb in original.glob("*.accdb"):
            results.append((app_dir.name, accdb))
            break  # One .accdb per app
    return results


def _get_connection_string(accdb_path: Path) -> str:
    """Build pyodbc connection string for Access."""
    path = accdb_path.resolve()
    return f"Driver={{Microsoft Access Driver (*.mdb, *.accdb)}};DBQ={path};"


def _get_table_counts(conn_str: str, schema: dict) -> dict[str, int]:
    """Get row counts for each table (best-effort)."""
    try:
        import pyodbc
        conn = pyodbc.connect(conn_str)
        cursor = conn.cursor()
        counts = {}
        for table in schema.get("tables", []):
            name = table["name"]
            try:
                cursor.execute(f"SELECT COUNT(*) FROM [{name}]")
                counts[name] = cursor.fetchone()[0]
            except Exception:
                pass
        conn.close()
        return counts
    except Exception:
        return {}


def extract_app(
    app_name: str, accdb_path: Path, project_root: Path, vba_only: bool = False
) -> bool:
    """Extract all data for one app. Returns True on success."""
    app_dir = accdb_path.parent.parent
    extract_path = app_dir / EXTRACT_DIR
    docs_path = app_dir / DOCS_DIR

    extract_path.mkdir(parents=True, exist_ok=True)
    docs_path.mkdir(parents=True, exist_ok=True)

    schema = {"tables": []}
    relationships = []
    queries = []
    vba_result = {"forms": [], "reports": [], "modules": [], "classes": [], "macros": []}

    if not vba_only:
        conn_str = _get_connection_string(accdb_path)

        # pyodbc extraction
        try:
            schema = extract_schema(conn_str, extract_path / "schema.json")
        except Exception as e:
            logger.warning("Schema extraction failed for %s: %s", app_name, e)

        try:
            export_table_data(conn_str, extract_path)
        except Exception as e:
            logger.warning("Data export failed for %s: %s", app_name, e)

        try:
            relationships = extract_relationships(
                conn_str, extract_path / "relationships.json"
            )
        except Exception as e:
            logger.warning("Relationships extraction failed for %s: %s", app_name, e)

        # Query extraction (DAO)
        queries = extract_queries(accdb_path, extract_path / "queries")

    # VBA extraction (Access.Application) - always run
    vba_result = extract_vba(accdb_path, extract_path / "vba")

    # Table counts for report (skip if vba_only)
    table_counts = {}
    if not vba_only:
        conn_str = _get_connection_string(accdb_path)
        table_counts = _get_table_counts(conn_str, schema)

    # Generate docs
    generate_report(
        docs_path / "schema_report.md",
        schema=schema,
        relationships=relationships,
        queries=queries,
        vba=vba_result,
        table_counts=table_counts if not vba_only else None,
    )

    return True


def main() -> int:
    """CLI entry point."""
    parser = argparse.ArgumentParser(
        description="Extract schema, data, queries, and VBA from MS Access databases."
    )
    parser.add_argument(
        "--app",
        metavar="NAME",
        help="Process only this app (subfolder name under msaccess/)",
    )
    parser.add_argument(
        "--vba-only",
        action="store_true",
        help="Extract only VBA (forms, reports, modules, classes). Skip schema/data/queries.",
    )
    parser.add_argument(
        "-v", "--verbose",
        action="store_true",
        help="Verbose logging",
    )
    args = parser.parse_args()

    logging.basicConfig(
        level=logging.DEBUG if args.verbose else logging.INFO,
        format="%(levelname)s: %(message)s",
        stream=sys.stderr,
    )

    project_root = _get_project_root()
    apps = _discover_apps(project_root, args.app)

    if not apps:
        logger.error(
            "No .accdb files found under %s/<app>/%s/. "
            "Use --app NAME to target a specific app.",
            MSACCESS_DIR, ORIGINAL_DIR,
        )
        return 1

    success_count = 0
    for app_name, accdb_path in apps:
        logger.info("Extracting %s (%s)", app_name, accdb_path.name)
        if extract_app(app_name, accdb_path, project_root, vba_only=args.vba_only):
            success_count += 1
            logger.info("  Done: %s/extract/ and %s/docs/", app_name, app_name)
        else:
            logger.error("  Failed: %s", app_name)

    return 0 if success_count == len(apps) else 1


if __name__ == "__main__":
    sys.exit(main())
