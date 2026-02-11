# Modernization Assessment
## Technical Debt, Risk Analysis, and Modernization Considerations

---

## 1. Executive Summary

The KR+H Access application suite represents a **20+ year investment** in domain-specific business logic. With a combined **858 queries**, **79 forms**, **205 reports**, and an estimated **30,000--40,000 lines of VBA**, these applications are deeply embedded in every aspect of the company's operations -- from CNC machine programming to year-end financial closing.

The applications face **critical technology risks** from their dependence on deprecated Microsoft technologies (Jet Replication, DAO, Access runtime) and **operational risks** from hardcoded infrastructure paths, personnel names, and zero automated testing.

This assessment categorizes all technical debt by severity and provides a framework for evaluating modernization options.

---

## 2. Combined Application Inventory

| Metric | KRHLApp | GL App | Combined |
|---|---|---|---|
| Queries | 518 | 340 | **858** |
| Forms | 60 | 19 | **79** |
| Reports | 111 | 94 | **205** |
| VBA Modules | 10 | 5 | **15** (with overlap) |
| VBA Lines (modules) | ~16,818 | ~4,507 | **~21,325** |
| VBA Lines (estimated total w/ forms) | ~25K--35K | ~6K--8K | **~31K--43K** |
| Macros | 91 | 47 | **138** |
| Linked Backend Databases | 8 | 8 | **8** (shared) |
| Global Variables | ~310 | ~60 | **~370** |
| Win32 API Calls | 10+ | 10+ | **10+** (shared) |
| External Integrations | AutoCAD, Visio, Revit, CNC, ADP | ADP, Sage | **7+** |

---

## 3. Technical Debt Inventory

### 3.1 CRITICAL -- Immediate Risk

| # | Issue | Apps | Impact | Evidence |
|---|---|---|---|---|
| **C1** | **Jet Replication Dependency** | Both | Data sync completely fails if Jet engine drops support. Already deprecated. Database bloat already hitting 2GB limit. | `dbs.Synchronize` calls in AutoAttach; explicit `If s > 2000000000` size checks |
| **C2** | **No Database-Level Referential Integrity** | Both | Data corruption from orphaned records. No cascade delete/update. | `relationships.json` is empty for both apps; orphan detection queries exist (`Unrelated Designs`, `Unrelated Materials`) |
| **C3** | **SQL Injection in All Queries** | Both | Any user input can be weaponized; data corruption or exfiltration possible. | 100% string concatenation: `"Select * from [>Settings] where MenuText = '" & TheName & "'"` |
| **C4** | **No Automated Testing** | Both | Any change risks breaking unknown functionality. Regression detection is impossible. | Zero test modules, no assertion helpers, no test queries |
| **C5** | **Silent Error Swallowing** | Both | Data corruption goes undetected. Debugging is nearly impossible. | `On Error Resume Next` without checks; error handlers `Resume` to empty labels |

### 3.2 HIGH -- Significant Risk

| # | Issue | Apps | Impact | Evidence |
|---|---|---|---|---|
| **H1** | **God Modules** | Both | Any change to Common.txt (6,795 lines) risks breaking all 6 applications. `PartsByItem()` at 2,250 lines is untestable. | Single modules handling networking, accounting, UI, math, CAD, help, logging |
| **H2** | **310+ Global Variables** | KRHLApp | Unpredictable side effects; impossible to unit test; race conditions in multi-form scenarios. | `Parts.txt` alone: ~190 globals, 99-element arrays, 999-element arrays |
| **H3** | **Hardcoded File Paths (15+)** | Both | Application breaks on any machine without exact `C:\Database\`, `C:\ACCESS\`, `\\cmsbs` structure. | Paths in AutoAttach, Common, CNC modules |
| **H4** | **Hardcoded Personnel Names** | Both | Staff changes require code modification. Special bypass logic invisible to others. | `Bill`, `Marshall`, `Jim`, `Weeke`, `TimeCard` in code branches |
| **H5** | **GoTo/GoSub Spaghetti** | Both | Execution flow nearly impossible to trace. Logic errors easy to introduce. | `GoSub/Return` in PartsByItem, ExportComponentCosts, AttachDatabase |
| **H6** | **Tight UI-Logic Coupling** | Both | Queries reference form controls directly (`Forms!ProductListMaster!ProductListControl!ProductListName`). Cannot test or use outside forms. | ~50+ queries with `Forms!` references |
| **H7** | **Deprecated COM Patterns** | Both | Access 2.0 patterns (`DoCmd.DoMenuItem`), `SendKeys` automation, deprecated `A_FORM` constants | Multiple modules |

### 3.3 MEDIUM -- Manageable Risk

| # | Issue | Apps | Impact | Evidence |
|---|---|---|---|---|
| **M1** | **Text File Configuration** | Both | No encryption, access control, validation, or concurrent access handling. | `C:\ACCESS\DatabasePath.TXT`, `ServerPath.TXT`, `VisioPath.TXT` |
| **M2** | **Universal Resource Table** | Both | Generic `Field1-4` names prevent clear schema; single table for all entity types | `>Resources` with `Category` field distinguishing vendors/customers/employees |
| **M3** | **Hardcoded Account Numbers** | GL App | Chart of accounts changes require code/query modifications. | 101, 121, 201, 202, 205, 296, 305, 700 in queries and code |
| **M4** | **Hardcoded Dates in Queries** | GL App | Dead queries consuming space; potential confusion. | `#10/1/1998#`, `#1/7/2000#`, `#8/4/2016#` in query WHERE clauses |
| **M5** | **Code Duplication** | KRHLApp | Bug fixes must be applied in 16 places (Material1-16 in CategoryUpdate). | `General_Form_Utilities.txt` `CategoryUpdate()` |
| **M6** | **Inverted Dialog Returns** | Both | Constant confusion for developers. | `MessageOKCancel()` returns True for Cancel |
| **M7** | **Busy-Wait Patterns** | Both | CPU-intensive delays; unresponsive UI. | `Do Until TheTime < Timer - ThePause: Loop` |
| **M8** | **2GB Database Limit** | Both | Active production constraint requiring monitoring and compaction. | Explicit size checks and compaction logic in AutoAttach |
| **M9** | **Screen.ActiveForm Dependencies** | Both | Functions break if called from unexpected forms. | ~20+ `Screen.ActiveForm.Name` checks throughout Common.txt |

### 3.4 LOW -- Cosmetic / Minor

| # | Issue | Apps | Impact | Evidence |
|---|---|---|---|---|
| **L1** | **Inconsistent Naming Conventions** | Both | Readability; maintenance difficulty. | Mix of PascalCase, spaces, underscores, `>` `*` `#` prefixes; typos |
| **L2** | **Unnamed Queries (Query1-9)** | KRHLApp | Unknown purpose; may be unused or critical. | `Query5`: hardcoded key=83; `Query7`: hardcoded date string |
| **L3** | **Dead/Commented-Out Code** | Both | Obscures active code; wastes developer time. | Entire OLE AutoCAD approach retained as comments; historical sync strategies |
| **L4** | **Misnamed Functions** | Both | Developer confusion. | `DatePlus30()` adds 28 days; custom `IsNumeric()` shadows built-in |
| **L5** | **No Source Control** | Both | No change history; no rollback capability. | Revisions via `CopyRight` date field only |

---

## 4. Risk Assessment Matrix

```
                    LIKELIHOOD OF OCCURRENCE
                    Low         Medium        High
              ┌─────────────┬─────────────┬─────────────┐
  High        │             │ C2 (Data    │ C1 (Jet     │
  Impact      │             │   Integrity)│   Repl)     │
              │             │ C5 (Silent  │ H1 (God     │
              │             │   Errors)   │   Modules)  │
              │             │             │ C4 (No      │
              │             │             │   Tests)    │
              ├─────────────┼─────────────┼─────────────┤
  Medium      │ H6 (UI-     │ H3 (Hard-   │ H2 (Global  │
  Impact      │   Logic)    │   coded     │   Vars)     │
              │             │   Paths)    │ H4 (Hard-   │
              │ M3 (Account │ M8 (2GB     │   coded     │
              │   Numbers)  │   Limit)    │   Names)    │
              │             │ C3 (SQL     │             │
              │             │   Inject)   │             │
              ├─────────────┼─────────────┼─────────────┤
  Low         │ L1 (Naming) │ M6 (Dialog) │ L3 (Dead    │
  Impact      │ L2 (Query   │ M7 (Busy    │   Code)     │
              │   Names)    │   Wait)     │ L5 (No      │
              │ L4 (Mis-    │             │   VCS)      │
              │   named)    │             │             │
              └─────────────┴─────────────┴─────────────┘
```

---

## 5. Domain Knowledge at Risk

The most valuable and irreplaceable asset in these applications is the **encoded domain knowledge**. Key areas:

### 5.1 Product Engineering (KRHLApp)
- **GapFill Algorithm** (~525 lines): Automatically calculates variable dimensions between products positioned along walls. Handles absolute/relative positioning, rotation, multi-pass recomputation.
- **PartsByItem Engine** (~2,250 lines): Complete parts computation with dimensional calculations, material assignment, cost computation, drawing coordinate generation.
- **VariableCheck** (~1,050 lines): Variable resolution engine supporting conditional logic, mathematical functions, nested expressions in product scripts.
- **CNC Program Generation**: Multi-machine output for Xilog, DXF, and cut lists with subassembly tracking.

### 5.2 Financial Rules (GL App)
- **Period Closing Enforcement** (`ArchivedDate()`): Multi-level fiscal year/month closing with date-based access control, password overrides, and January 15 cutoff.
- **GetBalance()**: Beginning balance calculation walking through FY9/FY5 fields and prior-period GL transactions.
- **Year-End Process**: 15-query proof/reconciliation workflow covering Cash, AR, AP, Deposits, and Sales.
- **Template-Driven Financials**: Configurable Balance Sheet and Income Statement structures allowing accountant-editable layouts.

### 5.3 Business Process Knowledge
- **Job Lifecycle**: Estimate → Design → Shop → Installation → Delivery → Completion phase workflow
- **Cost Allocation**: Office/Shop/Design/Install rate structures with overhead factors
- **AR Aging**: 5-bucket aging (Under 30, 30-60, 60-90, 90-120, 120+ days)
- **ADP Payroll Integration**: Employee mapping, benefit tracking, 401K eligibility
- **Sage Export**: 14 formatted export queries with transaction type codes

---

## 6. Modernization Options

### Option A: Maintain As-Is

**Effort**: Minimal ongoing
**Risk**: Increasing over time as Access/Jet support erodes

| Pro | Con |
|---|---|
| No investment required | Jet Replication is deprecated |
| Users are trained | 2GB limit actively constraining |
| All business logic works | Any staff change requires code edits |
| | Access runtime availability uncertain long-term |
| | No test coverage means no safe changes |

### Option B: Stabilize and Extend

**Effort**: 2--4 months
**Risk**: Moderate; reduces immediate risks

Targeted fixes without architectural changes:
1. Replace Jet Replication with linked SQL Server backend
2. Add error logging/alerting (enhance existing ErrorLogEntry)
3. Externalize hardcoded paths to a config table
4. Externalize hardcoded names to a roles/permissions table
5. Add parameterized query wrappers
6. Document critical business rules
7. Add this codebase to source control

### Option C: Incremental Migration

**Effort**: 12--24 months
**Risk**: Moderate; phased approach reduces blast radius

Migrate subsystems one at a time while maintaining Access front-end:
1. **Phase 1**: Move backend databases to SQL Server (keep Access front-end with ODBC links)
2. **Phase 2**: Build web-based reporting layer (replaces 205 Access reports)
3. **Phase 3**: Build web forms for high-traffic areas (GL, AP, AR, Time Entry)
4. **Phase 4**: Migrate remaining forms and VBA logic
5. **Phase 5**: Decommission Access front-end

### Option D: Full Platform Replacement

**Effort**: 18--36 months
**Risk**: High; requires complete domain knowledge transfer

Replace entire suite with modern technology:
- Web application (React/Angular/Blazor + API + SQL Server/PostgreSQL)
- Or industry ERP with customizations (NetSuite, Sage Intacct, etc.)

| Pro | Con |
|---|---|
| Modern, supportable technology | 858 queries to rewrite/validate |
| Proper security, testing, CI/CD | 205 reports to recreate |
| Mobile/remote access | 30K--40K lines of VBA domain logic to port |
| Scalable architecture | CNC/CAD integration must be preserved |
| | High risk of losing undocumented business rules |
| | 18--36 month timeline before full functionality |
| | Specialized features (GapFill, CNC) not available in off-the-shelf ERP |

---

## 7. Recommendation

Given the specialized nature of this application suite (CNC programming, auto-dimensioning, CAD integration), an **off-the-shelf ERP cannot replace KRHLApp**. The GL App is closer to standard accounting and could potentially be replaced by commercial software (Sage, QuickBooks Enterprise, etc.).

**Recommended approach: Option C (Incremental Migration)** with these priorities:

### Immediate (0--3 months)
1. Put all extracted code/queries under **source control** (this repository)
2. Replace **Jet Replication** with SQL Server backend (eliminates 2GB limit and deprecated sync)
3. Externalize **hardcoded paths and usernames** to configuration tables
4. Document the **year-end process** and **period closing rules**

### Short-Term (3--12 months)
5. Build **parameterized query layer** to eliminate SQL injection
6. Add **basic integration tests** for critical calculations (GetBalance, GapFill, PartsByItem)
7. Migrate **financial reporting** to a web-based BI tool (Power BI, SSRS)
8. Separate **Common.txt** into focused modules per application

### Medium-Term (12--24 months)
9. Build web-based **GL, AP, AR, and Payroll** forms
10. Build web-based **Time Entry** form
11. Modernize **ADP and Sage integrations** with proper APIs
12. Port **CNC program generation** to a standalone service

### Long-Term (24--36 months)
13. Build web-based **Product List and Parts** interface
14. Port **GapFill algorithm** and **PartsByItem engine** to modern code
15. Modernize **CAD integration** (AutoCAD/Revit APIs)
16. Decommission Access front-end

---

## 8. Key Metrics for Tracking Modernization

| Metric | Current | Target |
|---|---|---|
| VBA lines in production | ~31K--43K | 0 |
| Queries with Forms! references | ~50+ | 0 |
| Hardcoded file paths | 15+ | 0 |
| Hardcoded personnel names | 4+ | 0 |
| Global variables | ~370 | 0 |
| Automated test coverage | 0% | >80% |
| SQL injection-vulnerable queries | 858 | 0 |
| Backend database technology | Jet/MDB | SQL Server |
| Sync technology | Jet Replication (deprecated) | Modern replication/cloud |
| Maximum database size | 2GB | Unlimited |
| Source control | None | Git |
| CI/CD pipeline | None | Automated |
