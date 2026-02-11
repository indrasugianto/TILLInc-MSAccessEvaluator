# Shared Infrastructure Analysis
## Common Code, Databases, and Integration Points Across KR+H Applications

---

## 1. Application Ecosystem Overview

The KR+H Access suite consists of 6+ interconnected front-end applications sharing a common backend:

```
┌─────────────────────────────────────────────────────────────────┐
│                    FRONT-END APPLICATIONS                       │
├─────────────────┬──────────────┬────────────────────────────────┤
│ KRH.mdb         │ Journals.mdb │ AccountingReports.mdb          │
│ (KRHLApp)       │ (GL App)     │ ProjectManagerReports.mdb      │
│ Main ERP        │ Accounting   │ Reporting                      │
├─────────────────┼──────────────┤ KRHEdit.mdb                    │
│ 518 queries     │ 340 queries  │ Schedule.mdb                   │
│ 60 forms        │ 19 forms     │                                │
│ 111 reports     │ 94 reports   │                                │
└────────┬────────┴──────┬───────┴────────────────┬───────────────┘
         │               │                        │
         ▼               ▼                        ▼
┌─────────────────────────────────────────────────────────────────┐
│                   SHARED VBA LIBRARY                            │
│ Common.txt (6,795 / 3,608 lines)  -- Core utilities            │
│ AutoAttach.txt (892 / 707 lines)  -- Startup & sync            │
│ ResizeAPP.txt (101 lines)         -- Window management         │
│ AppPosition.txt (25-26 lines)     -- Window positioning        │
└────────┬────────────────────────────────────────────────────────┘
         │
         ▼
┌─────────────────────────────────────────────────────────────────┐
│                   BACKEND DATABASES (8 MDB files)               │
├─────────────┬────────────┬────────────┬─────────────────────────┤
│ Products.mdb│ MIS.mdb    │ Document.mdb│ Resource.mdb           │
│ Product     │ Accounts   │ Letters     │ Customers              │
│ catalog,    │ Personnel  │ Faxes       │ Architects             │
│ parts, CNC  │ Hours      │ Memos       │ Contractors            │
├─────────────┼────────────┼────────────┼─────────────────────────┤
│ Settings.mdb│ Lists.mdb  │ APC.mdb    │ APCSet.mdb             │
│ Config,     │ Lookup/    │ Journals:  │ Local settings,        │
│ CNC params  │ reference  │ GL, AP, AR │ attachments, errors    │
│             │ data       │ Payroll    │                        │
└─────────────┴────────────┴────────────┴─────────────────────────┘
         │
         ▼
┌─────────────────────────────────────────────────────────────────┐
│                   SYNCHRONIZATION LAYER                         │
│ Jet Replication (bidirectional)                                 │
│ File Copy (revision-based, server → local)                     │
│ Local: C:\Database\    Server: \\cmsbs\Access\Database 2000\   │
└─────────────────────────────────────────────────────────────────┘
```

---

## 2. Shared VBA Library (Common.txt)

The `Common.txt` module is copied into every front-end application but the KRHLApp version (6,795 lines) is a superset of the GL App version (3,608 lines). The GL App version omits KRHLApp-specific functions (CNC, CAD, product list, Revit integration).

### Shared Functions Present in Both Applications

| Category | Functions | Approx Lines |
|---|---|---|
| **Networking** | `ConnectedToServer()`, `TheUsername()`, `GetIPAddress()`, `GetHostNameFromIP()`, `SocketsInitialize/Cleanup()` | ~280 |
| **Date/Time** | `ListMonthBegin/End()`, `ListWeekBegin()`, `DateToday()`, `PriorYear()`, `LeapYear()`, `DayOfYear()`, `TheQuarter()`, `TheMonth()` | ~200 |
| **Null-Safety** | `NNEZ()`, `NNEN()`, `NNENull()`, `NNE1()`, `NotNull()` | ~30 |
| **Configuration** | `Variable()`, `SetVariable()`, `LocalVariable()`, `SetLocalVariable()`, `SaveLocalVariables()`, `RestoreLocalVariables()` | ~250 |
| **UI Management** | `PositionForm()`, `PositionReport()`, `EchoOn/Off/No()`, `StatusBarMessage()`, `SetMonitor()`, `SizeFormTo()`, `HideAllForms()`, `CloseAllForms()`, `FilterForm()` | ~200 |
| **Dialogs** | `Password()`, `ResourcePassword()`, `MessageOKCancel()`, `MessageOK()`, `MessageYesNoCancel()`, `ResponseYes()` | ~120 |
| **Resource Access** | `Resource()`, `ResourceID()`, `ResourceAddress()`, `ResourcePhone()`, `ResourceEmail()`, `ResourceFax()`, `CustomerData()`, `JobData()` | ~500 |
| **User/Security** | `UserIsPartner()`, `UserIsManager()`, `UserIsGeneralManager()`, `UserIsOffice()`, `UserKey()`, `GLAccess()` | ~100 |
| **Data Helpers** | `SQLResult()`, `SQLUpdate()`, `SetTableData()`, `DuplicateRecord()`, `ApostropheCheck()` | ~150 |
| **String Utils** | `NoDashes()`, `NoQuotes()`, `InQuotes()`, `Concatenate()`, `ConditionName()`, `CRLF()` | ~80 |
| **Navigation** | `CancelFile()`, `SaveRecord()`, `UndoRecord()`, `RequeryForm()`, `FindOpen()`, `DesignView()` | ~100 |
| **Help System** | `Help()`, `HelpOpen()`, `HelpUpdate()`, `WebHelp()` | ~150 |
| **Logging** | `ErrorLogEntry()`, `ErrorLogReport()`, `ErrorLogClear()`, `SetLog()` | ~100 |
| **App Lifecycle** | `MainMenuLoad()`, `DetermineApplication()`, `SynchronizeApplication()`, `RestartApplication()`, `CreateLocalTables()` | ~200 |
| **Number Formatting** | `Tenths()`, `Hundredths()`, `Thousandths()`, `ConditionNumber()`, `FormatWholeNumber()`, `ConvertedNumber()`, `LowestCommonDenominator()` | ~150 |
| **Math/Geometry** | `CalcString()`, `CircumCenter()`, `RotZ()`, `RotX()`, `VAV()`, `pi()` | ~250 |

### Functions Only in KRHLApp

| Category | Functions | Approx Lines |
|---|---|---|
| **Cost Export** | `ExportComponentCosts()`, `ExportExtraCosts()` | ~400 |
| **Product List** | `SelectList()`, `GetAlternateDisplay()`, `PLRef1()` | ~1,200 |
| **Advanced Networking** | `LocalIPAddress()`, `GetPublicIP()`, `DhcpServerAddress()` | ~300 |
| **Revit Integration** | `RevitUpdateProducts()`, `RevitViewProducts()`, `RevitCheck()` | ~100 |
| **Visio Integration** | `ImportVisioDrawing()` | ~110 |
| **Multi-Monitor** | `getDisplayHeight()`, extended display detection | ~80 |

---

## 3. Shared AutoAttach Module

Both applications use the same `AttachDatabase()` startup sequence:

```
Application Launch
    │
    ▼
GetSettings()  ──►  Load >Settings and >Local Settings recordsets
    │
    ▼
Check Restart Flag  ──►  If restarting, skip to MainMenu
    │
    ▼
Validate Existing Links  ──►  Check all linked tables are accessible
    │
    ▼
Re-Attach Tables  ──►  Iterate >Attachments, link from backend MDBs
    │                    via DoCmd.TransferDatabase acLink
    ▼
Check Connectivity  ──►  ConnectedToServer() compares IP to KRH_NetworkAddress
    │
    ▼
Synchronize (if connected)  ──►  Jet Replication: dbRepImportChanges + dbRepExportChanges
    │                              for: Document, Lists, Products, MIS, Resource, Settings
    ▼
Check App Updates  ──►  Compare local file dates vs server, copy newer versions
    │                    (KRH only: checks Journals, AccountingReports,
    │                     ProjectManagerReports, KRHEdit, Schedule)
    ▼
Check Document.mdb Size  ──►  If > 1.95-2GB, prompt for compaction
    │
    ▼
Open MainMenu Form
```

---

## 4. Shared Backend Database Schema

### 4.1 >Attachments Table (in APCSet.mdb)

Defines the table-to-database mapping for dynamic linking:

| Column | Purpose |
|---|---|
| TableName | Name of the table to link |
| Path | Source database filename (e.g., "Products.mdb") |
| Optional | Whether the table is required for app operation |
| Revision | Version tracking for server-to-local updates |

### 4.2 >Settings Table (in Settings.mdb)

Multi-purpose configuration table:

| Column | Usage |
|---|---|
| Key | Primary key |
| MenuText | Variable name for `Variable()` / `SetVariable()` lookups |
| MacroToRun | Variable value storage |
| MenuCategory | Counter for user-defined variables |
| Phase / PhaseSort | Production phase configuration |
| CNCFunction / CNCMachines | CNC machine configuration |
| TheScale / ScaleTemplate | Drawing scale settings |
| ContractHeader / ContractFooter | Sales contract formatting |
| Logo / ReportHeading / CopyRight | Report branding |
| ArchiveDate | Transaction archive cutoff |

### 4.3 >Local Settings Table (in Settings.mdb)

Per-workstation configuration:

| Column | Usage |
|---|---|
| Key | Primary key |
| DirectoryPath | Database file path |
| LastPath | Last used path |
| LocalSettingText5 | Variable name (for `LocalVariable()` lookups) |
| LocalSettingText6 | Variable value |
| LocalSettingNumber1 | Numeric value |

### 4.4 >Resources Table (in Resource.mdb)

Universal contact table used by all applications:

| Column | Usage |
|---|---|
| Key | Primary key |
| ID | Display name |
| Category | Type: Customer, Architect, Contractor, Builders, Interior Designer |
| CompanyName, TheName | Names |
| Address, State, Zip | Location |
| Field1 | Comment/notes |
| Field2 | Phone |
| Field3 | Fax |
| Field4 | Email |
| SageID | Sage accounting system identifier |

### 4.5 >Jobs Table (in Products.mdb or MIS.mdb)

Central job/project entity referenced by both applications:

| Column | Usage |
|---|---|
| Key | Primary key |
| ID | Job identifier |
| Customer | FK to >Resources |
| ManagedBy, SpecifiedBy | FK to MIS Personnel |
| Architect, Contractor | FK to >Resources |
| ProductionPhase | Current phase |
| Estimate, Closed | Status flags |

---

## 5. Shared Configuration System

### Key-Value Variable Storage

Both applications use the same dual-layer configuration pattern:

```vba
' Global settings (shared across workstations)
Variable("KRH_NetworkAddress")       ' → "192.168.115"
SetVariable "AppRevision", "2018.1"

' Local settings (per-workstation)
LocalVariable("Form_GeneralLedger_FromDate")   ' → "1/1/2024"
SetLocalVariable "Form_MainMenu_Size", "Large"
```

### Common Configuration Variables

| Variable | Scope | Used By | Purpose |
|---|---|---|---|
| `KRH_NetworkAddress` | Global | Both | Network address prefix for connectivity check |
| `AppRevision` | Global | Both | Application revision tracking |
| `AppSize` | Global | Both | Window size preference (Normal/Large) |
| `PandL_Close_Date` | Global | GL App | Monthly close date |
| `PandL_Close_Year` | Global | GL App | Fiscal year close |
| `office hrly cost estimate` | Global | GL App | Office hourly rate |
| `shop hrly cost estimate` | Global | GL App | Shop hourly rate |
| `Design OH` | Global | GL App | Design overhead rate |
| `S&I OH` | Global | GL App | Shop & Install overhead rate |

---

## 6. Cross-Application Data Flow

```
                    KRHLApp (Main ERP)
                    ┌─────────────────┐
                    │ Sales Journal    │──────────►┐
                    │ Receipts Journal │──────────►│
                    │ MIS Hours       │──────────►│
                    │ >Jobs           │──────────►│
                    │ >Resources      │──────────►│
                    └─────────────────┘           │
                                                   │
                              ┌────────────────────┘
                              │  Shared Backend
                              │  (MDB files)
                              └────────────────────┐
                                                   │
                    JournalsGeneralLedgerApp        │
                    ┌─────────────────┐            │
                    │ General Ledger   │◄───────────┘
                    │ Purchase Journal │◄───────────┘
                    │ Payroll Journal  │◄───────────┘
                    │ Financial Reports│
                    │ Year-End Process │
                    │ Sage Export      │
                    └─────────────────┘
```

The KRHLApp creates sales, receipt, and time entries. The GL App reads those same tables to produce financial reports, manage GL postings, process payroll, handle AP/AR, and export to Sage.

---

## 7. Synchronization Architecture

### Jet Replication Flow

```
Workstation A                  Server (\\cmsbs)              Workstation B
┌──────────┐                  ┌──────────┐                  ┌──────────┐
│ Local    │ ──Import──────►  │ Master   │  ◄──Import────── │ Local    │
│ Replica  │ ◄──Export──────  │ Replica  │  ──Export──────► │ Replica  │
│          │                  │          │                  │          │
│ C:\Database\Products.mdb    │ \\cmsbs\Access\Database 2000\Products.mdb
└──────────┘                  └──────────┘                  └──────────┘
```

Synchronized databases: Document, Lists, Products, MIS, Resource, Settings

**Not synchronized** (copied on demand): APC.mdb, APCSet.mdb

### File Update Flow

```
Server: \\cmsbs\Access\Access 2000\
    │
    ├── KRHEdit.mdb  ──►  Compare file date vs local  ──►  Copy if newer
    ├── Journals.mdb  ──►  Compare file date vs local  ──►  Copy if newer
    ├── AccountingReports.mdb  ──►  ...
    ├── ProjectManagerReports.mdb  ──►  ...
    └── Schedule.mdb  ──►  ...
```

---

## 8. Shared Win32 API Usage

Both applications declare and use the same Win32 APIs:

| DLL | Functions | Purpose |
|---|---|---|
| `User32.dll` | `FindWindow`, `GetWindowRect`, `SetWindowPos`, `GetSystemMetrics` | Window management |
| `advapi32.dll` | `GetUserNameA` | Current user detection |
| `gdi32.dll` | `GetDC`, `ReleaseDC`, `GetDeviceCaps` | Display DPI |
| `kernel32.dll` | `RtlMoveMemory`, `lstrlen` | Memory operations |
| `wsock32.dll` | `WSAStartup`, `gethostname`, `gethostbyname` | Network connectivity |
| `iphlpapi.dll` | `GetNetworkParams`, `GetAdaptersInfo` | Network adapter info |

---

## 9. Shared Risks and Dependencies

### Critical Single Points of Failure

| Dependency | Impact if Unavailable |
|---|---|
| `\\cmsbs` server | No data sync, stale local data, multi-user conflicts |
| `C:\Database\` directory | Application cannot start (table linking fails) |
| `C:\ACCESS\` directory | Configuration lost, defaults used |
| Jet Replication engine | Database sync fails entirely (deprecated technology) |
| Microsoft Access runtime | All applications non-functional |
| `Common.txt` module | Any bug affects all 6+ applications |
| `>Resources` table | All contact/address functions fail across all apps |
| `>Settings` table (Key=1) | All configuration lookups fail |

### Version Coupling

Since all applications share backend databases, a schema change in any table potentially breaks all applications. There is no schema versioning, migration system, or compatibility checking.
