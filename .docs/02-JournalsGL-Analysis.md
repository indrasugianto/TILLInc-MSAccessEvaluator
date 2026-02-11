# JournalsGeneralLedgerApp Comprehensive Analysis
## MS Access Accounting & Financial Management System for KR+H

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

**JournalsGeneralLedgerApp** is a comprehensive accounting, financial management, and job costing system for **KR+H** -- a kitchen/cabinet design-build and installation firm specializing in high-end custom architectural cabinetry, millwork, and fine woodworking.

### What It Does

The application serves as the **complete financial backbone** for the organization, handling:

- **General Ledger** management with full double-entry bookkeeping
- **All accounting journals**: Purchase, Sales, Receipts, Cash Disbursements, Payroll, Loan
- **Accounts Payable**: Invoices, check printing, aging
- **Accounts Receivable**: Invoices, receipts, aging
- **Payroll processing** integrated with ADP payroll service
- **Job costing** and profitability analysis
- **Employee time tracking** with cost allocation
- **Financial reporting**: Balance Sheet, Income Statement, Trial Balance
- **Bank reconciliation**
- **Year-end closing** procedures
- **Data export** to Sage accounting software

### History and Scale

- **Development span**: 20+ years (hardcoded dates range from 1998 to 2018+, references to "Access 2000" format databases)
- **Part of ecosystem**: One of 6+ interconnected Access applications sharing 8 backend databases

| Artifact | Count |
|----------|-------|
| Local Tables | 1 (+3 created at runtime) |
| External Linked Databases | 8 |
| Linked Tables (estimated) | 30+ |
| Forms | 19 |
| Reports | 94 |
| Queries | **340** |
| VBA Modules | 5 |
| Macros | 47 |
| Classes | 0 |
| Total VBA Lines (modules) | **~4,507** |

---

## 2. Key Business Entities/Tables and Relationships

### 2.1 Architecture: Split Database with Linked Tables

The application uses **only 1 local table** (`CopyRight` -- stores app revision date, message, and logo). All other tables are **linked from 8 external .mdb databases** at startup via the `AutoAttach` module.

The `relationships.json` is empty because all foreign key relationships exist within the external databases, not in the front-end application file.

### 2.2 External Database Files

| Database File | Purpose | Key Tables |
|---|---|---|
| **MIS.mdb** | Core accounting master data | `MIS Accounts`, `MIS Personnel`, `MIS Hours` |
| **APC.mdb** | Transaction journals | `General Ledger`, `Purchase Journal`, `Payroll Journal`, `Sales Journal`, `Receipts Journal`, `Cash Disbursements Journal`, `Loan Journal`, `ADP` |
| **APCSet.mdb** | Application configuration | `>Attachments`, `>Errors`, `>Help`, `>CopyRight`, `SQL Log` |
| **Resource.mdb** | People and organizations | `>Resources` |
| **Settings.mdb** | Settings and configuration | `>Settings`, `>Local Settings` |
| **Document.mdb** | Document management | (Referenced in sync) |
| **Lists.mdb** | Lookup/reference lists | (Referenced in sync) |
| **Products.mdb** | Product catalog | `>Products` |

### 2.3 Master Data Tables

| Table | Key Fields | Purpose |
|---|---|---|
| `MIS Accounts` | Number (PK), Account, Balance, FY5 (prior year), FY9 (fiscal year), BalanceSheetItemSort, BalanceSheetCategorySort, AccountType | Chart of Accounts |
| `MIS Personnel` | Key (PK), Employee, ADPFile, ADPName, ADPNetAccount, Rate, DesignRate, EmploymentDate, TerminationDate, BirthDate, SocialSecurity, BonusPlan, Text2 (Position/Role), Text3 (Windows Username) | Employee master |
| `MIS Hours` | Key (PK), Date, Employee, Activity, Job ID, Hours, ADPFile, Cost, Rate | Time tracking |
| `>Resources` | Key (PK), ID, Category, CompanyName, Address, State, Field2 (phone), Field3 (fax), Field4 (email), SageID | Universal contacts (vendors, customers, employees) |
| `>Jobs` | Key (PK), ID, Customer, ManagedBy, SpecifiedBy, Architect, Contractor, Closed, Estimate | Job/project records |

### 2.4 Transaction Journal Tables

| Table | Key Fields | Purpose |
|---|---|---|
| `General Ledger` | Key, AccountNumber, TransactionDate, SourceJournal, SourceKey, SourceTransaction, SourceOperative, DebitAmount, CreditAmount, Job, Archive | Central GL -- every transaction with source traceability |
| `Purchase Journal` | Key, SupplierID, InvoiceDate, InvoiceNo, Due, Paid, Posted, Void, AccountNo, TotalAmount, DebitAmount, CheckDate, CheckNumber, CheckKey, PayablesAccount | AP invoices and payments |
| `Payroll Journal` | Key, Employee, ADPFile, ADPNetAccount, CheckDate, CheckNumber, Gross, Regular, OverTime, Vacation, Holiday, Bonus, Commission, Field3 (401K), Roth, RothLoan | Payroll transactions |
| `Sales Journal` | Key, Job, TheDate, Due, Category, SaleAmount, InvoiceAmount, Posted, Description, Journal, Partner | Sales invoices |
| `Receipts Journal` | Key, Payor, Job, CheckDate, Amount, Closed | Cash receipts |
| `Cash Disbursements Journal` | Key, CheckDate, CheckNumber, SupplierID, Closed | Check disbursements |
| `Loan Journal` | Key, Posted | Loan transactions |
| `ADP` | ADPFile, CheckDate, CheckNumber, Federal, Insurance, Dental | ADP payroll imports |

### 2.5 Account Number Scheme

| Range | Category | Key Accounts |
|---|---|---|
| 100-199 | **Assets** | 101=Cash, 121=Accounts Receivable |
| 200-299 | **Liabilities** | 201=Accounts Payable, 202=Loan Payables, 205=Customer Deposits, 296=Retained Earnings |
| 300-399 | **Revenue/Income** | 305=Sales |
| 400-499 | **COGS** | |
| 500-699 | **Expenses** | |
| 700+ | **Office/Admin** | |

### 2.6 Department Classification (embedded in queries)

```
ADPNetAccount >= 700  →  "Office"
ADPNetAccount >= 600  →  "Install"
ADPNetAccount < 600   →  "Shop"
```

### 2.7 Implicit Relationships (reconstructed from query JOINs)

```
General Ledger.AccountNumber        →  MIS Accounts.Number
General Ledger.SourceOperative      →  >Resources.Key
General Ledger.SourceKey            →  Purchase/Sales/Payroll Journal.Key
General Ledger.Job                  →  >Jobs.Key
Purchase Journal.SupplierID         →  >Resources.Key
Purchase Journal.AccountNo          →  MIS Accounts.Number
Purchase Journal.PayablesAccount    →  MIS Accounts.Number (201 or 202)
Purchase Journal.CheckKey           →  Cash Disbursements Journal.Key
Payroll Journal.ADPFile             →  MIS Personnel.ADPFile
Sales Journal.Job                   →  >Jobs.Key
Receipts Journal.Payor              →  >Resources.Key
Receipts Journal.Job                →  >Jobs.Key
Cash Disbursements.SupplierID       →  >Resources.Key
MIS Hours.Employee                  →  MIS Personnel.Employee
MIS Hours.Job ID                    →  >Jobs.Key
>Jobs.Customer                      →  >Resources.Key
>Jobs.ManagedBy                     →  MIS Personnel.Key
MIS Accounts.BalanceSheetCategorySort → >Settings.Key
```

---

## 3. Major Functional Areas

### 3.1 General Ledger
- Full GL transaction management with date-range filtering
- Source journal tracking (Purchase, Receipts, Payroll, Sales, Loan, Disbursements, Adjustments)
- Account-level drill-down via parameterized master query
- Beginning balance calculation via `GetBalance()` function (walks FY9/FY5 fields + prior-period transactions)
- Prior year comparison via `PriorYear()` function
- Transaction archiving with multi-level date-based access control (`ArchivedDate()`)
- Role-based access: `GLAccess()` checks if user is COO or IT

### 3.2 Balance Sheet and Financial Statements
- Template-driven report structure -- accountants can modify layout without code changes
- Balance Sheet, Income Statement, Profit & Loss
- Horizontal (landscape) and vertical (portrait) formats
- Prior year and budget comparisons
- Year-to-date income statements
- Dynamic portrait/landscape switching based on date range
- KR+H custom-format reports with company-specific headings

### 3.3 Accounts Payable
- Purchase Journal entry with three variants: Regular (account 201), COD, and Loans (account 202)
- Invoice tracking: supplier, due dates, amounts, account allocation
- Check writing and printing with full vendor address
- Payables aging reports (by due date, by week)
- Void and Posted/unposted tracking
- Credit tracking

### 3.4 Accounts Receivable
- Receipts Journal entry
- Receivables aging (standard, bank account aged)
- Deposit tracking (account 205)
- Cash receipts reporting
- Partner receivables
- Refunds tracking

### 3.5 Payroll
- Full payroll journal with detailed component tracking:
  - Regular, Overtime, Vacation, Holiday, Retroactive, Bonus, Commission, Other
  - 401K (Field3), Roth IRA, Roth Loan
- ADP Integration via `ADPFile` linkage
- 401K period/YTD reporting with hours qualification check
- Medical, AFLAC, FSA deduction tracking
- Employer tax calculations by GL account
- Overtime charting and trend analysis
- Bonus plan and profit-based bonus calculation
- Vacation/Holiday accrual tracking
- Direct deposit reporting
- Employee roster, compensation, lifecycle reports

### 3.6 Job Costing and Profitability
- Job profitability analysis across revenue and cost categories
- Revenue: Agreement Sales, Cabinet/Counter Sales, Install Sales, Stone Sales, Other Sales
- Costs: Project Hours, Cabinet Hours, Install Hours
- WIP (Work In Progress) reporting by Design, Cabinet, Install
- Job audit reports
- `Job_Profit_Report_Job_Query` joins 9 sub-queries via LEFT JOINs

### 3.7 Time Tracking / Hours
- Employee hours by date, job, activity, and general category
- Cost calculation with configurable rates (Office, Shop, Design, with overhead)
- Rework tracking and analysis
- Hours trend charts, top-10 rework jobs, yearly comparison

### 3.8 Bank Reconciliation
- Check, receipt, and payroll reconciliation
- Year-end bank reconciliation
- Year-end proof queries for accounts 101, 121, 201, 205, 305

### 3.9 Year-End Processing
- 15 `YEProof*` queries for comprehensive year-end proof/reconciliation
- Retained earnings balance update (account 296)
- Period closing enforcement with password override
- Context-sensitive help at `\\CM-PDC\Shared\App_Help\year-end-process.html`

### 3.10 Data Export (Sage Integration)
- 14 export queries formatted for Sage accounting software import
- Transaction type codes: `/I` (Invoice), `/P` (Payment), `/A` (Account/Master), `/C` (Credit)
- Covers vendor, customer, and other transaction types
- Uses `>Resources.SageID` for mapping

---

## 4. VBA Code Analysis

### 4.1 Line Counts by Module

| Module | Lines | Purpose |
|---|---|---|
| **Common.txt** | **3,608** | Master utility library -- shared across all applications |
| **AutoAttach.txt** | **707** | Database attachment, path management, Jet Replication sync |
| **ResizeAPP.txt** | **101** | Win32 API window sizing |
| **General.txt** | **65** | Retained earnings balance update |
| **AppPosition.txt** | **26** | Win32 API window position detection |
| **Total** | **~4,507** | |

### 4.2 Common.txt Key Functions (3,608 lines, ~120+ functions)

**Networking & System:**
- `GetIPAddress()`, `GetIPHostName()`, `ConnectedToServer()` -- Network connectivity
- `TheUsername()` -- Windows username via Win32 API
- `SocketsInitialize()` / `SocketsCleanup()` -- Winsock management

**Accounting:**
- `GetBalance()` -- Beginning balance calculation (FY9/FY5 + prior-period GL transactions)
- `GLAccess()` -- Role-based access (COO/IT check)
- `ArchivedDate()` -- Multi-level period closing enforcement
- `AccountName()` -- Account lookup by number
- `IncomeStatementSetup()` -- Dynamic report orientation

**Settings/Configuration:**
- `Variable()` / `SetVariable()` -- Global key-value store (>Settings table)
- `LocalVariable()` / `SetLocalVariable()` -- Per-workstation key-value store (>Local Settings)
- `SaveLocalVariables()` / `RestoreLocalVariables()` -- Form state persistence

**UI Management:**
- `PositionForm()` / `PositionReport()` -- Window sizing
- `EchoOn()` / `EchoOff()` -- Screen painting control
- `StatusBarMessage()` -- Status bar updates
- `FilterForm()` -- Dynamic form filtering
- `CloseAllForms()` / `HideAllForms()` -- Form lifecycle

**Null-Safety (used throughout):**
- `NNEZ()` -- Null/Empty to Zero
- `NNEN()` -- Null to empty string
- `NotNull()` -- Boolean null check

**Dialogs:**
- `Password()` -- Custom modal password dialog with busy-wait polling
- `MessageOKCancel()` -- **INVERTED: Returns True for Cancel, False for Yes**
- `MessageOK()`, `MessageYesNoCancel()`, `ResponseYes()`

**Data Helpers:**
- `SQLResult()` -- Execute SQL, return first field of first row
- `SQLUpdate()` -- Single-field update helper
- `SetTableData()` -- Generic record update by field name
- `DuplicateRecord()` -- Record cloning

**Application Lifecycle:**
- `MainMenuLoad()` -- Startup initialization (~125 lines)
- `DetermineApplication()` -- Identifies app by database filename
- `SynchronizeApplication()` -- Remote sync
- `RestartApplication()` -- Self-restart via Shell

### 4.3 AutoAttach.txt Key Functions (707 lines)

- `AttachDatabase()` (~350 lines) -- Master startup: loads settings, checks connectivity, validates/re-links all tables from 8 backends, syncs via Jet Replication, handles 2GB compaction
- `CompactDatabase()` -- Compacts all 8 external databases sequentially
- `GetPathToDatabase()` / `SetPathToDatabase()` -- Database path config via text files
- `GetPathToServer()` / `SetPathToServer()` -- Server path management
- `LocalSettingsLastPath()` -- Per-app database path persistence

### 4.4 Global Variables (~60+)

Key categories:
- **Database/Settings**: `mydb`, `Settings`, `LocalSettings`, `g_ServerConnection`, `g_RemoteConnection`
- **Accounting accumulators**: `g_subTotal`, `g_Income`, `g_Expense`, `g_Balance`, `g_totalEquity` (current, YTD, prior, budget variants)
- **Department accumulators**: `g_Design`, `g_Cabinet`, `g_Install`, `g_OS` (current, budget, YTD variants)
- **Date tracking**: `g_BeginDate`, `g_EndDate`, `g_Date`, `g_TheDate` (+ YTD, prior variants)
- **UI/State**: `g_Echo`, `g_delete`, `g_Detail`, `g_YTD`, `g_Password`
- **Geometry** (shared from CAD application): `g_EndPointX/Y`, `g_CenterPointX/Y`, `px/py/pz` arrays

---

## 5. Forms and Their Purposes (19 Forms)

| # | Form | Purpose |
|---|---|---|
| 1 | **MainMenu** | Primary navigation hub; displays company logo and report heading; timer-driven |
| 2 | **GeneralLedger** | Core GL transaction viewer; date range filtering; journal, account, payee filters |
| 3 | **Accounts** | Chart of Accounts management |
| 4 | **Balance** | Account balance viewer with beginning/ending balance |
| 5 | **BalanceSheet** | Detailed balance sheet with dual-account drill-down |
| 6 | **BalanceNew** | Updated balance form variant |
| 7 | **Balance Sheet Template** | Balance sheet report structure configuration |
| 8 | **Income Statement Template** | Income statement report structure configuration |
| 9 | **AccountSort** | Account reordering utility |
| 10 | **AccountSortIndex** | Account index sorting for report order |
| 11 | **AccountSortIndexBalanceSheet** | Balance sheet account categorization |
| 12 | **Log** | Error/activity log viewer |
| 13 | **Startup** | Splash screen during database attachment |
| 14 | **SelectDatabase** | Database path selection dialog |
| 15 | **Password** | Modal password entry dialog |
| 16 | **Help** | Context-sensitive help display |
| 17 | **HelpEdit** | Help content editor |
| 18 | **Memo** | General-purpose notes text entry |
| 19 | **Purchase Vendor Report Query** | Vendor purchase report filter criteria |

---

## 6. Reports and Their Purposes (94 Reports)

### General Ledger Core (5)
| Report | Purpose |
|---|---|
| General Ledger Report | Complete GL transaction listing for date range |
| General Ledger Account Report | Transactions grouped by GL account |
| General Ledger Accounts | Chart of accounts listing |
| General Ledger Trial Balance Report | Trial balance with debit/credit totals |
| General Ledger KR+H Account Sort | Account sort order verification |

### Financial Statements (11)
| Report | Purpose |
|---|---|
| General Ledger Balance Sheet | Standard balance sheet |
| General Ledger KR+H Balance Sheet | Company-specific format |
| General Ledger Horizontal Balance Sheet | Landscape format |
| General Ledger Income Statement | Standard income statement |
| General Ledger KR+H Income Statement | Company-specific format |
| General Ledger KR+H Detail Income Statement | Account-level breakdown |
| General Ledger KR+H YTD Income Statement | Year-to-date with prior year comparison |
| General Ledger Profit (Loss) Report | P&L summary |
| General Ledger Asset and Liability Report | A&L summary |
| General Ledger Asset and Liability Detail Report | A&L with transaction detail |
| General Ledger Interim Asset and Liability Report | Interim period A&L |

### GL Detail (5)
| Report | Purpose |
|---|---|
| General Ledger Journal Report | Transactions by source journal |
| General Ledger Job Report | GL entries by job |
| General Ledger Resource Report | GL entries by resource |
| General Ledger Selected Resource Report | Single resource GL detail |
| General Ledger Deposits Report | Customer deposit detail (account 205) |

### Selected Account (4)
| Report | Purpose |
|---|---|
| Selected Account Report | Transactions for user-selected GL account |
| Selected Account Transaction Report | Detailed transactions |
| Selected Account Chart | Graphical chart of activity |
| Selected Account Chart Report | Chart with supporting data |

### Accounts Payable (11)
| Report | Purpose |
|---|---|
| Payables Report | Full AP listing |
| Payables Report by Due Date | Sorted by due date |
| Payables Report by Week | Grouped by week |
| Payables Payee Report | Grouped by vendor |
| Payable_SubReport | Subreport for payables |
| Payables_at_From_Date subreport | Balance as of specific date |
| Purchase Report | Purchase journal listing |
| Purchase by amount Report | Purchases sorted by amount |
| Purchase Job Report | Purchases allocated to jobs |
| Print Checks | Check printing with vendor address |
| Credits Report | Credit memo listing |

### Accounts Receivable (8)
| Report | Purpose |
|---|---|
| Receivables Report | Full receivables listing |
| Receivables Report Aged | Aged receivables analysis |
| Receivables Report Bank Account Aged | Aged by bank account |
| Receivables Cash Report | Cash receipts detail |
| Receivables Partner Report | Partner-specific receivables |
| Receipts Report | Cash receipts journal |
| Refunds Report | Refund transactions |
| Sales Report | Sales journal listing |

### Payroll (16)
| Report | Purpose |
|---|---|
| Payroll Report | Detailed payroll by employee/check |
| Payroll Summary Report | Summary totals by employee |
| Payroll Summary GL Report | GL posting summary by account |
| Payroll 401K Report | 401K contributions by employee |
| Payroll Roth Report | Roth IRA contributions |
| Payroll Roth IRA Report | Roth IRA detail |
| Payroll Bonus Report | Bonus payment listing |
| Payroll Bonus Plan Report | Bonus plan analysis |
| Profit Bonus Report | Profit-based bonus calculation |
| Payroll Medical Deductions | Medical/dental/FSA deductions |
| Payroll Direct Deposit Report | Direct deposit listing |
| Payroll Field Report | Field-level analysis |
| Payroll Prepay Report | Prepay/advance report |
| Payroll Reconciliation Report | Bank reconciliation |
| CS+Q Report | Compensation quarterly summary |
| Compensation Report | Full compensation with employer contributions |

### Employee (6)
| Report | Purpose |
|---|---|
| Employee Roster | Active employees with department, rate, hire date |
| Employee Birth Dates Report | Birth date calendar |
| Employee Hire Dates Report | Hire date anniversary listing |
| Employee Hired Dates Report | Employment history with years of service |
| Employee Termination Dates Report | Termination calendar |
| Employees Hired and Terminated Report | Combined for period |

### Time/Hours (8)
| Report | Purpose |
|---|---|
| Hours Report | Time entries with cost calculation |
| Hours Employee Report | Hours by employee |
| Hours Task Report | Hours by task/activity |
| Hours Chart Report | Graphical hours chart |
| Hours Activity Chart | Activity breakdown chart |
| Hours Rework Report | Rework cost analysis |
| Hours Rework Top Ten Report | Top 10 highest-cost rework jobs |
| Hours Rework Yearly Comparison | Year-over-year rework comparison |

### Job/WIP (6)
| Report | Purpose |
|---|---|
| Job Audit Report | Job financial audit |
| Job Profit Report | Job profitability (sales - costs) |
| Job Profit Report V1 / Report1 | Earlier/alternate profit formats |
| WIP Report | Work in progress by job |
| WIP Shop Report | Shop-specific WIP detail |

### Bank Reconciliation (4)
| Report | Purpose |
|---|---|
| Reconciliation Report | Bank reconciliation summary |
| Reconciliation Check Report | Check-level detail |
| Reconciliation Receipt Report | Receipt-level detail |
| Year End Bank Reconciliation Report | Year-end reconciliation |

### Other (8)
| Report | Purpose |
|---|---|
| Vacation Holiday and Bonus Report | Vacation/holiday accrual and bonus |
| Vacation Report | Vacation balance by employee |
| Deposits Report | Customer deposits |
| Year End Test Report | Year-end verification |
| Log Report | System activity log |
| Help Report | Help system printout |
| ReportTemplate | Base report template |
| >Sales Not Posted Query | Unposted sales listing |

---

## 7. Key Queries (340 Total)

### 7.1 Query Naming Conventions

- **`>` prefix**: Shared/linked queries used across forms and reports
- **`#` prefix**: Historical period-specific queries
- **No prefix**: Standalone report data queries
- **`YE` prefix**: Year-end proof/reconciliation queries
- **`Export_` prefix**: Sage export queries
- **`GL` prefix**: General Ledger report queries

### 7.2 Core GL Queries (~25)

| Query | Purpose |
|---|---|
| `>General Ledger Query` | **Master query** -- all GL transactions with account names, resource IDs, date-filtered |
| `>General Ledger Query Accounts` | Accounts with activity or non-zero balance |
| `>General Ledger Journals Query` | Distinct source journal names |
| `GLTrialBalanceQuery` | Trial balance: account, balance, debit/credit totals |
| `GLSummaryQuery` | Summary grouped by resource, account, journal |
| `GLDetailQuery` | Transaction-level detail with resource category |
| `GLIncomeStatementQuery` | Uses `AccountBalance()` VBA function for each account range |
| `>GL Year Query` | Distinct transaction years |
| `>GL 500 to 699 Expense` | Expense sum for period |

### 7.3 Balance Sheet Queries (~20)

| Query | Purpose |
|---|---|
| `>Balance Sheet Accounts Query` | Balance sheet accounts with Settings category headings |
| `>Balance Sheet Accounts Report Query` | Full balance sheet with beginning, current, prior net |
| `GLBalanceSheetTemplateQuery` | Template with inline `SqlResult()` lookups |
| `GL Balance Sheet Report Query` | Balance data for accounts < 300 |
| `VerifyBalanceSheetAccounts` | Verification query |

### 7.4 Payroll Queries (~35)

| Query | Purpose |
|---|---|
| `>Payroll Query` | Master payroll: date-filtered, excludes voids, calculates Retirement |
| `>Payroll GL Query` | Payroll data for GL posting |
| `>Payroll Bonus Query` | Bonus payments with employee names |
| `>Payroll Employer Tax` | Employer tax by employee and GL account |
| `>Payroll Benefit Medical` / `AFLAC` / `FSA` | Benefit deduction reports |
| `>401K ADP Period Query` | 401K contributions for period |
| `>401K ADP YTD Query` | 401K YTD gross |
| `>401K Hours YTD Query` | Hours for 401K eligibility |
| `Employee_Roster` | Active employees with department |
| `Compensation_Report_Query` | Full compensation with employer contributions |
| `Delete_Payroll_Query` | **Hardcoded date: #8/4/2016#** |

### 7.5 AP Queries (~20)

| Query | Purpose |
|---|---|
| `>Disbursements` | AP invoices with paid/unpaid/all filter |
| `>Purchase Journal Query` | Unposted purchase entries |
| `>Print Checks Query` | Check data with full vendor address |
| `Payables_Report_Query` | Payables summary |
| `Payables_Report_by_Due_Date_Query` | Aged payables |

### 7.6 AR Queries (~15)

| Query | Purpose |
|---|---|
| `>Receipts Journal Query` | Receipts by payor with job info |
| `GLReceivablesQuery` | Receivables by job (account 121) |
| `GLReceiptsQuery` | Receipt totals by open job |
| `Receivables_Report_Aged_Query` | Multi-step aged receivables |

### 7.7 Job/Hours Queries (~30)

| Query | Purpose |
|---|---|
| `>Job Names Query` | Open, non-estimate jobs |
| `>Hours Form Query` | Time entry with cost calculations |
| `>Hours Rework Activity Query` | Rework cost by activity |
| `Job_Profit_Report_Job_Query` | **9 LEFT JOINs**: comprehensive profit roll-up |
| `WIP_Report_*` (12 queries) | WIP by design, cabinet, install |

### 7.8 Export Queries for Sage (14)

| Query | Type Code | Purpose |
|---|---|---|
| `Export_Vendor_Invoices/Payments/Adjustments/Payables` | `/I`, `/P`, `/C`, `/I` | AP exports |
| `Export_Vendors` | `/A` | Vendor master |
| `Export_Customer_Invoices/Payments/Credits` | `/I`, `/P`, `/C` | AR exports |
| `Export_Customers` | `/A` | Customer master |
| `Export_Other_*` | Various | Other exports |

### 7.9 Year-End Queries (15)

`YEProof*` queries provide comprehensive year-end reconciliation for accounts 101 (Cash), 121 (AR), 201 (AP), 205 (Deposits), and 305 (Sales). The `YEProofQuery` uses 13+ LEFT JOINs for a combined proof worksheet.

---

## 8. Technical Debt and Concerns

### 8.1 Hardcoded File Paths (15+)

```
C:\Access\                          Application directory
C:\Database\                        Default database directory
C:\ACCESS\DatabasePath.TXT          Database path config
C:\ACCESS\ServerPath.TXT            Server path config
C:\Apps\UpdateApp.mdb               Update application
C:\Apps\Apps.mdb                    Apps launcher
\\CM-PDC\Shared\App_Help\           Help files UNC path
\\cmsbs                             Default server fallback
```

Application breaks if deployed to any machine without the exact path structure.

### 8.2 Hardcoded Personnel Names

```vba
ElseIf Not g_RemoteConnection Or TheUsername = "Bill" Then   ' Special update logic
If InStr(TheUsername, "Marshall") <> 0 Then GoTo ExitStartup  ' Skip sync entirely
If TheUsername = "Marshall" Then DoCmd.ShowToolbar "Report Design", acToolbarYes
```

### 8.3 Hardcoded Dates in Queries

```sql
WHERE [CheckDate]>#10/1/1998# And [CheckDate]<#1/7/2000#    -- Frozen to 1998-2000
WHERE [CheckDate]>#1/1/2001# And [CheckDate]<#12/31/2001#   -- Frozen to 2001
WHERE [CheckDate]=#8/4/2016#                                  -- Delete query
```

### 8.4 Hardcoded Account Numbers

Account numbers 101, 121, 201, 202, 205, 296, 305, 700 referenced directly in code and queries.

### 8.5 SQL Injection Vulnerability

100% of SQL built via string concatenation with no parameterization:
```vba
"Select * from [General Ledger] where Transactiondate >=" & Forms!GeneralLedger!FromDate
"Select * from [>Settings] where MenuText = '" & TheName & "'"
```
`ApostropheCheck()` exists as partial mitigation but is applied inconsistently.

### 8.6 Inverted Dialog Convention

`MessageOKCancel()` returns `True` for **Cancel/No** and `False` for **Yes/OK** -- opposite of standard convention.

### 8.7 Misnamed Functions

- `DatePlus30()` -- Actually adds **28** days, not 30
- Custom `IsNumeric()` shadows VBA built-in

### 8.8 God Module

`Common.txt` at 3,608 lines contains networking, accounting, UI, string parsing, resource formatting, role management, help, logging, application lifecycle, and SQL utilities. This module is shared across 6 applications, so this app carries dead weight (e.g., CAD geometry code).

### 8.9 Massive Global State (~60+ variables)

No encapsulation. Accounting accumulators create invisible dependencies between report sections.

### 8.10 Deprecated Patterns

| Pattern | Concern |
|---|---|
| `GoSub/Return` | Pre-VB6 subroutine pattern |
| `Open #2 For Input/Output` | File I/O for config instead of database |
| `DoCmd.DoMenuItem` | Access 2.0-era command syntax |
| `SendKeys` | Fragile UI automation |
| Jet Replication | Deprecated, prone to database bloat/corruption |

### 8.11 Silent Error Swallowing

Error handlers typically `Resume` to empty labels, silently continuing with unknown state. `On Error Resume Next` used without subsequent error checking.

### 8.12 Busy-Wait Patterns

```vba
' CPU-intensive delay
Do Until TheTime < Timer - ThePause: Loop
' Password dialog polling
While g_Password = TheString: DoEvents: Wend
```

### 8.13 2GB Database Limit

Code explicitly checks if `Document.mdb` exceeds ~2GB and prompts for compaction.

### 8.14 No Tests, No Source Control

Zero test infrastructure. Revisions tracked only via `CopyRight` date field.

---

## 9. Integration Points

### 9.1 External Databases (8 Linked)
All data resides in 8 external `.mdb` files dynamically attached at startup via `AttachDatabase()`.

### 9.2 Jet Replication
Bi-directional sync between workstations and server for Document, Lists, Products, MIS, Resource, Settings databases. Connection check via IP comparison against `KRH_NetworkAddress` (default `192.168.115.*`).

### 9.3 ADP Payroll System
`MIS Personnel.ADPFile` links employees to ADP. Multiple queries aggregate for 401K, benefits, tax, and compliance reporting.

### 9.4 Sage Accounting Export
14 export queries with transaction type codes and `>Resources.SageID` mapping. Distribution accounts formatted as `Format([AccountNo]*10,"#0.00")`.

### 9.5 File System
Configuration via text files in `C:\ACCESS\`. File operations via `Scripting.FileSystemObject`.

### 9.6 Network
UNC paths to `\\cmsbs`, `\\KRHServer\Access\`, `\\CM-PDC\Shared\`. Winsock API for connectivity detection.

### 9.7 HTML Help
HTML-based help at `\\CM-PDC\Shared\App_Help\`: index, year-end-process, general-ledger, accounts pages.

### 9.8 Inter-Application Ecosystem
Six related Access applications share backend databases and common VBA library. `Shell()` calls to launch other instances.

---

## 10. Architectural Patterns and Anti-Patterns

### Good Practices

1. **Split Database Architecture** -- Front-end code separate from back-end data; standard multi-user Access pattern
2. **Template-Driven Financial Reports** -- Balance Sheet and Income Statement use configurable template tables, allowing accountants to modify layout without code changes
3. **Dynamic Table Linking** -- `AutoAttach` re-links tables at startup from configurable `>Attachments` table
4. **Dual-Layer Configuration** -- Global (`>Settings`) and local (`>Local Settings`) configuration systems
5. **Automatic Form State Persistence** -- `SaveLocalVariables()` / `RestoreLocalVariables()` provide session continuity
6. **Activity Logging** -- Dual logging via `>Errors` and `SQL Log` tables
7. **Period Closing Enforcement** -- Multi-level fiscal discipline in `ArchivedDate()`

### Anti-Patterns

1. **God Module** -- Common.txt shared across 6 apps contains every concern; dead CAD/geometry code in accounting app
2. **Universal Resource Table** -- `>Resources` stores vendors, customers, employees in single table with generic `Field1-4` names
3. **Global Variable Soup** -- 60+ globals with no encapsulation; accounting accumulators create invisible dependencies
4. **No Parameterized Queries** -- 100% string concatenation SQL; injection risk; no query plan caching
5. **Text File Configuration** -- Critical paths stored in plain text files with no security/validation
6. **User-Specific Code Paths** -- Logic branches on hardcoded Windows usernames
7. **Deprecated Synchronization** -- Jet Replication prone to bloat/corruption (2GB checks prove it)
8. **Monolithic Query Design** -- `Job_Profit_Report_Job_Query` (9 JOINs), `YEProofQuery` (13+ JOINs)
9. **Dead Code Accumulation** -- Historical queries from 1998-2001, empty functions, deprecated queries
10. **No Error Recovery** -- Errors silently swallowed via `Resume` to empty labels
11. **No Automated Tests** -- Zero test infrastructure of any kind

---

## Summary

JournalsGeneralLedgerApp is a substantial, organically-grown, mission-critical line-of-business application representing decades of accumulated accounting logic. With 340 queries, 94 reports, and ~4,500 lines of VBA module code, it handles the complete financial lifecycle for KR+H.

Any modernization effort must carefully preserve the complex accounting rules, period-closing enforcement, multi-journal posting patterns, Sage export formatting, and payroll/benefit tracking while addressing the significant technical debt in error handling, security, configuration management, and code organization.
