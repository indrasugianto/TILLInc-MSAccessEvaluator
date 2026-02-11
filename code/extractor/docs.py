"""Generate schema documentation report in Markdown."""

import json
import logging
from pathlib import Path

logger = logging.getLogger(__name__)


def generate_report(
    output_path: Path,
    schema: dict,
    relationships: list[dict],
    queries: list[str],
    vba: dict[str, list[str]],
    table_counts: dict[str, int] | None = None,
) -> None:
    """
    Generate schema_report.md with tables, relationships, queries, and VBA inventory.
    """
    lines = []
    # output_path is docs/schema_report.md; app folder is parent.parent
    app_name = output_path.parent.parent.name
    lines.append(f"# Schema Report: {app_name}\n")
    lines.append("---\n")

    # Tables
    lines.append("## Tables\n")
    for table in schema.get("tables", []):
        lines.append(f"### {table['name']}\n")
        lines.append("| Column | Type | Size |\n")
        lines.append("|--------|------|------|\n")
        for col in table.get("columns", []):
            size = col.get("size", "—")
            lines.append(f"| {col['name']} | {col['type']} | {size} |\n")
        if table.get("primary_key"):
            lines.append(f"\n**Primary Key:** {', '.join(table['primary_key'])}\n")
        if table_counts and table["name"] in table_counts:
            lines.append(f"\n**Row count:** {table_counts[table['name']]}\n")
        lines.append("\n")

    # Relationships
    lines.append("## Relationships\n")
    if relationships:
        lines.append("| Table | Column(s) | Referenced Table | Referenced Column(s) |\n")
        lines.append("|-------|-----------|------------------|----------------------|\n")
        for rel in relationships:
            tbl = rel.get("table", "")
            cols = rel.get("columns", [])
            ref_tbl = rel.get("referenced_table", "")
            ref_cols = rel.get("referenced_columns", [])
            if isinstance(cols, str):
                cols = [cols]
            if isinstance(ref_cols, str):
                ref_cols = [ref_cols]
            lines.append(
                f"| {tbl} | {', '.join(cols)} | {ref_tbl} | {', '.join(ref_cols)} |\n"
            )
    else:
        lines.append("No relationships extracted.\n")
    lines.append("\n")

    # Queries
    lines.append("## Queries\n")
    if queries:
        queries_dir = output_path.parent.parent / "extract" / "queries"
        for name in sorted(queries):
            lines.append(f"### {name}\n")
            sql_path = queries_dir / f"{_safe_filename(name)}.sql"
            if sql_path.exists():
                try:
                    sql = sql_path.read_text(encoding="utf-8").strip()
                    sql_preview = sql[:500] + "..." if len(sql) > 500 else sql
                    lines.append("```sql\n")
                    lines.append(sql_preview)
                    lines.append("\n```\n")
                except Exception:
                    lines.append("\n")
            else:
                lines.append("\n")
    else:
        lines.append("No queries extracted.\n")
    lines.append("\n")

    # VBA inventory
    lines.append("## VBA Object Inventory\n")
    lines.append("| Type | Count | Objects |\n")
    lines.append("|------|-------|--------|\n")
    for obj_type in ("forms", "reports", "modules", "classes", "macros"):
        items = vba.get(obj_type, [])
        if items:
            lines.append(f"| {obj_type.capitalize()} | {len(items)} | ")
            lines.append(", ".join(sorted(items)))
            lines.append(" |\n")
        else:
            lines.append(f"| {obj_type.capitalize()} | 0 |  |\n")
    lines.append("\n")

    output_path.parent.mkdir(parents=True, exist_ok=True)
    output_path.write_text("".join(lines), encoding="utf-8")


def _safe_filename(name: str) -> str:
    """Convert object name to safe filename."""
    return "".join(
        c if c.isalnum() or c in "._-" else "_" for c in name
    )
