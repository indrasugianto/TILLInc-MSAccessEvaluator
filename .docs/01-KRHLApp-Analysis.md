# KRHLApp Comprehensive Analysis
## MS Access Application for KR+H Custom Architectural Cabinetry & Millwork

---

## Table of Contents

1. [Application Overview & Business Purpose](#1-application-overview--business-purpose)
2. [Key Business Entities/Tables and Relationships](#2-key-business-entitiestables-and-relationships)
3. [Major Functional Areas](#3-major-functional-areas)
4. [VBA Code Complexity and Patterns](#4-vba-code-complexity-and-patterns)
5. [Forms and Their Purposes](#5-forms-and-their-purposes)
6. [Reports and Their Purposes](#6-reports-and-their-purposes)
7. [Key Queries and What They Do](#7-key-queries-and-what-they-do)
8. [Technical Debt and Concerns](#8-technical-debt-and-concerns)
9. [Integration Points](#9-integration-points)
10. [Architectural Patterns and Anti-Patterns](#10-architectural-patterns-and-anti-patterns)

---

## 1. Application Overview & Business Purpose

### What It Is

**KRHLApp** is a comprehensive, custom-built Microsoft Access business management system for **KR+H** (KR+H Design Build), a custom architectural cabinetry, millwork, and fine woodworking company. The application serves as the central operational platform managing the **entire business lifecycle** -- from initial customer estimates and sales proposals through product engineering, CNC machine programming, shop drawings, production scheduling, invoicing, accounts receivable, and post-delivery customer surveys.

### Industry Context

KR+H specializes in high-end custom cabinetry, countertops (including stone), millwork, and architectural woodwork for commercial and residential construction projects. The application references:

- **Architects** and **Interior Designers** who specify products
- **Contractors** and **Builders** who install products
- **Customers** who purchase products
- **Partners** and **Project Managers** who manage jobs internally
- **Production phases**: Design → Shop → Installation → Delivery → Completion

### Copyright & History

The `CopyRight` table exists with a single row, and the `Common.txt` module contains a VBnet copyright notice from **1996-2006**, indicating development that spans roughly **20-30 years**. The presence of Jet Replication, DAO data access, and references to Access 2000 format files confirms a legacy codebase that has evolved over multiple Access versions.

### Scale of the Application

| Artifact | Count |
|----------|-------|
| Tables (local) | 5 |
| Tables (linked, prefixed `>`) | 40+ |
| Queries | **518** (documented in schema_report.md, with 523 heading-level entries including 5 table definitions) |
| Forms | **60** |
| Reports | **111** |
| VBA Modules | **10** |
| VBA Class Modules | 0 |
| Macros | **91** |
| External MDB databases | **8+** |

---

## 2. Key Business Entities/Tables and Relationships

### Database Architecture

The application uses a **split database architecture** with the front-end application (KRHLApp/KRH.mdb) containing forms, queries, reports, macros, and VBA modules, while data resides in **8+ linked MDB backend files**:

| Database File | Purpose | Sync Direction |
|--------------|---------|----------------|
| `Products.mdb` | Product catalog: products, designs, parts, CNC programs, product lists | Bidirectional (Import + Export) |
| `MIS.mdb` | Management Information System: personnel, hours, payroll, accounting | Bidirectional |
| `Document.mdb` | Correspondence: letters, faxes, memos, templates | Bidirectional |
| `Resource.mdb` | Contacts: customers, architects, contractors, designers, builders | Bidirectional |
| `Settings.mdb` | Application configuration: CNC machines, coordinates, drawing settings | Bidirectional |
| `Lists.mdb` | Product lists, options, notes per list item | Import only |
| `APC.mdb` | Additional product/cost data (with revision tracking) | Server-to-local copy |
| `APCSet.mdb` | Local settings override | Local |

### Local Tables (in KRHLApp itself)

| Table | Columns | Row Count | Purpose |
|-------|---------|-----------|---------|
| `BillableDesign` | Date, Hours, Job, Employee, Weekof, Void | 2 | Tracks billable design hours by employee and job |
| `Charts` | Counter, Value1, Value2, Date1, Date2, Text1, Text2 | 0 | Generic chart data storage |
| `CopyRight` | ID (Counter), CopyRight (DateTime), Message | 1 | Application version/copyright info |
| `EstimateTrend` | TrendDate, Trend1-4Amount (Currency), Trend1-4Job | 0 | Historical estimate trend tracking |
| `VOJCGoal` | TheDay, VOJC, VOJCGoal, VOJCCurrent | 0 | Value of Jobs Completed goals |

**Note:** All local tables have `primary_key: []` in the schema extraction, indicating no explicit primary keys are defined.

### Linked Tables (from external MDB files)

These are the core business entities, inferred from queries, VBA code, and the `>Attachments` configuration table:

#### Core Job Management
| Table | Key Fields | Purpose |
|-------|-----------|---------|
| `>Jobs` | Key, ID, Customer, ManagedBy, SpecifiedBy, ProductionPhase, Estimate (Boolean), Closed (Boolean), Owner, Family, Parent, Category, DesignJob, Delivered, Preliminary, Info3-5, Spreadsheet, EntryDate, LastEstimateExport | Central entity for all projects |
| `>Settings` | Key, Phase, PhaseSort, CNCFunction, CNCFunctionDescription, CNCMachines, TheScale, ScaleTemplate, ACADFont, ContractHeader, ContractFooter, AutoDimension, ProductsType, RateUnits, RateAmount, RateAmountAlternate, MenuText, MacroToRun | Global application configuration (multi-purpose) |
| `>Local Settings` | DirectoryPath, LocalSettingNumber1 | Per-workstation local settings |

#### Product Catalog & Engineering
| Table | Key Fields | Purpose |
|-------|-----------|---------|
| `>Products` | Key, ID, Description, Category, ProductType ("Product"/"Design"), ProductDrawing, HideInPLList, HideDrawing, DefaultX/Y/Z | Master product catalog |
| `>Product Lists` | Key, ProductList (name), Job, Archive (Boolean), Text1, IncludeInEstimate | Bill of materials per job (the list container) |
| `>Product List` | Key, ProductListKey (FK to Product Lists), Item (sequence #), Product (FK to Products), ProductName, X/Y/Z (dimensions), W/D/H, Position, Reference1/Reference2, Material1-Material16, Material1Type-Material16Type, Design1-Design6, Design1Type-Design6Type, Option1-3, Option1Requirement-Option3Requirement, DrawingXBegin/XEnd/YBegin/YEnd/ZBegin/ZEnd, DrawingDegrees, AbsoluteXBegin/XEnd/YBegin/YEnd, Skip, CenterX, Component, ComponentText, TotalCost, PremiumCost, ProcessComponent, ProcessActivity, ProcessCost, MaterialCost | Individual line items (products placed in a room/space) |
| `>Designs` | Key, ProductListKey, Alternate, DesignAlternate (FK to Products) | Design specifications with alternates per product list |
| `>Parts` / `>Product Parts` | Part (FK to Products), SubAssembly, Sequence, Process1Alternate, various dimension/coordinate fields | Part definitions within products |
| `>Product Parts CNC` | SubAssembly, Sequence, Category, CNCMachine | CNC-specific part data |
| `>Material` | Key, ID, Description, Category, StandardMaterial (Boolean) | Material catalog |
| `>Materials` | Key, ProductListKey | Materials assigned to product lists |
| `>Options` | Key, ProductListKey, Option (FK to Products) | Options per product list item |
| `>Note` | Key, ProductListKey | Notes per product list item |
| `>CNC` | Key, Function, Command, Sequence, Item, ProductList, X/Y/Z/ZPos/XPos/YPos, Tool, DXF | CNC machine instruction records |

#### Resource Management
| Table | Key Fields | Purpose |
|-------|-----------|---------|
| `>Resources` | Key, ID, Category ("Customer"/"Architect"/"Contractor"/"Builders"/"Design"/"Interior Designer"), Field4 (Email), State, Comment, Phone, Fax, Street, Town | All external contacts (polymorphic by Category) |
| `>Directory` / `>Directory Path` | Path info | File system directory references |
| `>Drawings` | Key, resource linkage, shop/customer/install versions | Visio/AutoCAD drawing files |

#### Financial/Accounting
| Table | Key Fields | Purpose |
|-------|-----------|---------|
| `Sales Journal` | Key, Job (FK to Jobs), Journal ("Sale"), InvoiceNumber, InvoiceAmount, SaleAmount, Proposal, Due, TheDate, Posted, Category ("Cabinet"/"Countertop"/etc.), Description | All sales transactions: proposals, sales, invoices |
| `Receipts Journal` | Key, Job (FK to Jobs), Amount, CheckDate, EntryDate | Payment receipts |
| `General Ledger` | Job, AccountNumber (e.g., 121 for refunds), SourceTransaction ("refund"), TransactionDate, DebitAmount, CreditAmount, SourceOperative | GL entries |
| `MIS Accounts` | Key, Account info | Chart of accounts |
| `>Receivables Query` | Days, Owed | Accounts receivable aging data |

#### Time/Payroll
| Table | Key Fields | Purpose |
|-------|-----------|---------|
| `MIS Personnel` | Key, Employee, Text1 (initials), Text2 ("Partner"/"Project Manager"/"Shop"), ADPFile, Rate | Employee records |
| `MIS Hours` | Employee, Date, Job, Hours, Monday-Sunday, General, GeneralHour, JobHour, Rate, Cost, Archive, ADPFile, DesignNote, day-of-week notes | Weekly time entry |

#### Scheduling
| Table | Key Fields | Purpose |
|-------|-----------|---------|
| `ProjectSchedule` | Job, Task, TaskBegin, TaskEnd, PercentComplete, TaskSummary, Drawing | Gantt-style project schedule |
| `WorkFlow` | Job, Phase, TaskID, TaskBegin, Task, PhaseAmount, TaskLevel | Workflow tracking |

#### Correspondence/Documents
| Table | Key Fields | Purpose |
|-------|-----------|---------|
| `>Correspondence` | Key, Name (FK reference), Description, Date, Archive, Correspondence (OLE) | Letters, faxes, memos with OLE attachments |
| `>Templates` | Key | Correspondence templates |

#### Surveys
| Table | Key Fields | Purpose |
|-------|-----------|---------|
| Survey tables | Job, Question, Contact, Team, completion status | Post-delivery customer satisfaction surveys |

#### System/Infrastructure
| Table | Key Fields | Purpose |
|-------|-----------|---------|
| `>Attachments` | Path, TableName, Revision | Table link definitions for dynamic attachment |
| `>AttachRevitLists` | Path, TableName | Revit-specific table attachment mappings |
| `>Errors` | Error data | Error logging |
| `>Help` | Key, Category | In-app help system |
| `Estimates` | Job, Component, Sequence, ImportPL, ImportParts, ImportMerge, Description, Material, Inventory, activity fields | Estimate data with cost import tracking |
| `Components` | Key, Component, Sequence | Estimate component definitions |
| `Activity` | Key, Description, Sequence, Charge ("Project"/"Installation"/"Shop"), LaborRate, Overhead | Activity definitions for cost allocation |
| `eMail` | email, ResourceKey, UnSubscribe | Email marketing list |

### Relationships

**The `relationships.json` file is empty (`[]`)**, meaning **no database-level relationships or foreign keys** are defined in the Access relationship window. All referential integrity is enforced (or not enforced) through:
- VBA code that manually validates references
- Query JOINs (mostly LEFT JOINs, allowing orphaned records)
- User-level data entry controls (combo boxes with row sources)

This is a **critical architectural concern** -- there is no database-enforced referential integrity.

---

## 3. Major Functional Areas

### A. Job/Project Management
- **Job Creation & Tracking**: Create and manage jobs with unique IDs, assign customers, managers, and engineers
- **Production Phase Workflow**: Jobs progress through phases: Design → Shop → Installation → Delivery → Completion (with PhaseSort ordering)
- **Job Types**: Regular jobs, Design jobs, Estimates (pre-conversion), and closed jobs
- **Parent-Child Job Hierarchy**: Family/Parent fields support multi-phase or related job grouping
- **Job Status Queries**: Active, closed, estimates, by partner, by project manager

### B. Product Design & Engineering
- **Hierarchical Product Catalog**: Products (ProductType = "Product") and Designs (ProductType = "Design") organized by Category
- **Product List Management**: Bill of materials per job, with items positioned spatially in a room
- **3D Coordinate System**: Each item has X/Y/Z dimensions with absolute/relative positioning, drawing coordinates (XBegin/XEnd, etc.), rotation (DrawingDegrees), and wall references
- **Material System**: Up to **16 materials per product list item** (Material1-Material16 with Material1Type-Material16Type), supporting standard and alternate materials
- **Design Alternates**: Multiple design configurations (Alternate field) linked to product lists
- **Options & Requirements**: Up to 3 options per line item with requirement conditions
- **Auto-Dimensioning (GapFill)**: Sophisticated algorithm (500+ lines) that automatically calculates variable dimensions between products positioned along walls

### C. CNC Machine Integration
- **Multi-Machine Support**: NB3615, Xilog, Xilog FF CNC machines
- **CNC Program Generation**: Creates machine-specific program files by iterating through CNC records
- **File Output Types**: 
  - **LIST folder**: Cut list text files
  - **DXF folder**: DXF drawing files for case parts, front parts, and millwork
  - **XILOG folder**: Xilog machine programs
  - **XILOG FF folder**: Xilog full frame programs
- **Subassembly Tracking**: Sequences grouped by subassembly (Case, Front, etc.)
- **Part Transmit Workflow**: `PartsTransmit()` → `TransmitBegin()` → `TransmitResume()` → `TransmitEnd()` → `SequenceEnd()`
- **CNC Functions**: Configurable machine functions stored in Settings with CNCFunction, CNCFunctionDescription, CNCMachines

### D. Sales & Estimating
- **Sales Journal**: Tracks proposals, sales, and invoices per job
- **Proposal Management**: Proposal amounts, dates, and status
- **Sales Agreements**: Multi-type agreements (Cabinet, Counter, Stone, Installation)
- **Sales Categories**: Cabinet, Countertop, Stone, etc.
- **Estimate Tracking**: Estimate trend analysis with 4 trend lines per date
- **Design Cost Tracking**: By architect, contractor, customer, and interior designer
- **VOJC (Value of Jobs Completed)**: KPI tracking with goals vs. actuals
- **Pricing Analysis**: "Priced Too High" queries to track lost estimates

### E. Invoicing & Accounts Receivable
- **Invoice Generation**: Invoice amounts posted through Sales Journal
- **AR Aging**: Under 30, 30-60, 60-90, 90-120, 120+ day aging buckets (in `*ARJobQuery2`)
- **Payment Tracking**: Receipts Journal with check dates
- **Refund Management**: GL transactions with account 121 for refunds
- **Customer Statements**: Regular and weekly statement reports
- **Cash/Deposit Accounts**: Separate account queries
- **Posted/Unposted Tracking**: `Posted` flag on Sales Journal entries; "Not Posted" and "Not Audited" reports

### F. Accounting/Financial
- **General Ledger**: Full GL with debit/credit tracking per account number
- **Account Structure**: Receivables (with aging), Cash, Deposit, Sale accounts
- **Job Cost Tracking**: Cost by category, item, hours; includes design costs, process costs, material costs
- **Cost Export**: `ExportComponentCosts()` function exports parts list costs to estimate components, mapping process activities to labor rate categories (Shop, Office, Installation)
- **Profit Analysis**: WIP (Work In Progress) queries by phase: Design, Shop, Installation, Stored

### G. Time/Hours Management
- **Weekly Time Entry**: Hours logged per employee per week (Monday-Sunday) with day-of-week notes
- **Job vs. General Hours**: Job-specific hours and general administrative hours
- **ADP Payroll Integration**: Employee ADP file numbers for payroll export
- **Time Summaries**: By employee, by job, by week, by company
- **Hours Glitch Detection**: 7 "Hours Glitch" queries for finding data integrity issues (mismatched totals, missing records)
- **Time Card Interface**: Special "TimeCard" station with username-based detection (`InStr(TheUsername, "Time") And InStr(TheUsername, "Card")`)

### H. Drawing/CAD Integration
- **AutoCAD Script Generation**: `Initialize_AutoCAD()` writes AutoCAD commands to .SCR files via `Print #1`, setting up:
  - Snap, thickness, elevation, tile mode
  - UCS (User Coordinate System) settings
  - Dimension styles (DIMFIT, DIMEXE, DIMEXO, DIMTXT, DIMJUST, etc.)
  - Text styles and fonts
  - Scale support: 12in, 6in, 3in, 1.5in, 1in, .75in, .5in, .375in, .25in (all relative to 12)
- **Visio Integration**: Drawing management through `ImportVisioDrawing()`, Gantt schedule charts
- **Drawing Setup**: Configurable font, scale, and drawing parameters
- **Drawing Categories**: Shop drawings, customer drawings, installation drawings, product drawings
- **Resource-Linked Drawings**: Drawings associated with resources and filtered by category

### I. Correspondence/Document Management
- **Multi-Type Documents**: Letters, Faxes, Memos with dedicated forms
- **Template System**: Correspondence templates with categories
- **Archive System**: Active/archived correspondence with separate views
- **OLE Storage**: Correspondence content stored as OLE objects
- **Product List Attachments**: Correspondence linked to product list items via `>Correspondence.Name = Product List.Key`

### J. Resource/Contact Management
- **Multi-Category Contacts**: Single `>Resources` table with Category field: Customer, Architect, Contractor, Builders, Interior Designer
- **Address & Phone Management**: Full address, phone, fax, email, web
- **Labels & Mailing**: Plain labels, small labels, resource labels (multiple formats)
- **Comment-Based Filtering**: Resources can be filtered by comment field
- **Resource Notes**: Additional notes report
- **Marketing**: Email list management with unsubscribe tracking

### K. Surveys
- **Customer Satisfaction**: Post-delivery surveys with questions
- **Survey Types**: Completed jobs, Work In Progress (WIP), Incomplete
- **Team Tracking**: Survey team assignments
- **Summary Reports**: Aggregate survey results

### L. Application Infrastructure
- **Startup/Database Selection**: `Startup` form with `SelectDatabase` for choosing database paths
- **Database Synchronization**: Jet Replication bidirectional sync at startup
- **Application Updates**: Auto-update of satellite applications (Journals, AccountingReports, ProjectManagerReports, KRHEdit)
- **Error Logging**: `ErrorLogEntry`, `ErrorLogReport`, `ErrorLogClear` system
- **Help System**: In-app help with categories, search, and edit capabilities
- **Variable Storage**: `SetVariable`/`Variable` (global) and `SetLocalVariable`/`LocalVariable` (per-workstation) key-value stores
- **Password System**: Application and resource-level passwords
- **Problem Logging**: Dedicated `ProblemLog` form

---

## 4. VBA Code Complexity and Patterns

### Line Count by Module (Exact)

| Module | Lines of Code | Functions/Subs | Purpose |
|--------|--------------|----------------|---------|
| `Common.txt` | **6,795** | 132 | Core utilities, Win32 APIs, networking, cost export, application infrastructure |
| `Parts.txt` | **5,988** | 60 | Parts computation engine, drawing generation, CNC code, cost calculation |
| `General_Form_Utilities.txt` | **1,349** | 34 | GapFill auto-dimensioning, form utilities, product list operations |
| `AutoAttach.txt` | **892** | 13 | Database attachment, synchronization, path management |
| `Records.txt` | **868** | 17 | Record CRUD operations, copy/paste, renumbering |
| `CNC.txt` | **632** | 6 | CNC transmit workflow, program generation |
| `ResizeAPP.txt` | **103** | 5 | Window sizing with Win32 API |
| `FormsCode.txt` | **90** | 3 | Product list archive/current switching |
| `Drawing.txt` | **76** | 1 | AutoCAD initialization |
| `AppPosition.txt` | **25** | 1 | Window position detection |
| **Module Subtotal** | **16,818** | **272** | |

**Note**: The 60 form files likely contain additional embedded VBA code (event procedures), but these were extracted in binary/hex format and could not be read as plain text. Estimated additional form-level VBA: **10,000-20,000 lines** based on form complexity. **Estimated total VBA: 25,000-35,000+ lines.**

### Key Functions by Module

#### Common.txt (6,795 lines, 132 functions)

**Win32 API Declarations (lines 1-245)**:
- Winsock (`wsock32`): `WSAStartup`, `WSACleanup`, `gethostname`, `gethostbyname`, `gethostbyaddr`, `inet_addr`
- Network Info (`iphlpapi.dll`): `GetNetworkParams`, `GetAdaptersInfo`
- File Download (`urlmon`): `URLDownloadToFile`
- Cache (`Wininet.dll`): `DeleteUrlCacheEntry`
- Display (`User32`): `GetSystemMetrics32`, `EnumDisplayDevices`, `EnumDisplaySettings`
- Memory (`kernel32`): `CopyMemory`, `lstrlen`, `lstrlenW`
- User (`advapi32.dll`): `GetUserNameA`
- Types: `HOSTENT`, `WSADATA`, `IP_ADAPTER_INFO`, `FIXED_INFO`, `DISPLAY_DEVICE`, `DEVMODE`

**Networking Functions (lines 247-547)**:
- `LocalIPAddress()` -- Gets workstation IP via adapter enumeration
- `GetPublicIP()` -- Downloads public IP from external website
- `GetHostNameFromIP()` -- Reverse DNS lookup
- `DhcpServerAddress()` -- Gets DHCP server address
- `SocketsInitialize()`/`SocketsCleanup()` -- Winsock initialization
- `ConnectedToServer()` -- Checks if network server is reachable
- `ServerConnected()` -- Alternative server connectivity check

**Cost Export Functions (lines 549-935)**:
- `ExportComponentCosts()` -- **~386 lines**: Exports parts list costs to estimate components, mapping process activities to labor rate categories, handling multiple components, merging PL imports, cleaning empty components. Uses `GoSub`/`Return` pattern.
- `ExportExtraCosts()` -- Exports additional/extra costs

**Date/Calendar Functions**:
- `ListMonthBegin/End()`, `ListWeekBegin/End()`, `ListFutureWeekBegin()` -- Callback functions for date picker combo boxes
- `DateToday()`, `DayOfYear()`, `TheQuarter()`, `TheMonth()`, `PreviousDay()`, `ArchivedDate()`

**Math & Conversion Functions**:
- `ConvertedNumber()` -- Number system conversion with fractions (supports feet/inches)
- `LowestCommonDenominator()` -- Fraction simplification
- `CalcString()` -- Expression evaluator (parses mathematical expressions from strings with operators +, -, *, /)
- `CircumCenter()` -- Calculates circumscribed circle center from 3 points
- `RotZ()`, `RotX()` -- 2D/3D rotation transformations
- `VAV()` -- Arc center calculation from degrees
- `Tenths()`, `Hundredths()`, `Thousandths()`, `TenThousandths()` -- Rounding functions

**Null-Safe Utilities**:
- `NNEZ(TheNumber)` -- Null/Nothing/Empty → Zero (used extensively throughout)
- `NNEN(TheString)` -- Null/Nothing/Empty → Null-string
- `NNENull()`, `NNE1()` -- Variant null-safe functions
- `NotNull()`, `NotZero()`, `IsZero()`

**UI/Form Utilities**:
- `EchoOn()`/`EchoOff()`/`EchoNo()` -- Screen painting control
- `StatusBarMessage()` -- Status bar updates
- `SaveRecord()`/`UndoRecord()` -- Record save/undo wrappers
- `PositionForm()`/`PositionWideForm()`/`PositionReport()` -- Window positioning
- `SizeFormTo()`, `setAppSize()`, `setSizeNormal()`, `setSizeLarge()` -- Dynamic window sizing
- `getDisplayHeight()` -- Multi-monitor display detection
- `SetMonitor()` -- Monitor configuration
- `DesignView()`/`DesignReportView()` -- View mode switching
- `FilterForm()` -- Dynamic form filtering
- `Help()`, `HelpOpen()`, `HelpUpdate()` -- Help system
- `MessageOKCancel()`, `MessageOK()`, `MessageYesNo()`, `MessageYesNoCancel()` -- Dialog wrappers

**Variable Storage**:
- `SetVariable(TheName, TheVariable)` -- Global variable store (uses Settings table)
- `Variable(TheName)` -- Global variable retrieval
- `SetLocalVariable(TheName, TheVariable)` -- Local per-workstation variable store
- `LocalVariable(TheName)` -- Local variable retrieval

**Application Lifecycle**:
- `MainMenuLoad()` -- **~143 lines**: Main menu initialization, loads settings, applies user permissions, configures menus
- `DetermineApplication()`, `DetermineRevision()` -- Application/version detection
- `CloseAllForms()`, `HideAllForms()` -- Form lifecycle management
- `SaveLocalVariables()`/`RestoreLocalVariables()` -- Session persistence
- `RestartApplication()`/`RestartApp()` -- Application restart
- `CreateLocalTables()` -- Creates local temporary tables
- `SynchronizeApplication()` -- Manual sync trigger
- `ConnectToDatabase()` -- Database connection

**User/Security**:
- `TheUsername()` -- Gets current Windows user via Win32 API
- `Password()`, `ResourcePassword()` -- Password validation
- `UserIsPartner()`, `UserIsManager()`, `UserIsGeneralManager()`, `UserIsOffice()` -- Role checks
- `UserCurrentlyManager()`, `UserCurrentlyPartner()`, `UserCurrentlyMarketing()` -- Current session role

**Data Helpers**:
- `SQLResult(SQLStatement)` -- Executes SQL and returns single value (heavily used throughout)
- `SQLUpdate(FieldName, TableName, Key, Value)` -- Single-field update helper
- `SetTableData()` -- Generic table field setter
- `DuplicateRecord()` -- Copies entire record to new row
- `ApostropheCheck()`, `NoQuotes()`, `InQuotes()` -- String sanitization for SQL
- `ReplaceQuotation()`, `ReplaceValue()`, `ReplaceText()`, `GetQuotation()` -- String parsing
- `Concatenate()` -- String concatenation with operator

**Resource/Job Data Access**:
- `Resource()`, `ResourceID()`, `ResourceFirstID()` -- Resource lookup
- `ResourceAddress()`, `ResourcePhone()`, `ResourceFax()`, `Resourceemail()`, `Resourceweb()` -- Contact detail lookups
- `CustomerData()`, `ResourceNameAddress()`, `ResourceFirstNameAddress()` -- Composite data retrieval
- `JobData()` -- Job information retrieval
- `ProductName()` -- Product name lookup

**Visio Integration**:
- `ImportVisioDrawing()` -- **~109 lines**: Opens Visio drawings, manages drawing files

**Revit Integration**:
- `RevitUpdateProducts()`, `RevitViewProducts()`, `RevitCheck()` -- Autodesk Revit integration functions

**Miscellaneous**:
- `SelectList()` -- Product list selection logic (~160 lines)
- `RequeryForm()`, `RequeryControl()` -- Form refresh
- `GotoLastForm()`, `GotoParts()`, `GotoCNC()`, `GotoLists()` -- Navigation
- `Pause(ThePause)` -- Timed delay using `Timer`
- `FIsLoaded()` -- Checks if a form is currently open
- `FIsActiveForm()` -- Checks if a form is the active form
- `ErrorLogEntry()`, `ErrorLogReport()`, `ErrorLogClear()` -- Error logging system
- `GetAlternateDisplay()` -- Design alternate display logic (~1000 lines)
- `SageID()` -- Sage accounting integration
- `WebHelp()` -- Opens web-based help
- `SetLog()` -- Activity logging
- `OpenLog()` -- Opens log viewer
- `FaxReport()` -- Fax integration
- `SetScratchPad()` -- Temporary data storage
- `LineFeed()` -- Returns line feed character

#### Parts.txt (5,988 lines, 60 functions)

This is the **computation engine** of the application, handling product list processing, parts generation, drawing creation, CNC programming, and cost calculation.

**Global Variable Declarations (lines 1-300)**: **300 lines** of global/dim declarations including:
- 15+ DAO Recordset variables (`partsSet`, `PPSet`, `CallSet`, `OPSet`, `CNC`, `OptionsSet`, `ProcessSet`, `NoteSet`, `MaterialSet`, etc.)
- 190+ dimensional/positional/drawing globals
- 99-element arrays: `SaveAssemblyX/Y/Z(0 To 99)`, `SaveDrawX/Y/Z(0 To 99)`, `XAbsolutePos(1 To 99)`, `SheetW/L/Stock(1 To 99)`, `PCostAmount/Unit(1 To 99)`
- 999-element arrays: `XPoint(1 To 999)`, `YPoint(1 To 999)`, `ZPoint(1 To 999)`

**Core Functions**:
- `PartsByItem(ItemKey)` -- **~2,250 lines** (lines 1323-3573): The main computation function. Processes a product list item by iterating through its product parts, computing dimensions, costs, CNC data, and drawing coordinates. Contains multiple `GoSub` sections for sub-computations.
- `PartsDraw(ItemKey)` -- **~414 lines** (lines 3574-3987): Generates drawing output for a product list item, handling rotations, scales, dimensions, and AutoCAD script generation.
- `SubScriptCalculation(Script, RoundTo)` -- **~147 lines** (lines 4492-4638): Expression parser/calculator that evaluates scripts containing product dimensions (X, Y, Z, DX, DY, DZ) and mathematical operations.
- `VariableCheck(Script, TheDefault)` -- **~1,050 lines** (lines 4678-5728): The variable resolution engine that substitutes dimension variables, option values, and computed expressions into scripts. Handles conditional logic (`IIf`), function evaluation (`Abs`, `Int`, `Round`, `Min`, `Max`, `Sgn`, `Sqrt`, `Mod`, `Sin`, `Cos`), and nested expressions.
- `GetTheProcesses(...)` -- **~300 lines** (lines 725-1023): Process cost computation with alternate rate support
- `PartCost()` -- **~62 lines** (line 1249): Computes material and process costs for a part
- `GetTheOptions(TheItem)` -- Retrieves options for a product list item
- `GetListOptions(Key)` -- Gets options from the options recordset
- `SetGlobals(ThePartsType, ResetParts)` -- Initializes global variables for computation
- `InitPartList()` -- Initializes the parts list processing context

**Dimensional Functions**:
- `SubDimensionX/Y/Z()` -- Computes relative dimensions based on reference positions
- `AbsoluteXPos()` -- Resolves absolute X positioning
- `XLinePlacement(X1, X2)` / `ZLinePlacement(Z1, Z2)` -- Drawing dimension line placement
- `NoXDuplicateLines(X1, X2)` / `NoZDuplicateLines(Z1, Z2)` -- Prevents overlapping dimension lines
- `ArcCenterDegrees()` / `ArcParse()` -- Arc and curve calculations for drawings

**Drawing Functions**:
- `Print2DTitle()` -- Prints drawing title block
- `PrintLine()` -- Prints text to drawing at specified position
- `PFace()` -- 3D face rendering for drawings

**Cost Functions**:
- `GetQuantity(TheUnit)` -- Unit-based quantity calculation (Linear Foot, Square Foot, Board Foot, Piece, etc.)
- `TheRateAmount()` / `TheRateAmountAlternate()` -- Labor rate retrieval
- `theRateUnit()` -- Rate unit lookup
- `CostUnits()` -- Cost unit validation

**Utility Functions**:
- `MaterialNotNull()`, `PartNotNull()`, `ProcessNotNull()`, `OptionNotNull()`, `OptionDesignNotNull()` -- Null checking for various entity types
- `OptionType()` -- Determines option condition evaluation
- `OptionAlways()` -- Always-apply option logic
- `OptionSummary()` -- Generates option summary text
- `EmbeddedNote()` -- Processes embedded notes in strings
- `Paragraph()` -- Word-wraps text to character limit
- `TheCondition()` -- Evaluates condition strings
- `TheDegrees()` / `TheHypotenuse()` -- Trigonometric calculations
- `GetOptions()` -- Option loading from recordset
- `ProductID()` / `ProductDescription()` -- Product lookup functions
- `ScriptPath()` -- Returns drawing script output path
- `StopExecution()` -- Handles user stop request
- `FieldNumbers()` -- Field index mapping

#### General_Form_Utilities.txt (1,349 lines, 34 functions)

**GapFill() -- Auto-Dimensioning Algorithm (lines 315-840, ~525 lines)**:
The most complex single function in this module. It:
1. Finds the "Wall" product that bookends a group of items
2. Iterates through items between walls
3. Computes cumulative X positions considering absolute/relative positioning, rotation angles, and spacing gaps
4. Handles Z-axis (height) dimensioning
5. Resolves variable-dimension items (items that stretch to fill remaining space)
6. Updates database records with computed dimensions and drawing coordinates
7. Supports multi-pass recomputation for dependent items

**Key utility functions**:
- `TheTotalJobCost()` -- Iterates all product lists for a job and sums TotalCost + PremiumCost
- `CategoryUpdate()` -- When a material category changes, iterates through **ALL** product list records updating Material1-Material16 types (16 repetitive blocks of identical code)
- `CheckMonitor()` -- Verifies monitor settings
- `ControlType(C)` -- Returns control type name via TypeOf chain (15 control types)
- `FControlExists(stFrm$, stCtl$)` -- Checks if a control exists on a form
- `FEditableControl(C)` -- Checks if a control is editable
- `EmptyProductList()` -- Validates product list selection
- `FindCustomer()` -- Navigates to customer from correspondence
- `IDCheck()` / `IDWarning()` / `IDCategoryWarning()` -- Validates product/resource IDs for uniqueness and format
- `SubDefaultDimensions()` -- Sets default X/Y/Z dimensions from product defaults
- `ReportProductDrawings(TheReport)` -- Opens product drawing reports
- `DrawingReport(TheReport)` -- Opens drawing reports
- `ClosePopups()` / `CloseForms()` / `HideWindow()` -- Window management
- `GetNote(Key)` -- Retrieves notes for display
- `OpenParts()` / `OpenProducts()` / `SelectMainMenu()` -- Form navigation
- `Renumber()` (via Records module) -- Renumbers product list items
- `OptionNameFormat(TheOption, TheRequirement)` -- Formats option display string

#### AutoAttach.txt (892 lines, 13 functions)

**AttachDatabase() (lines 20-603, ~583 lines)**:
The startup sequence that:
1. Detects application type (KRH vs. Revit) via path inspection
2. Handles Revit table renaming
3. Checks/repairs Document.mdb (file size monitoring, auto-compaction at 2GB)
4. Synchronizes databases via Jet Replication (`dbRepImportChanges`/`dbRepExportChanges`)
5. Updates satellite applications from server
6. Attaches/re-attaches linked tables from all backend databases
7. Validates table integrity (checks for orphaned/broken links)

**Supporting Functions**:
- `GetSettings()` -- Opens Settings recordset (Key = 1)
- `GetUser()` -- Retrieves current user from `>Local Settings`
- `SetMyDB()` -- Sets global `mydb` database reference
- `CompactDatabase()` -- Database compaction with backup
- `PathToAttachments()` -- Returns attachment file path
- `GetPathToVisio()` -- Reads Visio path from `C:\ACCESS\VisioPath.TXT`
- `GetPathToDatabase()` -- Reads database path from `C:\ACCESS\DatabasePath.TXT`
- `SetPathToDatabase(TheString)` -- Writes database path to file
- `GetPathToServer()` -- Reads server path from `C:\ACCESS\ServerPath.TXT`
- `SetPathToServer()` -- Writes server path to file
- `LocalSettingsLastPath(GetOrSet)` -- Persists last database path to local settings

#### Records.txt (868 lines, 17 functions)

**Record Operations**:
- `CopyandInsertSelection()` -- **~120 lines**: Multi-record copy with insert-after positioning, handles correspondence/option/note duplication
- `CopyItem()` -- **~80 lines**: Copies current record field-by-field to `SaveField(0 To 199)` array
- `PasteItem()` -- **~234 lines**: Pastes from SaveField array, prompts for correspondence/option/note transfer
- `InsertItem(TheType)` -- **~75 lines**: Inserts new record at current position
- `InsertItems()` -- Batch insert mode
- `RecDelete()` -- Record deletion with confirmation
- `RecNew()` -- New record creation
- `RecGotoFirst/Last/Next/Prev()` -- Record navigation with bounds checking

**Supporting Functions**:
- `RequeryNote()` / `RequeryPopups()` -- Refreshes note and option subforms
- `Renumber()` -- Renumbers all items sequentially
- `CheckGanttCharts()` -- Validates Gantt chart data
- `ErrorInProgress()` -- Error state checking
- `DataButton(CategoryData)` -- Data category button handler

#### CNC.txt (632 lines, 6 functions)

- `PartsTransmit()` -- **~297 lines**: Main transmit workflow; validates paths, creates output folders, iterates CNC records, generates DXF/Xilog/LIST files
- `TransmitBegin(TheProgram, TheMessage, TheID, TheItem, PartEntry)` -- **~200 lines**: Starts a new CNC program file, writes header
- `TransmitResume(...)` -- Continues adding to existing program
- `TransmitEnd(Machine, ProgramList)` -- Closes program file, writes footer
- `SequenceEnd()` -- Ends current sequence
- `ShortenProgramName(TheText)` -- Truncates program names to 8 characters (DOS filename compatibility)

### Global Variable Census

| Module | Approximate Global Variables |
|--------|------------------------------|
| `Common.txt` | ~30 (plus extensive Win32 types) |
| `Parts.txt` | **~190** (plus arrays) |
| `General_Form_Utilities.txt` | ~30 |
| `Records.txt` | ~12 |
| `CNC.txt` | ~18 |
| `AutoAttach.txt` | ~8 |
| `FormsCode.txt` | ~22 |
| **Total** | **~310+** |

### Code Patterns

**Common Patterns Used**:
1. **DAO Recordset Iteration**: `Set myset = mydb.OpenRecordset(SQL)` → `myset.MoveFirst` → `Do Until myset.EOF` → `myset.MoveNext` → `Loop`
2. **Error Handling**: `On Error GoTo ErrorLabel` with `Resume` / `Resume Next`
3. **GoSub/Return**: Inline subroutines within large functions (especially in `ExportComponentCosts` and `PartsByItem`)
4. **Global State**: Functions communicate via global variables rather than parameters
5. **Screen.ActiveForm**: Runtime form detection for context-sensitive behavior
6. **StatusBarMessage**: Progress feedback during long operations
7. **NNEZ()/NNEN()**: Null-safe wrappers used on virtually every data access
8. **LocalVariable()/SetLocalVariable()**: Key-value session storage in Local Settings table
9. **Variable()/SetVariable()**: Key-value global storage in Settings table
10. **FIsLoaded()**: Form-open detection before operations

---

## 5. Forms and Their Purposes

### 60 Forms Total

#### Core Application
| Form | Record Source | Purpose |
|------|-------------|---------|
| **`MainMenu`** | `>Main Menu Query` | Application dashboard and navigation hub. Timer-driven, with menu bars for all major functions. Contains startup detection and session initialization |
| **`Startup`** | None | Splash screen shown during database attachment and synchronization. Displays progress via `Label.Caption` and `Repaint` |
| **`SelectDatabase`** | `>Select Database Query` | Allows user to choose which database path to connect to |
| **`Password`** | None | Application-level password entry |

#### Job Management
| Form | Record Source | Purpose |
|------|-------------|---------|
| **`Job`** | `>JobFormQuery` | Job creation and editing. Job name combo box, customer assignment, manager/engineer selection. Custom menu bar: `MenuFileJobs` |
| **`JobSubForm`** | `>JobSubFormQuery` | Sub-form embedded in Job form for job detail records |
| **`JobCostForm`** | Cost queries | Job cost analysis by category |
| **`JobCostItemForm`** | Cost item queries | Detailed item-level cost breakdown |
| **`JobCostSummaryForm`** | Cost summary queries | Aggregated job cost summary |
| **`JobCostSummaryFormNull`** | None | Empty cost summary placeholder |

#### Product Design & Engineering
| Form | Record Source | Purpose |
|------|-------------|---------|
| **`Products`** | `>Product Query` | Product catalog management. Filtered by `Products.CategorySort` and `Products.ProductType`. Custom menu bar: `MenuFileParts` |
| **`ProductListMaster`** | None | **Container form** hosting `ProductList` as subform control (`ProductListControl`), plus option/note subform controls. Central hub for product list operations |
| **`ProductList`** | `>Product List Whole Query` | **Most complex form** (~483K binary). The core bill of materials interface showing items with dimensions, materials, positions. Shortcut menu: `MenuShortcutProductList`. Timer event for auto-refresh |
| **`PartsList`** | Parts list queries | Parts list viewer with CNC transmit integration and "Stop Execution" button |
| **`Designs`** | Designs queries | Design configuration management |
| **`DesignSubForm`** | `DesignSubForm Query` | Design detail sub-form |
| **`Material`** | Material queries | Material catalog editor with standard/alternate designation |
| **`Materials`** | Materials queries | Materials list view |
| **`ImportProductList`** | None | Import utility for product lists from external sources |
| **`DeleteProductList`** | None | Product list deletion with confirmation |

#### CNC
| Form | Record Source | Purpose |
|------|-------------|---------|
| **`CNC`** | `>CNC Query` | CNC programming interface. CNCMachine selection, function/tool/sequence management. RecordsetClone used for transmit operations |

#### Drawings
| Form | Record Source | Purpose |
|------|-------------|---------|
| **`Drawings`** | `>Drawings Query` | Drawing management form with resource category filtering |
| **`DrawingSetup`** | `>Drawing Setup Query` | Drawing configuration (font, scale, debug settings) |
| **`DrawingAid`** | Wall dimension queries | Drawing aid for wall dimensioning |
| **`DrawingLine`** | None | Drawing line configuration |
| **`ProductDrawings`** | Product drawing queries | Product drawing viewer |

#### Sales/Financial
| Form | Record Source | Purpose |
|------|-------------|---------|
| **`ContractSubForm`** | `>ContractSubForm Query` | Sales contract/agreement sub-form |
| **`CostSubForm`** | `CostSubForm Query` | Cost breakdown sub-form |
| **`EstimateSubForm`** | None | Estimate detail sub-form |
| **`ProposalSubForm`** | `>ProposalSubForm Query` | Proposal detail sub-form |
| **`Premium`** | Premium queries | Premium/surcharge management |
| **`Premium_SubForm`** | None | Premium detail sub-form |
| **`PremiumAttachment`** | None | Premium attachment handler |
| **`PremiumSQL`** | None | Premium SQL configuration |
| **`zzPremiumSQL`** | None | Legacy/backup premium SQL form |

#### Time Entry
| Form | Record Source | Purpose |
|------|-------------|---------|
| **`EnterTime`** | Time entry queries | Employee weekly time entry with day-of-week columns, job assignment, and notes per day |

#### Correspondence
| Form | Record Source | Purpose |
|------|-------------|---------|
| **`Letter`** | Correspondence queries | Letter composition and management |
| **`Fax`** | Correspondence queries | Fax document management |
| **`Memo`** | Correspondence queries | Memo management |
| **`MemoSubForm`** | None | Memo detail sub-form |

#### Notes & Options
| Form | Record Source | Purpose |
|------|-------------|---------|
| **`Note`** | Note queries | Note viewer/editor |
| **`NoteSearch`** | Note search queries | Note search interface |
| **`NoteSubForm`** | None | Note list sub-form |
| **`Options`** | Options queries | Product list item options manager |
| **`OptionRequirement`** | None | Option requirement editor |

#### Resources
| Form | Record Source | Purpose |
|------|-------------|---------|
| **`ResourcePassword`** | None | Resource-level password entry |

#### System/Utility
| Form | Record Source | Purpose |
|------|-------------|---------|
| **`Help`** | `>Help Query` | In-app help viewer with category filtering |
| **`HelpEdit`** | None | Help content editor |
| **`Guide`** | `Guide Query` | User guide viewer |
| **`Log`** | None | Activity/error log viewer |
| **`Message`** | None | Message display form |
| **`Parser`** | None | Expression parser/tester (likely development tool) |
| **`ProblemLog`** | None | Issue/bug tracking form |
| **`ColumnSetup`** | None | Column configuration utility |
| **`Rename`** | None | Rename utility |
| **`Spreadsheets`** | `>Spreadsheets Query` | Spreadsheet integration (OLE) |
| **`Word_Document`** | None | Word document integration |
| **`VariableSubForm`** | None | Variable inspector sub-form |
| **`Stop_Execution`** | None | Execution stop control |
| **`Startupold`** | None | Legacy startup form (retained) |

---

## 6. Reports and Their Purposes

### 111 Reports Total

#### Parts List Reports (13 reports)
| Report | Purpose |
|--------|---------|
| `Part_List_by_Component` | Parts organized by component type |
| `Part_List_by_Component_X_Sort` | Parts by component with X-dimension sorting |
| `Part_List_by_Item` | Parts organized by product list item number |
| `Part_List_by_Item_Copy` | Copy version of parts by item |
| `Part_List_by_Item_X_Sort` | Parts by item with X-dimension sorting |
| `Part_List_by_Material` | Parts organized by material type |
| `Part_List_by_Material_Usage` | Material usage summary |
| `Part_List_by_Material_X_Sort` | Material report with X-dimension sorting |
| `Part_List_by_Material_Z_Usage` | Material Z-usage variant |
| `Part_List_Rip_Report` | Material rip-cut optimization report |
| `Parts_List_Material_Report` | Material cost report |
| `Parts_List_Multiples_Report` | Multiple/duplicate parts report |
| `Parts_List_Process_Report` | Process/labor cost report |

#### Product List Reports (8 reports)
| Report | Purpose |
|--------|---------|
| `Product_List` | Standard product list (bill of materials) |
| `Product_List_Cost_by_Room` | Costs broken down by room/reference |
| `Product_List_Costs` | Detailed cost report |
| `Product_List_Cover_Page` | Cover page for product list package |
| `Product_List_Drawing_Notes` | Drawing notes associated with list |
| `Product_List_Notes` | Item notes report |
| `Product_List_Premium` | Premium/surcharge detail |
| `Premium_SubReport` / `Premium_SubReport_Copy` | Premium sub-reports |

#### Product Reports (4 reports)
| Report | Purpose |
|--------|---------|
| `Product_Drawings` | Product drawing catalog |
| `Product_Specs` | Product specifications |
| `Product_Specs_Material` | Material-specific specifications |
| `Product_Specs_old` | Legacy specifications format |

#### Sales & Financial Reports (34 reports)
| Report | Purpose |
|--------|---------|
| **Invoice Reports** | |
| `Sales_Invoice_Report` | Master invoice report |
| `Sales_Invoice_Report_old` | Legacy invoice format |
| `Sales_Invoice_SubReport_Agreement` | Agreement section of invoice |
| `Sales_Invoice_SubReport_Invoices` | Invoice line items |
| `Sales_Invoice_SubReport_Payments` | Payment history |
| `Sales_Invoice_SubReport_Refunds` | Refund detail |
| `Sales_Invoice_SubReport_Terms` | Payment terms |
| `Sales_Invoice_SubReport_Additional` | Additional charges |
| `Sales_Invoice_SubReport_Statement_Invoices` | Statement invoice lines |
| `Sales_Invoice_SubReport_Statement_Payments` | Statement payment lines |
| **Statement Reports** | |
| `Sales_Statement_Report` | Customer statement |
| `Sales_Weekly_Statement_Report` | Weekly statement |
| **Agreement & Proposal Reports** | |
| `Sales_Report` | Master sales report |
| `Sales_Total_Report` | Total sales summary |
| `Sales_Agreement_Subform` | Agreement sub-report |
| `Sales_Printout_Report` | Sales printout |
| `Sales_Payments` | Payment summary |
| `Sales_Underfunded` | Under-funded jobs (receivable > agreement) |
| **Job Status Reports** | |
| `Sales_Active_Jobs` | Currently active jobs |
| `Sales_Active_Estimates` | Active estimates |
| `Sales_Estimates_Report` | All estimates |
| `Sales_Estimates_Trend_Report` | Estimate trend analysis |
| `Sales_Incomplete_Estimates_Report` | Incomplete estimates |
| `Sales_Not_Audited` | Unaudited sales entries |
| `Sales_Not_Posted` | Unposted invoices |
| `Sales_Sale_Not_Posted` | Unposted sales |
| **Design Cost Reports** | |
| `Sales_Design_Costs_Report` | Design costs by job |
| `Sales_Total_Design_Cost_Report` | Total design cost summary |
| `Sales_Design_Invoice_Report` | Design-only invoices |
| `Sales_Design_Invoice_Report_by_Designer` | Design invoices by designer |
| `Sales_Design_Log_Report` | Design hours log |
| `Sales_Design_Weekly_Report` | Weekly design summary |
| **Per-Resource Reports** | |
| `Sales_Architect_Subform` / `Sales_Architect_Design_Cost_Subform` | Architect billing |
| `Sales_Contractor_Subform` | Contractor billing |
| `Sales_Customer_Subform` | Customer billing |
| `Sales_Interior_Designer_Subform` | Interior designer billing |
| `Sales_by_Resource_Report` | Sales grouped by resource |
| **Other** | |
| `Sales_Job_Hours_Report` | Hours by job |
| `SalesVOJC_Report` | Value of Jobs Completed |
| `Receivables_Report` | Accounts receivable aging |

#### Schedule Reports (8 reports)
| Report | Purpose |
|--------|---------|
| `Sales_Schedule` | Master project schedule |
| `Sales_Schedule_by_Partner` | Schedule by partner |
| `Sales_Schedule_copy` | Schedule copy variant |
| `Sales_Approval_Schedule` | Approval milestone schedule |
| `Sales_Delivery_Schedule` | Delivery schedule |
| `Sales_Production_Schedule` | Production schedule |
| `Sales_Engineering_Schedule` | Engineering schedule |
| `Sales_Jobs_No_Schedule` | Jobs missing schedule data |
| `Workflow_Schedule` | Workflow schedule |
| `Workflow_Engineer_Schedule` | Engineer workflow schedule |

#### Resource Reports (5 reports)
| Report | Purpose |
|--------|---------|
| `Resources_Report` | Resource directory |
| `Resources_Labels` | Standard mailing labels |
| `Resources_Plain_Labels` | Plain format labels |
| `Resources_Small_Labels` | Small format labels |
| `Resources_Notes_Report` | Resource notes |

#### Survey Reports (5 reports)
| Report | Purpose |
|--------|---------|
| `Surveys` | Master survey report |
| `SurveyCompletedJobs` | Completed jobs survey results |
| `SurveyCompletedJobsGraphic` | Graphical survey results |
| `SurveyWIP` | Work-in-progress surveys |
| `SurveysIncomplete` | Incomplete surveys |

#### Time Reports (3 reports)
| Report | Purpose |
|--------|---------|
| `Time` | Summary time report |
| `Time_Detailed` | Detailed time by employee/job |
| `TimeErrors` | Time entry error report |

#### Other Reports
| Report | Purpose |
|--------|---------|
| `ReportTemplate` | Base report template |
| `SearchListNotes` | Note search results |
| Various ADP/GL reports | ADP payroll, GL receivables, job profit |

---

## 7. Key Queries and What They Do

### 518 Queries Total

Queries are organized by naming convention:
- **`#` prefix**: Specialized cross-reference queries
- **`*` prefix**: Core financial aggregation queries (materialized views)
- **`>` prefix**: Linked/form-bound queries (majority of queries)
- **No prefix**: Standalone/report queries

### Financial Core Queries

**`*ARJobQuery2`** -- Accounts Receivable Aging (the central AR query):
```sql
SELECT [>Jobs].ID, [MIS Personnel].Employee, 
    [*InvoicesQuery2].Invoices, [*PaymentsQuery2_1].Payments,
    NNEZ([invoices])-NNEZ([payments])+NNEZ([DebitAmount]) AS Balance,
    IIf([Balance]>0,[Balance],0) AS DrBal,
    IIf([days]<31,[drbal],0) AS Under,
    IIf([days]>30 And [days]<61,[drbal],0) AS [30],
    IIf([days]>60 And [days]<91,[drbal],0) AS [60],
    IIf([days]>90 And [days]<121,[drbal],0) AS [90],
    IIf([days]>120,[drbal],0) AS [120]
-- Computes 5-bucket aging for all open non-estimate jobs
```

**`*InvoicesQuery2`** -- Invoice totals per job:
```sql
SELECT [>Jobs].ID, Sum([Sales Journal].InvoiceAmount) AS Invoices,
    Max([Sales Journal].Due) AS MaxOfDue
FROM [>Jobs] LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job
WHERE [Sales Journal].Due Is Not Null
GROUP BY ... HAVING [>Jobs].Closed=False AND [>Jobs].Estimate=False
```

**`*PaymentsQuery2`** -- Payment totals per job:
```sql
SELECT [>Jobs].ID, Sum([Receipts Journal].Amount) AS Payments,
    Max([Receipts Journal].CheckDate) AS MaxOfCheckDate
FROM [>Jobs] LEFT JOIN [Receipts Journal] ON [>Jobs].Key=[Receipts Journal].Job
GROUP BY ... HAVING [>Jobs].Closed=False AND [>Jobs].Estimate=False
```

**`*RefundQuery`** -- GL refund transactions:
```sql
SELECT ... FROM [>General Ledger Query]
WHERE SourceTransaction="refund" AND AccountNumber=121
```

**`GLReceiptsQuery`**, **`GLReceivableQuery`**, **`GLSalesQuery`** -- GL account views

**`SalesSummarybyJob`**, **`SalesSaleSummarybyJob`**, **`SalesInvoiceSummarybyJob`**, **`SalesProposalSummarybyJob`** -- Job-level sales aggregations

### Product/Engineering Queries

**`>Product List Whole Query`** -- The primary product list data source (most complex):
```sql
SELECT [>Product List].*, [>Products].Category, [>Product Lists].ProductList,
    [>Product Lists].Job, [>Products].Description, [>Product Lists].Text1,
    [>Product Lists].IncludeInEstimate
FROM ([>Product List] LEFT JOIN [>Products] ON Product=[>Products].Key) 
    LEFT JOIN [>Product Lists] ON ProductListKey=[>Product Lists].Key
WHERE ProductListKey=Forms!ProductListMaster!ProductListControl!ProductListName
ORDER BY Item, Reference1
```

**`>Product List Whole SQL Query`** -- Extended version with Reference1/Reference2 filtering:
```sql
-- Adds IIf-based Reference1 and Reference2 filters from form controls
```

**`>Product Query`** -- Product catalog filtered by current form selection:
```sql
SELECT [>Products].* WHERE Key=Forms!Products.CategorySort 
    AND ProductType=Forms!Products.ProductType
```

**`>Product Sales Category Query`** -- Active product categories (excluding obsolete, utility, drawing appliance, and z-prefixed):
```sql
SELECT Category FROM [>Products] WHERE ProductType="Product" 
    AND Left(Category,1)<>"z" AND Category<>"Obsolete" 
    AND Category<>"Utility" AND Category<>"Drawing Appliance"
    AND HideInPLList=False
```

**`>Alternates Query`** -- Design alternates for current product list:
```sql
SELECT Alternate, ProductListKey FROM [>Designs]
WHERE ProductListKey=Forms!ProductListMaster!ProductListControl!ProductListName
```

### CNC Queries

**`>CNC Query`** -- Main CNC data source (joins CNC records with product list)

**`>CNC Compute Subassembly Query`** -- Subassembly grouping for CNC:
```sql
SELECT SubAssembly, First(Sequence) FROM [>Product Parts CNC]
WHERE Category=Forms!ProductListMaster!ProductListControl!Product 
    AND CNCMachine=Forms!CNC.CNCMachine
GROUP BY SubAssembly ORDER BY First(Sequence)
```

**`>CNC Function Query`**, **`>CNC Machine Query`**, **`>CNC Machines Query`** -- CNC configuration lookups

### Resource Queries

**`>Customers Query`** / **`>Architect Query`** / **`>Contractor Query`** / **`>Designers Query`** / **`>Builders Query`** -- Category-filtered resource lists:
```sql
-- Pattern: SELECT ID, Key FROM [>Resources] 
-- WHERE Category="<type>" ORDER BY ID
```

**`>Resources All Query`**, **`>Resources By Category Query`**, **`>Resources By Comment Query`**, **`>Resources Filtered Query`** -- Various resource views

### Job Queries

**`>JobFormQuery`** -- Main job form data source
**`>Jobs Query`** -- Full jobs listing
**`>Job Cost Query`** / **`>Job Category Cost Query`** / **`>Job Costs Summary Query`** -- Cost analysis
**`>Job Hours Cost Query`** / **`>Job Hours Design Cost Query`** / **`>Job Hours Project Cost Query`** -- Hours-based cost analysis
**`>Job Product List Query`** / **`>Jobs Product List Query`** -- Product lists per job
**`>Job Production Phase Query`** -- Phase-based job listing with PhaseSort

### Schedule Queries

**`>Schedule SubForm Query`** -- Schedule with workflow phase integration:
```sql
SELECT Task, TaskEnd, PercentComplete, Phase, Employee
FROM ProjectSchedule LEFT JOIN (WorkFlow LEFT JOIN [>Jobs]...) 
WHERE PercentComplete<100
```

**`>SalesSchedule by Partner Query`** -- Schedule by partner with production phase sorting

### Time/Hours Queries

**`>Hours Entry Personnel Query`** / **`>Hours Entry Locked Personnel Query`** -- Personnel for time entry
**`>Time Summary Query`** / **`>Time Detail Query`** / **`>Time Company Summary Query`** -- Time aggregations
**`>Time ADP Summary Query`** -- ADP payroll export
**`Hours Glitch` / `Hours Glitch 2-4`** / **`Hours Glitch Good MIS`** / **`Hours Glitch Job Hour`** / **`Hours Glitch MIS Hours`** / **`Hours Glitch Missing Record`** -- **7 data integrity queries** that detect mismatched hour totals

### Correspondence Queries

**`>Correspondence Query`** with sub-queries -- Filtered correspondence views
**`>Correspondence Template Query`** / **`>Correspondence Templates Query`** -- Template management
**`>Correspondence Archive Subform Query`** -- Archived correspondence

### Survey Queries

**`>Survey Query`**, **`>Survey Question Query`**, **`>Survey Questions Query`** -- Survey configuration
**`>Survey Completed Jobs Query`** / **`>Survey Completed Summary Query`** -- Results
**`>Survey Summary Incomplete Query`** -- Incomplete survey tracking

### WIP (Work in Progress) Queries

**`WIP Design Phase Query`** / **`WIP Shop Phase Query`** / **`WIP Installation Phase Query`** / **`WIP Stored Phase Query`** -- WIP by phase with sales totals
**`WIP Design/Shop/Installation/Stored Phase Total Query`** -- Phase totals
**`WIP Total Query`** -- Cross-joins all phase totals for summary
**`WIP Jobs`** / **`WIP Jobs WorkFlow`** -- WIP with workflow integration

### Naming Pattern Queries

**`Query1` through `Query9`** -- **Unnamed maintenance/ad-hoc queries** that remain in the database (technical debt):
- `Query1`: Part list process activity validation
- `Query2`: Email extraction with comments
- `Query3`: Hours day-total mismatch detection
- `Query4`: Products with alternate processes
- `Query5`: Hardcoded product list key lookup (key=83)
- `Query6`: Component grouping for current product list
- `Query7`: Hardcoded date search (InStr "8.10.15")
- `Query8`: Orphaned designs detection
- `Query9`: Correspondence-linked product list items

**`Unrelated Designs`** / **`Unrelated Materials`** -- Orphan detection queries

---

## 8. Technical Debt and Concerns

### Critical Issues

#### 8.1 No Database-Level Relationships
- **Impact**: HIGH
- **Details**: `relationships.json` is completely empty. No foreign keys, no referential integrity constraints, no cascade delete/update rules.
- **Risk**: Orphaned records, data inconsistency, no protection against accidental deletion of referenced records.
- **Evidence**: Orphan detection queries exist (`Unrelated Designs`, `Unrelated Materials`), confirming this is a known problem.

#### 8.2 No Primary Keys on Local Tables
- **Impact**: MEDIUM
- **Details**: All 5 local tables have `primary_key: []` in `schema.json`. Only `CopyRight` has a COUNTER field.
- **Risk**: Potential duplicate records, no guaranteed unique identification.

#### 8.3 Massive Global Variable State (~310+ globals)
- **Impact**: HIGH
- **Details**: 
  - `Parts.txt`: ~190 globals including 15+ DAO recordset references, 99-element arrays, and 999-element arrays
  - `Common.txt`: ~30 globals for application state
  - `General_Form_Utilities.txt`: ~30 globals for form state
  - `Records.txt`: ~12 globals for copy/paste state
  - `CNC.txt`: ~18 globals for transmit state
  - `FormsCode.txt`: ~22 globals for form-specific state
- **Risk**: Unpredictable side effects, impossible to unit test, difficult to reason about program state.

#### 8.4 Hardcoded File Paths
- **Impact**: HIGH
- **Details**:
  - `"C:\Database\"` -- Default database path (AutoAttach lines 139, 162, 277, 413, 421, etc.)
  - `"C:\ACCESS\"` -- Application path (AutoAttach line 199)
  - `"C:\ACCESS\DatabasePath.TXT"` -- Database path config file
  - `"C:\ACCESS\ServerPath.TXT"` -- Server path config file
  - `"C:\ACCESS\VisioPath.TXT"` -- Visio path config file
  - `"c:\access\ip.txt"` -- Temporary IP file (Common line 278)
  - `"\\cmsbs"` -- Default server name
  - `"\\KRHServer\Access\"` -- Alternate server path
  - `ServerPath & "\Access\Database 2000\"` -- Server database directory
  - `ServerPath & "\Access\Access 2000\"` -- Server application directory
- **Risk**: Application breaks if deployed to any machine without exact path structure.

#### 8.5 Hardcoded Employee Names
- **Impact**: MEDIUM
- **Details**:
  - `InStr(TheUsername, "Weeke")` -- Special bypass for user "Weeke" (AutoAttach lines 87, 186)
  - `TheUsername = "Bill"` / `TheUsername <> "Bill"` -- Special handling for "Bill" (AutoAttach lines 197, 230)
  - `InStr(TheUsername, "Jim")` -- Special handling for "Jim" (AutoAttach, commented out)
  - `InStr(TheUsername, "Time") And InStr(TheUsername, "Card")` -- Time card station detection (AutoAttach lines 135, 177, 410, 446)
- **Risk**: Application behavior depends on specific Windows usernames; any staff change requires code modification.

#### 8.6 Date-Based Logic Bombs
- **Impact**: MEDIUM
- **Details**:
  - `Year(Date) > 2007` (AutoAttach line 132) -- Condition always true since 2008
  - `Month(Date) > 8` (AutoAttach line 133) -- Seasonal logic?
  - `Day(Date) > 8` (AutoAttach line 134) -- Day-of-month logic?
  - These appear in a nested `If/ElseIf` chain controlling whether certain sync operations run
- **Risk**: Dead code or unintended behavior; original intent unclear.

#### 8.7 Monolithic Code Structure
- **Impact**: HIGH
- **Details**:
  - `Common.txt` at **6,795 lines** contains networking, UI, data access, math, cost export, application lifecycle, user management, and more
  - `Parts.txt` at **5,988 lines** contains the entire parts computation engine, drawing generation, CNC programming, and cost calculation
  - `PartsByItem()` alone is ~2,250 lines
  - `VariableCheck()` is ~1,050 lines
  - `GapFill()` is ~525 lines
  - `AttachDatabase()` is ~583 lines
  - `ExportComponentCosts()` is ~386 lines
- **Risk**: Nearly impossible to maintain, test, or refactor without risk of breaking unrelated functionality.

#### 8.8 GoTo/GoSub Spaghetti Code
- **Impact**: HIGH
- **Details**: Extensive use of:
  - `GoTo` for error handling AND control flow
  - `GoSub`/`Return` for inline subroutines (especially in `ExportComponentCosts`, `PartsByItem`)
  - `Resume` / `Resume Next` for error recovery
  - Multiple error labels within single functions
  - Example from `CopyandInsertSelection`: `GoTo GetNextControl` inside a loop with `ControlError:` label jumping to `ControlErrorResume:` label
- **Risk**: Extremely difficult to follow execution flow; logic errors easy to introduce.

#### 8.9 Error Suppression
- **Impact**: HIGH
- **Details**: Extensive use of `On Error Resume Next` without subsequent error checking:
  - `AutoAttach.txt`: Lines 267, 494, and throughout
  - `Drawing.txt`: Line 5 (`On Error Resume Next` as first line)
  - `General_Form_Utilities.txt`: Used in multiple utility functions
  - `ResizeAPP.txt`: Line 34
- **Risk**: Errors are silently swallowed, making debugging nearly impossible and potentially causing data corruption.

#### 8.10 File I/O for Configuration
- **Impact**: MEDIUM
- **Details**: Configuration stored in plain text files using classic VBA file I/O:
  - `Open "C:\ACCESS\DatabasePath.TXT" For Input As #2` / `Input #2, ThePath` / `Close #2`
  - `Open "C:\ACCESS\ServerPath.TXT" For Output As #2` / `Print #2, ThePath` / `Close #2`
  - `Open "C:\ACCESS\VisioPath.TXT" For Input As #2`
  - CNC output: `Open TheFile For Output As #7` / `Print #7, ...`
  - AutoCAD: `Print #1, "DIMTXT " & g_TextSize`
- **Risk**: File corruption, path dependency, no concurrent access control.

#### 8.11 Code Duplication
- **Impact**: MEDIUM
- **Details**:
  - `CategoryUpdate()` in `General_Form_Utilities.txt` has **16 nearly identical blocks** for Material1-Material16, each differing only in field name
  - CNC path validation code duplicated between `PartsTransmit()` and `TransmitBegin()`
  - DXF/List output code has extensive copy-paste patterns
  - Multiple query variants with minor differences (e.g., `>Products Report PL Drawing Query` vs `>Products Report PL Products Drawing Query` vs `>Products Report PL Options Drawing Query` vs `>Products Report PL Designs Drawing Query`)
- **Risk**: Bug fixes must be applied in multiple places; divergence over time.

#### 8.12 Unnamed/Undocumented Queries
- **Impact**: LOW-MEDIUM
- **Details**: `Query1` through `Query9` have no descriptive names. Some contain hardcoded values:
  - `Query5`: `WHERE [>Product Lists].Key=83` (hardcoded key)
  - `Query7`: `InStr([ProductList],"8.10.15")` (hardcoded date string)
  - `Weekly Dates`: `SELECT;` (empty query)
- **Risk**: Unknown purpose queries may be unused but retained, or may be critical but undocumented.

#### 8.13 Inconsistent Naming Conventions
- **Impact**: LOW
- **Details**:
  - Table prefixes: `>` (linked), `*` (computed), `#` (special)
  - Query names: Mix of PascalCase (`SalesSummarybyJob`), spaces (`Sales Job Names by Phase`), underscores (SQL file names), prefixes
  - VBA variables: Mix of Hungarian notation (`TheString`, `mydb`, `myset`), `g_` prefix for globals, and unprefixed globals
  - Form names: No consistent prefix, mix of `Form_` references and direct `Forms!` access
  - Typo: `>Procuct List Query` (should be "Product"), `>Atachments Required Query` (should be "Attachments"), `Sales_Prided_Too_High_Trend` (should be "Priced")
- **Risk**: Code readability and maintenance difficulty.

#### 8.14 Screen.ActiveForm Dependencies
- **Impact**: MEDIUM
- **Details**: Throughout the codebase, functions use `Screen.ActiveForm` and `Screen.ActiveControl` to determine context:
  - `If Screen.ActiveForm.Name = "CNC" Then...`
  - `If InStr(Screen.ActiveForm.Name, "Master") <> 0 Then...`
  - `Screen.ActiveControl.ControlName = "X"`
  - Queries reference `Forms!ProductListMaster!ProductListControl!ProductListName` directly
- **Risk**: Functions break if called from unexpected forms; tight coupling between UI and logic.

#### 8.15 2GB File Size Limitation
- **Impact**: MEDIUM
- **Details**: Code explicitly handles Document.mdb approaching 2GB:
  - `If s > 2000000000 Then` (AutoAttach line 416)
  - `If s > 1950000000 Then` (AutoAttach line 435)
  - Prompts user to compact, performs `DBEngine.CompactDatabase`
- **Risk**: MDB files approaching the Access 2GB limit, requiring active monitoring and compaction.

---

## 9. Integration Points

### External Database Files (Jet/MDB)

| Database | Location | Sync Method | Direction |
|----------|----------|-------------|-----------|
| `Products.mdb` | `C:\Database\` + `\\server\Access\Database 2000\` | Jet Replication | Bidirectional |
| `MIS.mdb` | Same | Jet Replication | Bidirectional |
| `Document.mdb` | Same | Jet Replication + File Copy | Bidirectional |
| `Resource.mdb` | Same | Jet Replication | Bidirectional |
| `Settings.mdb` | Same | Jet Replication | Bidirectional |
| `Lists.mdb` | Same | Jet Replication | Import only |
| `APC.mdb` | Same | File Copy (revision-based) | Server → Local |
| `APCSet.mdb` | Same | Local | N/A |

### Network Infrastructure

| Component | Technology | Details |
|-----------|-----------|---------|
| File Server | Windows SMB/UNC | `\\cmsbs` or `\\KRHServer\Access\` |
| Server Connectivity | Winsock (`wsock32`) | `ConnectedToServer()` checks network availability |
| IP Resolution | Winsock + iphlpapi.dll | `LocalIPAddress()`, `GetPublicIP()`, `GetHostNameFromIP()` |
| DHCP Detection | `iphlpapi.dll` | `DhcpServerAddress()` for adapter information |
| URL Download | `urlmon.dll` | `URLDownloadToFile` for remote file retrieval |
| Cache Management | `Wininet.dll` | `DeleteUrlCacheEntry` for fresh downloads |

### CAD/Design Applications

| Application | Integration Method | Details |
|-------------|-------------------|---------|
| **AutoCAD** | Script file generation | Writes `.SCR` files with AutoCAD commands via `Print #1`. Sets dimension styles, UCS, text styles, snap, elevation, thickness. Generates drawing entities (lines, text, arcs, dimensions). Commented-out OLE Automation code suggests earlier direct API integration was abandoned. |
| **Visio** | OLE Automation / File reference | `ImportVisioDrawing()` manages Visio drawing files. Path configured via `C:\ACCESS\VisioPath.TXT`. Reference to `Visio.exe` at `C:\Program Files\Microsoft Office\Visio10\`. Used for shop drawings and Gantt schedule charts. |
| **Autodesk Revit** | Table linking + data sync | `RevitUpdateProducts()`, `RevitViewProducts()`, `RevitCheck()`. Separate `>Revit Products` tables and `>AttachRevitLists` configuration. Supports running in "Revit mode" via `g_databaseChoice = "Revit"`. |

### CNC Machines

| Machine | File Format | Output Path |
|---------|-------------|-------------|
| NB3615 | TXT (cut list) | `<ListPath>\LIST\` |
| Xilog | PGM/TXT | `<XILOGPath>\XILOG\` |
| Xilog FF | PGM/TXT | `<XILOGFFPath>\XILOG FF\` |
| DXF (all machines) | DXF | `<DXFPath>\DXF\` |

Output paths are configurable via `LocalVariable("Form_CNC_ListPath")`, `LocalVariable("Form_CNC_DXFPath")`, `LocalVariable("Form_CNC_XILOGPath")`, `LocalVariable("Form_CNC_XILOGFFPath")`.

### Payroll / Accounting

| System | Integration Method | Details |
|--------|-------------------|---------|
| **ADP Payroll** | Data fields | `MIS Personnel.ADPFile` stores ADP file numbers. `>MIS ADP Hours Code Query`, `>Time ADP Summary Query` for payroll export data. `ADP` and `ADPHours` reports. |
| **Sage** | ID mapping | `SageID(TheID)` function for Sage accounting system integration |

### Microsoft Office

| Application | Integration Method | Details |
|-------------|-------------------|---------|
| **Word** | OLE/Form reference | `Word_Document` form for document generation |
| **Excel/Spreadsheets** | OLE embedding | `Spreadsheets` form with `>Spreadsheets OLE Query`. Correspondence attachments can be spreadsheets. |

### Filesystem

| Technology | Usage |
|------------|-------|
| `Scripting.FileSystemObject` | File copying (`fs.copyfile`), folder creation (`fs.createfolder`), file existence (`fs.folderexists`), file size checking (`fs.GetFile(...).Size`) |
| VBA `Open/Close/Print/Input` | Configuration file I/O, CNC output, AutoCAD script output |
| VBA `Dir()` | File existence checking |
| VBA `Kill` | File deletion |
| VBA `Name ... As ...` | File renaming |
| `DBEngine.CompactDatabase` | MDB file compaction |

### Windows APIs

| DLL | Functions Used | Purpose |
|-----|---------------|---------|
| `User32.dll` | `FindWindow`, `GetWindowRect`, `SetWindowPos`, `GetSystemMetrics`, `EnumDisplayDevices`, `EnumDisplaySettings` | Window management, display detection |
| `advapi32.dll` | `GetUserNameA` | Current user detection |
| `kernel32.dll` | `RtlMoveMemory`, `lstrlen`, `lstrlenW` | Memory operations |
| `gdi32.dll` | `GetDeviceCaps` | Display DPI detection |
| `wsock32.dll` | `WSAStartup`, `WSACleanup`, `gethostname`, `gethostbyname`, `gethostbyaddr`, `inet_addr` | Network connectivity |
| `iphlpapi.dll` | `GetNetworkParams`, `GetAdaptersInfo` | Network adapter information |
| `urlmon.dll` | `URLDownloadToFile` | HTTP file download |
| `Wininet.dll` | `DeleteUrlCacheEntry` | Cache management |

---

## 10. Architectural Patterns and Anti-Patterns

### Patterns (Good Practices)

#### 10.1 Split Database Architecture
The separation of front-end (forms/queries/VBA) from back-end data (8+ MDB files) is a recognized Access best practice for multi-user deployments. It enables:
- Independent front-end updates without affecting data
- Multiple users accessing shared backend databases
- Separate backup/recovery for data vs. application

#### 10.2 Key-Value Variable Storage
The `SetVariable/Variable` (global) and `SetLocalVariable/LocalVariable` (per-workstation) pattern provides a flexible, extensible configuration system:
- Global settings stored in `>Settings` table
- Local settings stored in `>Local Settings` table
- Pattern: `SetLocalVariable "Form_ProductList_ProductListName", myset!Key`
- Retrieval: `LocalVariable("Form_ProductList_ProductListName")`

#### 10.3 Error Logging Framework
`ErrorLogEntry()`, `ErrorLogReport()`, `ErrorLogClear()` provide a rudimentary but functional logging system that records errors to a table and presents them to users when operations complete with errors.

#### 10.4 Null-Safe Helper Functions
`NNEZ()` (Null/Nothing/Empty to Zero) and `NNEN()` (Null/Nothing/Empty to empty string) are used consistently throughout the codebase, preventing the most common VBA runtime error (invalid use of Null). This is a practical pattern for Access development.

#### 10.5 Status Bar Feedback
`StatusBarMessage()` provides user feedback during long-running operations, giving the impression of responsiveness. Used extensively in synchronization, export, and computation operations.

#### 10.6 Form-Open Detection
`FIsLoaded(stFrmName$)` is used before accessing form controls, preventing errors when forms are closed. This is a defensive programming pattern.

#### 10.7 Database Synchronization Strategy
The startup synchronization sequence handles multiple failure modes:
- Checks server connectivity before attempting sync
- Tracks last sync date to avoid redundant operations
- Monitors file sizes for compaction needs
- Provides user feedback via Startup form
- Falls back gracefully when server is unavailable

### Anti-Patterns (Concerns)

#### 10.8 God Module
`Common.txt` (6,795 lines) and `Parts.txt` (5,988 lines) are textbook "God Objects" -- single modules that do everything. `Common.txt` alone handles networking, UI management, data access, mathematical computation, user authentication, application lifecycle, cost export, and more. These should be decomposed into focused modules.

#### 10.9 Global Variable Explosion
With 310+ global variables, the application has no encapsulation. Any function can read or modify any global variable, creating invisible dependencies. Key problematic examples:
- `g_StopExecution` -- UI signal shared between forms and computation modules
- `g_ComputingInPartsList` -- Cross-module state flag
- `SaveField(0 To 199)` -- Record copy buffer shared via global array
- `g_Echo`, `g_EchoFix` -- Screen paint state
- `InProgress`, `LastForm`, `ThisForm` -- Navigation state

#### 10.10 No Data Access Layer
Business logic directly opens recordsets, manipulates data, and closes connections. There is no abstraction layer between the UI and database. The `SQLResult()` function is the closest thing to a DAL helper, but it's used for ad-hoc single-value queries, not structured data access.

#### 10.11 Manual Field-by-Field Record Cloning
`CopyItem()` copies records by iterating through all fields:
```vba
For i = 0 To TheCount - 1
    SaveField(i) = Screen.ActiveForm(i)
Next i
```
And `PasteItem()` writes them back field-by-field. This is fragile -- any schema change requires verifying field indices.

#### 10.12 Screen Scraping for Context
Functions use `Screen.ActiveForm.Name` and `Screen.ActiveControl.ControlName` to determine execution context, creating tight coupling between business logic and UI state. If a form is renamed or a control is moved, business logic breaks.

#### 10.13 Magic Numbers and Strings
- Account number 121 for refunds
- Settings keys accessed by position (`Settings.MoveNext` iterated N times)
- Application indices 1-9 for update checking (`i = 1: KRHEdit`, `i = 2: Journals`, `i = 6: AccountingReports`, `i = 7: ProjectManagerReports`)
- Product list key 83 in `Query5`
- File size thresholds (1100000000, 2000000000, 1950000000)

#### 10.14 Synchronous Long-Running Operations
Database synchronization, compaction, and file copying all run on the UI thread with only `StatusBarMessage` and `DoEvents` for responsiveness. These operations can take "at least 10 minutes" (as stated in user prompts) during which the application is essentially frozen.

#### 10.15 No Unit Testing
There is zero test infrastructure. No test module, no test queries, no assertion helpers. All testing is presumably manual.

#### 10.16 Commented-Out Code Retention
Extensive commented-out code exists throughout:
- `Drawing.txt`: Entire OLE Automation approach for AutoCAD is commented out but retained
- `Parts.txt`: Lines 7-13 have commented AutoCAD object declarations
- `AutoAttach.txt`: Multiple commented-out sync strategies
- `Common.txt`: Various commented-out alternative implementations
This obscures active code and makes maintenance harder.

#### 10.17 Jet Replication Dependency
The application relies heavily on Jet Replication (`dbRepImportChanges`/`dbRepExportChanges`), a technology Microsoft deprecated years ago and removed from newer Access versions. This creates a migration barrier.

#### 10.18 Forms Reference Queries
Many queries directly reference form controls in their WHERE clauses:
```sql
WHERE ProductListKey=Forms!ProductListMaster!ProductListControl!ProductListName
WHERE Key=Forms!Products.CategorySort AND ProductType=Forms!Products.ProductType
WHERE Category=Forms!ProductListMaster!ProductListControl!Product 
    AND CNCMachine=Forms!CNC.CNCMachine
```
This means queries cannot be executed independently for testing or reporting outside their parent forms.

---

## Summary Assessment

### What This Application Represents

KRHLApp is a **large-scale, domain-specific ERP system** built in Microsoft Access over approximately 20-30 years. It represents a massive investment in domain knowledge for the architectural cabinetry and millwork industry, with particularly sophisticated capabilities in:

1. **Product list auto-dimensioning** (the GapFill algorithm) -- automatically computing variable dimensions between products positioned along walls
2. **CNC program generation** -- multi-machine output for Xilog, DXF, and cut lists
3. **Full business lifecycle management** -- from estimate through invoicing and AR
4. **Drawing/CAD integration** -- AutoCAD script generation and Visio drawing management
5. **Database synchronization** -- multi-workstation data sharing via Jet Replication

### Modernization Considerations

Any replacement or modernization must account for:

- **~518 queries** encoding business rules and reporting logic
- **~60 forms** with complex event-driven UI behavior
- **~111 reports** covering all business functions
- **~25,000-35,000 lines** of VBA encoding decades of domain knowledge
- **Deep CNC machine integration** that is core to production operations
- **CAD integration** (AutoCAD + Visio) that is core to engineering
- **Multi-workstation synchronization** infrastructure

The application **cannot** be replaced with an off-the-shelf solution due to the highly specialized product engineering, CNC programming, and auto-dimensioning capabilities. A modernization effort would need to carefully extract and preserve the domain logic while addressing the extensive technical debt.
