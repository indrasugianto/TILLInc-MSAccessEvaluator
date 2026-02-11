# KR+H MS Access Application Evaluation

## Purpose

This repository contains the extraction and analysis of the KR+H Microsoft Access application suite -- a set of custom-built line-of-business applications that have served as the operational backbone for **KR+H Design Build**, a custom architectural cabinetry, millwork, and fine woodworking company, for over 20 years (circa 1996--2018+).

## Applications Under Review

| Application | Database File | Purpose | Scale |
|---|---|---|---|
| **KRHLApp** | `KRHPLApp.accdb` | Full-lifecycle ERP: jobs, products, CNC, sales, invoicing, drawings, time tracking, surveys | 518 queries, 60 forms, 111 reports, 10 VBA modules (~25K--35K lines) |
| **JournalsGeneralLedgerApp** | `JournalsGeneralLedgerApp.accdb` | Accounting & Financial: GL, AP, AR, payroll, job costing, bank reconciliation, year-end | 340 queries, 19 forms, 94 reports, 5 VBA modules (~4.5K lines) |

## Application Ecosystem

These two applications are part of a larger ecosystem of 6+ interconnected Access applications:

```
KRH.mdb / KRHLApp          ── Main production/operations application
├── KRHEdit.mdb             ── Editing/maintenance companion
├── Journals.mdb / GL App   ── Accounting & General Ledger
├── AccountingReports.mdb   ── Financial reporting
├── ProjectManagerReports   ── PM-specific reporting
└── Schedule.mdb            ── Scheduling
```

All applications share:
- **8 backend MDB databases** (Products, MIS, Document, Resource, Settings, Lists, APC, APCSet)
- A **common VBA library** (`Common.txt` -- 6,795 lines / 3,608 lines respectively)
- **Jet Replication** for multi-workstation data synchronization
- A **split database architecture** (front-end UI separate from back-end data)

## Documentation Index

| Document | Description |
|---|---|
| [01-KRHLApp-Analysis.md](01-KRHLApp-Analysis.md) | Comprehensive analysis of the main production/operations application |
| [02-JournalsGL-Analysis.md](02-JournalsGL-Analysis.md) | Comprehensive analysis of the accounting/general ledger application |
| [03-Shared-Infrastructure.md](03-Shared-Infrastructure.md) | Shared code, databases, and integration points across applications |
| [04-Modernization-Assessment.md](04-Modernization-Assessment.md) | Technical debt summary, risk assessment, and modernization considerations |

## Extraction Artifacts

Each application's extracted artifacts are stored under `msaccess/<AppName>/`:

```
msaccess/<AppName>/
├── original/           # Original .accdb database file
├── extract/
│   ├── schema.json     # Table schema (columns, types, sizes, primary keys)
│   ├── relationships.json  # Database-level relationships
│   ├── *.csv           # Table data exports
│   ├── queries/        # All query SQL definitions (*.sql)
│   └── vba/
│       ├── forms/      # Form definitions + embedded VBA (*.txt)
│       ├── reports/    # Report definitions (*.txt)
│       ├── modules/    # Standard VBA modules (*.txt)
│       ├── classes/    # Class modules (*.txt) -- none found
│       └── macros/     # Macro definitions (*.txt)
└── docs/
    └── schema_report.md  # Auto-generated schema + query + VBA inventory report
```

## Extraction Tools

The `code/` directory contains the Python extraction toolkit:

| File | Purpose |
|---|---|
| `extract_msaccess.py` | CLI entry point -- orchestrates full extraction |
| `extractor/schema.py` | Table schema extraction via pyodbc |
| `extractor/data.py` | Table data export to CSV via pyodbc |
| `extractor/relationships.py` | Relationship extraction via pyodbc |
| `extractor/queries.py` | Query SQL extraction via DAO COM |
| `extractor/vba.py` | VBA/form/report/macro extraction via Access.Application SaveAsText |
| `extractor/docs.py` | Schema report generation in Markdown |

### Requirements

- Windows with Microsoft Access (or Access Database Engine) installed
- Python 3.10+ with `pyodbc` and `pywin32`
- See `code/requirements.txt` for package versions
