# MS Access Extractor

Extract schema, data, query definitions, and VBA code from Microsoft Access (`.accdb`) databases.

## Directory Structure

Place each Access app under `msaccess/<AppName>/original/`:

```
msaccess/
  <AppName>/
    original/          <- .accdb files
    extract/           <- output (created by tool)
    docs/              <- documentation (created by tool)
```

## Output

For each app, the tool creates:

| Output | Location | Format |
|--------|----------|--------|
| Table schema | `extract/schema.json` | JSON |
| Table data | `extract/<table>.csv` | CSV per table |
| Relationships | `extract/relationships.json` | JSON |
| Query definitions | `extract/queries/<name>.sql` | SQL |
| Forms VBA | `extract/vba/forms/<name>.txt` | SaveAsText |
| Reports VBA | `extract/vba/reports/<name>.txt` | SaveAsText |
| Modules VBA | `extract/vba/modules/<name>.txt` | SaveAsText |
| Class modules VBA | `extract/vba/classes/<name>.txt` | SaveAsText |
| Documentation | `docs/schema_report.md` | Markdown |

## Prerequisites

- Python 3.8+
- **Microsoft Access Database Engine (ACE)** – for schema and data extraction (pyodbc)
  - [64-bit ACE Redistributable](https://www.microsoft.com/en-us/download/details.aspx?id=54920) if using 64-bit Python
- **Microsoft Access** – for query and VBA extraction (COM automation)

## Install

```bash
cd code
pip install -r requirements.txt
```

## Usage

From the project root:

```bash
# Extract all apps under msaccess/
python code/extract_msaccess.py

# Extract a specific app only
python code/extract_msaccess.py --app JournalsGeneralLedgerApp

# Extract only VBA (forms, reports, modules, classes) - faster, use when db is closed
python code/extract_msaccess.py --vba-only
python code/extract_msaccess.py --vba-only --app JournalsGeneralLedgerApp

# Verbose output
python code/extract_msaccess.py -v
```

**Important for VBA extraction:** Close the .accdb file in Microsoft Access before running. VBA extraction uses Access.Application and will fail if the database is already open.

Or from the `code/` directory:

```bash
python extract_msaccess.py
python extract_msaccess.py --app JournalsGeneralLedgerApp
```

## Troubleshooting

- **"ACE driver not found"** – Install the Microsoft Access Database Engine matching your Python bitness (32 or 64-bit).
- **"Access not installed"** – Query and VBA extraction requires Access. Schema and data extraction still work with ACE only.
- **"You already have the database open"** – Close the .accdb file in Access before running the extractor (needed for VBA extraction).
- **MSysObjects / MSysRelationships permission errors** – Some databases require granting `SELECT` on system tables. Run the VBA script in the plan to grant permissions.
