# Schema Report: KRHLApp
---
## Tables
### BillableDesign
| Column | Type | Size |
|--------|------|------|
| Date | DATETIME | 19 |
| Hours | REAL | 24 |
| Job | INTEGER | 10 |
| Employee | VARCHAR | 255 |
| Weekof | VARCHAR | 255 |
| Void | BIT | 1 |

**Row count:** 2

### Charts
| Column | Type | Size |
|--------|------|------|
| Counter | REAL | 24 |
| Value1 | CURRENCY | 19 |
| Value2 | CURRENCY | 19 |
| Date1 | DATETIME | 19 |
| Date2 | DATETIME | 19 |
| Text1 | VARCHAR | 255 |
| Text2 | VARCHAR | 255 |

**Row count:** 0

### CopyRight
| Column | Type | Size |
|--------|------|------|
| ID | COUNTER | 10 |
| CopyRight | DATETIME | 19 |
| Message | VARCHAR | 50 |

**Row count:** 1

### EstimateTrend
| Column | Type | Size |
|--------|------|------|
| TrendDate | DATETIME | 19 |
| Trend1Amount | CURRENCY | 19 |
| Trend2Amount | CURRENCY | 19 |
| Trend3Amount | CURRENCY | 19 |
| Trend4Amount | CURRENCY | 19 |
| Trend1Job | VARCHAR | 255 |
| Trend2Job | VARCHAR | 255 |
| Trend3Job | VARCHAR | 255 |
| Trend4Job | VARCHAR | 255 |

**Row count:** 0

### VOJCGoal
| Column | Type | Size |
|--------|------|------|
| TheDay | INTEGER | 10 |
| VOJC | INTEGER | 10 |
| VOJCGoal | INTEGER | 10 |
| VOJCCurrent | INTEGER | 10 |

**Row count:** 0

## Relationships
No relationships extracted.

## Queries
### #AgreementsNeededScheduleQuery
```sql
SELECT [>Jobs].ID, [>Jobs].Customer, SalesSummarybyJob.SumOfSaleAmount AS Sale, ScheduleQueryMonth.EstimatedShipDate AS MinofMonth, InvoicesIssuedQuery.SumOfInvoiceAmount AS Invoices, PaymentsQuery.SumOfAmount AS Payments, [MIS Personnel].Employee, [>Jobs].ProductionPhase, [>Settings].Phase, [>Jobs].Estimate, [>Settings].PhaseSort

FROM ScheduleQueryMonth, PaymentsQuery, InvoicesIssuedQuery, SalesSummarybyJob, ([>Jobs] LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy = [MIS Personnel].Key) LEFT JO...
```
### *ARJobQuery2
```sql
SELECT DISTINCTROW [>Jobs].ID, [>Jobs].ProductionPhase, [MIS Personnel].Employee, [*InvoicesQuery2].MaxOfDue, [*InvoicesQuery2].Invoices, [*PaymentsQuery2_1].Payments, [*PaymentsQuery2_1].MaxOfCheckDate, Date()-[maxofcheckdate] AS PayDays, NNEZ([invoices])-NNEZ([payments])+NNEZ([DebitAmount]) AS Balance, IIf([Balance]>0,[Balance],0) AS DrBal, IIf([balance]<0,[balance],0) AS CrBal, Date()-[MaxofDue] AS Days, [*RefundQuery].DebitAmount, [>Jobs].Estimate, IIf([days]<31,[drbal],0) AS Under, IIf([day...
```
### *InvoicesQuery2
```sql
SELECT DISTINCTROW [>Jobs].Closed, [>Jobs].Estimate, [>Jobs].Owner, [>Jobs].ID, Sum([Sales Journal].InvoiceAmount) AS SumOfInvoiceAmount, Sum([Sales Journal].InvoiceAmount) AS Invoices, Max([Sales Journal].Due) AS MaxOfDue, Max([Sales Journal].Due) AS LastInvDate

FROM [>Jobs] LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job

WHERE ((([Sales Journal].Due) Is Not Null))

GROUP BY [>Jobs].Closed, [>Jobs].Estimate, [>Jobs].Owner, [>Jobs].ID

HAVING ((([>Jobs].Closed)=False) AND (([>Jobs...
```
### *PaymentsQuery2
```sql
SELECT DISTINCTROW [>Jobs].Closed, [>Jobs].Estimate, [>Jobs].ID, Sum([Receipts Journal].Amount) AS SumOfAmount, Sum([Receipts Journal].Amount) AS Payments, Max([Receipts Journal].CheckDate) AS MaxOfCheckDate, Max([Receipts Journal].EntryDate) AS MaxOfEntryDate

FROM [>Jobs] LEFT JOIN [Receipts Journal] ON [>Jobs].Key=[Receipts Journal].Job

GROUP BY [>Jobs].Closed, [>Jobs].Estimate, [>Jobs].ID

HAVING ((([>Jobs].Closed)=False) AND (([>Jobs].Estimate)=False));
```
### *RefundQuery
```sql
SELECT [>General Ledger Query].ID, [>General Ledger Query].SourceTransaction, [>General Ledger Query].AccountNumber, [>General Ledger Query].TransactionDate, [>General Ledger Query].DebitAmount, [>General Ledger Query].CreditAmount

FROM [>General Ledger Query]

WHERE ((([>General Ledger Query].SourceTransaction)="refund") AND (([>General Ledger Query].AccountNumber)=121));
```
### >ACAD Font Query
```sql
SELECT DISTINCTROW [>Settings].ACADFont

FROM [>Settings]

WHERE ((([>Settings].ACADFont) Is Not Null))

ORDER BY [>Settings].ACADFont;
```
### >Abs/Rel Query
```sql
SELECT DISTINCTROW [>Settings].MacroToRun, [>Settings].MenuText

FROM [>Settings]

WHERE ((([>Settings].MenuText)="abs" Or ([>Settings].MenuText)="rel"))

ORDER BY [>Settings].MacroToRun;
```
### >Agreement Query
```sql
SELECT DISTINCTROW [>Resources].ID, [>Resources].Category, [>Resources].Key, InStr([Category],"Contract") Or InStr([Category],"Customer") Or InStr([Category],"Architect") Or InStr([Category],"Design") AS Expr1

FROM [>Resources]

ORDER BY [>Resources].Category, [>Resources].ID;
```
### >Alternate Materials Query
```sql
SELECT DISTINCTROW [>Material].Description, [>Material].Category, [>Material].ID, [>Material].Key

FROM [>Material]

WHERE ((([>Material].StandardMaterial)=No))

ORDER BY [>Material].Category, [>Material].Description, [>Material].ID

WITH OWNERACCESS OPTION;
```
### >Alternates Global Query
```sql
SELECT DISTINCTROW [>Product Lists].ProductList, [>Designs].Alternate, First([>Designs].Key) AS FirstOfKey

FROM [>Designs] LEFT JOIN [>Product Lists] ON [>Designs].ProductListKey=[>Product Lists].Key

GROUP BY [>Product Lists].ProductList, [>Designs].Alternate, [>Designs].ProductListKey

HAVING ((([>Product Lists].ProductList) Is Not Null) AND (([>Designs].Alternate) Is Not Null) AND (([>Designs].ProductListKey) Is Not Null))

ORDER BY [>Product Lists].ProductList, [>Designs].Alternate

WITH OW...
```
### >Alternates Materials Standard Query
```sql
SELECT DISTINCTROW [>Material].Description, [>Material].Category, [>Material].ID, [>Material].Key

FROM [>Material]

WHERE ((([>Material].StandardMaterial)=Yes))

ORDER BY [>Material].Category, [>Material].Description, [>Material].ID

WITH OWNERACCESS OPTION;
```
### >Alternates Product List Query
```sql
SELECT DISTINCTROW [>Product List Query].Design1 AS Expr1, [>Product List Query].Design1Type AS Expr2, [>Product List Query].Design2 AS Expr3, [>Product List Query].Design2Type AS Expr4, [>Product List Query].Design3 AS Expr5, [>Product List Query].Design3Type AS Expr6, [>Product List Query].Design4 AS Expr7, [>Product List Query].Design4Type AS Expr8, [>Product List Query].Design5 AS Expr9, [>Product List Query].Design5Type AS Expr10, [>Product List Query].Design6 AS Expr11, [>Product List Quer...
```
### >Alternates Query
```sql
SELECT DISTINCTROW [>Designs].Alternate, [>Designs].ProductListKey

FROM [>Designs]

GROUP BY [>Designs].Alternate, [>Designs].ProductListKey

HAVING ((([>Designs].ProductListKey)=Forms!ProductListMaster!ProductListControl!ProductListName))

ORDER BY [>Designs].Alternate

WITH OWNERACCESS OPTION;
```
### >Architect Query
```sql
SELECT DISTINCTROW [>Resources].ID, [>Resources].Category, [>Resources].Key, InStr([Category],"Architect") AS Expr1

FROM [>Resources]

WHERE (((InStr([Category],"Architect"))<>0))

ORDER BY [>Resources].Category, [>Resources].ID;
```
### >Atachments Required Query
```sql
SELECT [>Attachments].Path

FROM [>Attachments]

GROUP BY [>Attachments].Path

ORDER BY [>Attachments].Path;
```
### >Attachments Query
```sql
SELECT DISTINCTROW [>Attachments].*

FROM [>Attachments]

ORDER BY [>Attachments].Path, [>Attachments].TableName

WITH OWNERACCESS OPTION;
```
### >Builders Query
```sql
SELECT DISTINCTROW [>Resources].ID, [>Resources].Key

FROM [>Resources]

WHERE ((([>Resources].Category)="Builders"))

ORDER BY [>Resources].ID

WITH OWNERACCESS OPTION;
```
### >CNC Compute Subassembly Query
```sql
SELECT DISTINCTROW [>Product Parts CNC].SubAssembly, First([>Product Parts CNC].Sequence) AS FirstOfSequence

FROM [>Product Parts CNC]

GROUP BY [>Product Parts CNC].SubAssembly, [>Product Parts CNC].Category, [>Product Parts CNC].CNCMachine

HAVING ((([>Product Parts CNC].SubAssembly) Is Not Null) And (([>Product Parts CNC].Category)=Forms!ProductListMaster!ProductListControl!Product) And (([>Product Parts CNC].CNCMachine)=Forms!CNC.CNCMachine))

ORDER BY First([>Product Parts CNC].Sequence);
```
### >CNC Function Query
```sql
SELECT DISTINCTROW [>Settings].CNCFunctionDescription, [>Settings].CNCFunction, [>Settings].CNCMachines, [>Settings].Key

FROM [>Settings]

WHERE ((([>Settings].CNCFunction) Is Not Null))

ORDER BY [>Settings].CNCMachines, [>Settings].CNCFunctionDescription;
```
### >CNC Items Query
```sql
SELECT DISTINCTROW [>Product List Whole Query].Item

FROM [>Product List Whole Query]

ORDER BY [>Product List Whole Query].Item

WITH OWNERACCESS OPTION;
```
### >CNC Machine Query
```sql
SELECT DISTINCTROW [>Settings].CNCMachines, [>Settings].CNCFunction, [>Settings].CNCToolSize, [>Settings].CNCFunctionDescription

FROM [>Settings]

WHERE ((([>Settings].CNCMachines) Is Not Null))

ORDER BY [>Settings].CNCMachines, [>Settings].CNCFunctionDescription;
```
### >CNC Machines Query
```sql
SELECT DISTINCTROW [>Settings].CNCMachines

FROM [>Settings]

GROUP BY [>Settings].CNCMachines

HAVING ((([>Settings].CNCMachines)<>""))

ORDER BY [>Settings].CNCMachines;
```
### >CNC Query
```sql
SELECT DISTINCTROW [>CNC].Key, [>CNC].ProductList, [>CNC].Item, [>CNC].Trace, [>CNC].Sequence, [>CNC].Subassembly, [>CNC].Function, [>CNC].Tool, [>CNC].X, [>CNC].Y, [>CNC].Z, [>CNC].ZPos, [>CNC].XPos, [>CNC].YPos, [>CNC].Command, [>CNC].DXF, [>CNC].Visible, [>CNC].Machine, [>CNC].DesignKey, [>CNC].PartDescription, [>CNC].Quantity, [>CNC].GrainFlag, [>CNC].FaceIdentifier, [>CNC].FaceDependency, [>CNC].MaterialSpec, [>CNC].Mirror, [>CNC].MaterialKey, [>CNC].CNCRotate, [>Product List].Item AS PLIte...
```
### >CNC Subassembly Query
```sql
SELECT DISTINCTROW [>Product Parts CNC].SubAssembly

FROM [>Product List Query], [>Product Parts CNC]

GROUP BY [>Product Parts CNC].SubAssembly

HAVING ((([>Product Parts CNC].SubAssembly) Is Not Null))

ORDER BY First([>Product Parts CNC].Sequence);
```
### >CNC Table Compute Subassembly Query
```sql
SELECT DISTINCTROW [>CNC].Subassembly, First([>CNC].Sequence) AS FirstOfSequence

FROM [>CNC]

WHERE ((([>CNC].ProductList) Is Not Null))

GROUP BY [>CNC].Subassembly

HAVING ((([>CNC].Subassembly) Is Not Null))

ORDER BY [>CNC].Subassembly, First([>CNC].Sequence);
```
### >CNC_Default_Material
```sql
SELECT [>CNC].MaterialSpec

FROM [>CNC]

GROUP BY [>CNC].MaterialSpec, [>CNC].ProductList

HAVING ((Not ([>CNC].ProductList) Is Null));
```
### >Cash Account Query
```sql
SELECT DISTINCTROW [MIS Accounts].Number, [MIS Accounts].Account

FROM [MIS Accounts]

WHERE (((InStr([Account],"cash"))<>"0"));
```
### >ContractSubForm Query
```sql
SELECT DISTINCTROW [>Settings].Key, [>Settings].ContractHeader, [>Settings].ContractFooter

FROM [>Settings]

WHERE ((([>Settings].Key)=2));
```
### >Contractor Query
```sql
SELECT DISTINCTROW [>Resources].ID, [>Resources].Category, [>Resources].Key, InStr([Category],"Contract") AS Expr1

FROM [>Resources]

WHERE (((InStr([Category],"Contract"))<>0))

ORDER BY [>Resources].Category, [>Resources].ID;
```
### >Coordinates Query
```sql
SELECT DISTINCTROW [>Product Parts].DrawXRelativeTo AS Expr1, [>Product Parts].DrawXFactor AS Expr2, [>Product Parts].DrawX AS Expr3, [>Product Parts].DrawXOffsetFactor AS Expr4, [>Product Parts].DrawXOffsetMaterial AS Expr5, [>Product Parts].DrawYRelativeTo AS Expr6, [>Product Parts].DrawYFactor AS Expr7, [>Product Parts].DrawY AS Expr8, [>Product Parts].DrawYOffsetFactor AS Expr9, [>Product Parts].DrawYOffsetMaterial AS Expr10, [>Product Parts].DrawZRelativeTo AS Expr11, [>Product Parts].DrawZ...
```
### >Coordinates X Query
```sql
SELECT DISTINCTROW [>Settings].XCoordinateDimensionCode AS Expr1, [>Settings].XCoordinateDimension AS Expr2

FROM [>Settings]

WHERE ((([>Settings].XCoordinateDimensionCode)=4 Or ([>Settings].XCoordinateDimensionCode)=5 Or ([>Settings].XCoordinateDimensionCode)=3 Or ([>Settings].XCoordinateDimensionCode)=2 Or ([>Settings].XCoordinateDimensionCode)=1 Or ([>Settings].XCoordinateDimensionCode)=100 Or ([>Settings].XCoordinateDimensionCode)=0 Or ([>Settings].XCoordinateDimensionCode)=101 Or ([>Settin...
```
### >Coordinates Y Query
```sql
SELECT DISTINCTROW [>Settings].YCoordinateDimensionCode AS Expr1, [>Settings].YCoordinateDimension AS Expr2

FROM [>Settings]

WHERE ((([>Settings].YCoordinateDimensionCode)=4 Or ([>Settings].YCoordinateDimensionCode)=5 Or ([>Settings].YCoordinateDimensionCode)=3 Or ([>Settings].YCoordinateDimensionCode)=2 Or ([>Settings].YCoordinateDimensionCode)=1 Or ([>Settings].YCoordinateDimensionCode)=100 Or ([>Settings].YCoordinateDimensionCode)=0 Or ([>Settings].YCoordinateDimensionCode)=101 Or ([>Settin...
```
### >Coordinates Z Query
```sql
SELECT DISTINCTROW [>Settings].ZCoordinateDimensionCode AS Expr1, [>Settings].ZCoordinateDimension AS Expr2

FROM [>Settings]

WHERE ((([>Settings].ZCoordinateDimensionCode)=4 Or ([>Settings].ZCoordinateDimensionCode)=5 Or ([>Settings].ZCoordinateDimensionCode)=3 Or ([>Settings].ZCoordinateDimensionCode)=2 Or ([>Settings].ZCoordinateDimensionCode)=1 Or ([>Settings].ZCoordinateDimensionCode)=100 Or ([>Settings].ZCoordinateDimensionCode)=0 Or ([>Settings].ZCoordinateDimensionCode)=101 Or ([>Settin...
```
### >Correspondence Archive Subform Query
```sql
SELECT DISTINCTROW [>Correspondence].*

FROM [>Correspondence]

WHERE ((([>Correspondence].Name)=Forms!Resources.Key))

ORDER BY [>Correspondence].Date DESC , [>Correspondence].ID

WITH OWNERACCESS OPTION;
```
### >Correspondence Categories Query
```sql
SELECT DISTINCTROW [>Resources].Key, [>Resources].ID

FROM [>Resources]

WHERE ((([>Resources].Category)=Forms!Correspondence.CategorySort))

ORDER BY [>Resources].ID

WITH OWNERACCESS OPTION;
```
### >Correspondence Correspondence Query
```sql
SELECT DISTINCTROW [>Correspondence].Correspondence

FROM [>Correspondence]

WHERE ((([>Correspondence].Key)=NNEZ(Forms!Correspondence.Key)));
```
### >Correspondence ID Query
```sql
SELECT DISTINCTROW [>Correspondence].ID, [>Correspondence].Name

FROM [>Correspondence]

GROUP BY [>Correspondence].ID, [>Correspondence].Name

HAVING ((([>Correspondence].Name)=NNEZ(Forms!Correspondence.Category) And ([>Correspondence].Name)<>0))

ORDER BY [>Correspondence].ID;
```
### >Correspondence Query
```sql
SELECT DISTINCTROW [>Correspondence].*

FROM [>Correspondence]

WHERE ((([>Correspondence].Name)=Forms!Correspondence.Category))

ORDER BY Val(NNEZ([Sequence]))

WITH OWNERACCESS OPTION;
```
### >Correspondence Report Query
```sql
SELECT DISTINCTROW [>Correspondence].*

FROM [>Correspondence]

WHERE ((([>Correspondence].Key)=Forms!Correspondence.Key));
```
### >Correspondence Subform Query
```sql
SELECT DISTINCTROW [>Correspondence].*, [>Correspondence].Key, [>Correspondence].ID, [>Correspondence].Correspondence, [>Correspondence].Date, [>Correspondence].Description, [>Correspondence].Name

FROM [>Correspondence]

WHERE ((([>Correspondence].Name)=Forms!Resources.Key))

ORDER BY [>Correspondence].Date DESC , [>Correspondence].ID

WITH OWNERACCESS OPTION;
```
### >Correspondence Template Query
```sql
SELECT DISTINCTROW [>Correspondence].ID, [>Correspondence].Key

FROM [>Correspondence] RIGHT JOIN [>Resources] ON [>Correspondence].Name=[>Resources].Key

WHERE ((([>Resources].Category)="Templates") AND (([>Resources].ID)="Estimate"))

ORDER BY [>Correspondence].ID

WITH OWNERACCESS OPTION;
```
### >Correspondence Templates Query
```sql
SELECT DISTINCTROW [>Correspondence].ID, [>Correspondence].Key

FROM [>Correspondence] LEFT JOIN [>Resources] ON [>Correspondence].Name=[>Resources].Key

WHERE (((InStr([Category],"Template"))<>"0"))

ORDER BY [>Correspondence].ID

WITH OWNERACCESS OPTION;
```
### >Cost Units Query
```sql
SELECT DISTINCTROW [>Settings].CostUnits

FROM [>Settings]

WHERE ((([>Settings].CostUnits) Is Not Null))

ORDER BY [>Settings].CostUnits

WITH OWNERACCESS OPTION;
```
### >Customers
```sql
SELECT DISTINCTROW [>Resources].ID

FROM [>Resources]

WHERE ((([>Resources].Category)="Customers"))

ORDER BY [>Resources].ID

WITH OWNERACCESS OPTION;
```
### >Customers Query
```sql
SELECT DISTINCTROW [>Resources].ID, [>Resources].Key

FROM [>Resources]

WHERE ((([>Resources].Category)="Customer"))

ORDER BY [>Resources].ID

WITH OWNERACCESS OPTION;
```
### >Deposit Account Query
```sql
SELECT DISTINCTROW [MIS Accounts].Number, [MIS Accounts].Account

FROM [MIS Accounts]

WHERE (((InStr([Account],"deposit"))<>"0"));
```
### >Design Categories Query
```sql
SELECT DISTINCTROW [>Products].Category, First([>Products].Key) AS FirstOfKey

FROM [>Products]

GROUP BY [>Products].Category, [>Products].ProductType

HAVING ((([>Products].Category) Is Not Null) AND (([>Products].ProductType)="Design" Or ([>Products].ProductType)="Null"))

ORDER BY [>Products].Category

WITH OWNERACCESS OPTION;
```
### >Design Category Query
```sql
SELECT DISTINCTROW [>Products].Category, First([>Products].Key) AS FirstOfKey

FROM [>Products]

GROUP BY [>Products].Category, [>Products].ProductType

HAVING ((([>Products].ProductType)="Design"))

ORDER BY [>Products].Category

WITH OWNERACCESS OPTION;
```
### >Design ID Query
```sql
SELECT DISTINCTROW [>Products].ID, [>Products].Category, [>Products].Description, [>Products].Key

FROM [>Products]

GROUP BY [>Products].ID, [>Products].Category, [>Products].Description, [>Products].Key, [>Products].ID, [>Products].ProductType

HAVING ((([>Products].ID)<>"") AND (([>Products].Category)<>"") AND (([>Products].ProductType)="Design"))

ORDER BY [>Products].Category, [>Products].ID

WITH OWNERACCESS OPTION;
```
### >Design Query
```sql
SELECT DISTINCTROW [>Design].*

FROM [>Design]

WHERE ((([>Design].Category)=Forms!Design.CategorySort) And (([>Design].ID)<>"ID"))

ORDER BY [>Design].Category, [>Design].ID

WITH OWNERACCESS OPTION;
```
### >Design Rate
```sql
SELECT [MIS Personnel].Key, [MIS Personnel].Employee AS Designer, [MIS Personnel].DesignRate

FROM [MIS Personnel];
```
### >Designed by Query
```sql
SELECT DISTINCTROW [>Resources].ID, [>Resources].Category, [>Resources].Key, InStr([Category],"Design") AS Expr1

FROM [>Resources]

WHERE (((InStr([Category],"Design"))<>0))

ORDER BY [>Resources].Category, [>Resources].ID;
```
### >Designers Query
```sql
SELECT DISTINCTROW [>Resources].ID, [>Resources].Key

FROM [>Resources]

WHERE ((([>Resources].Category)="Designers"))

ORDER BY [>Resources].ID

WITH OWNERACCESS OPTION;
```
### >Designs Query
```sql
SELECT DISTINCTROW [>Products].Description, [>Products].Category, [>Products].ID, [>Products].Key

FROM [>Products]

WHERE ((([>Products].ProductType)="Design") And (([>Products].UnlistedProduct)=False))

ORDER BY [>Products].Category, [>Products].ID

WITH OWNERACCESS OPTION;
```
### >Directory Path Query
```sql
SELECT DISTINCTROW [>Local Settings].DirectoryPath, [>Local Settings].Key

FROM [>Local Settings]

WHERE ((([>Local Settings].DirectoryPath) Is Not Null And ([>Local Settings].DirectoryPath)<>""))

ORDER BY [>Local Settings].DirectoryPath;
```
### >Directory Query
```sql
SELECT DISTINCTROW [>Directory].ID AS Expr1, [>Directory].ProductCategory AS Expr2, [>Directory].Description AS Expr3, [>Directory].Key AS Expr4, [>Directory].Category AS Expr5

FROM [>Directory]

ORDER BY [>Directory].ProductCategory, [>Directory].ID;
```
### >Drawing Aid Wall X Query
```sql
SELECT DISTINCTROW [>Settings].XDrawingAidCode AS Expr1, [>Settings].XDrawingAid AS Expr2

FROM [>Settings]

WHERE ((([>Settings].XDrawingAidCode)=7 Or ([>Settings].XDrawingAidCode)=8 Or ([>Settings].XDrawingAidCode)=9))

ORDER BY [>Settings].XDrawingAidCode;
```
### >Drawing Aid Wall Y Query
```sql
SELECT DISTINCTROW [>Settings].YDrawingAidCode AS Expr1, [>Settings].YDrawingAid AS Expr2

FROM [>Settings]

WHERE ((([>Settings].YDrawingAidCode)=7 Or ([>Settings].YDrawingAidCode)=8 Or ([>Settings].YDrawingAidCode)=9))

ORDER BY [>Settings].YDrawingAidCode;
```
### >Drawing Aid Wall Z Query
```sql
SELECT DISTINCTROW [>Settings].ZDrawingAidCode AS Expr1, [>Settings].ZDrawingAid AS Expr2

FROM [>Settings]

WHERE ((([>Settings].ZDrawingAidCode)=7 Or ([>Settings].ZDrawingAidCode)=8 Or ([>Settings].ZDrawingAidCode)=9))

ORDER BY [>Settings].ZDrawingAidCode;
```
### >Drawing All Query
```sql
SELECT DISTINCTROW [>Drawings].*, Right([ScaleTemplate],Len([ScaleTemplate])-1) AS Expr1

FROM [>Drawings] INNER JOIN [>Settings] ON [>Drawings].TheScale=[>Settings].TheScale

WHERE ((([>Drawings].Name)=Forms!Drawings.Category) And (([>Drawings].Drawing) Is Not Null And ([>Drawings].Drawing)<>""))

ORDER BY [>Drawings].Sequence

WITH OWNERACCESS OPTION;
```
### >Drawing Begin X Query
```sql
SELECT DISTINCTROW [>Settings].XDrawingAidCode AS Expr1, [>Settings].XDrawingAid AS Expr2

FROM [>Settings]

WHERE ((([>Settings].XDrawingAidCode)=1 Or ([>Settings].XDrawingAidCode)=2 Or ([>Settings].XDrawingAidCode)=2.1 Or ([>Settings].XDrawingAidCode)=7 Or ([>Settings].XDrawingAidCode)=10 Or ([>Settings].XDrawingAidCode)=11 Or ([>Settings].XDrawingAidCode)=12))

ORDER BY [>Settings].XDrawingAidCode;
```
### >Drawing Begin Y Query
```sql
SELECT DISTINCTROW [>Settings].YDrawingAidCode AS Expr1, [>Settings].YDrawingAid AS Expr2

FROM [>Settings]

WHERE ((([>Settings].YDrawingAidCode)=1 Or ([>Settings].YDrawingAidCode)=2))

ORDER BY [>Settings].YDrawingAidCode;
```
### >Drawing Begin Z Query
```sql
SELECT DISTINCTROW [>Settings].ZDrawingAidCode AS Expr1, [>Settings].ZDrawingAid AS Expr2

FROM [>Settings]

WHERE ((([>Settings].ZDrawingAidCode)=1 Or ([>Settings].ZDrawingAidCode)=2 Or ([>Settings].ZDrawingAidCode)=10))

ORDER BY [>Settings].ZDrawingAidCode;
```
### >Drawing Customer Query
```sql
SELECT DISTINCTROW [>Drawings].*, Right([ScaleTemplate],Len([ScaleTemplate])-1) AS Expr1

FROM [>Drawings] INNER JOIN [>Settings] ON [>Drawings].TheScale=[>Settings].TheScale

WHERE ((([>Drawings].Drawing) Is Not Null And ([>Drawings].Drawing)<>"") And (([>Drawings].Customer)=Yes) And (([>Drawings].Name)=Forms!Drawings.Category))

ORDER BY [>Drawings].Sequence

WITH OWNERACCESS OPTION;
```
### >Drawing End X Query
```sql
SELECT DISTINCTROW [>Settings].XDrawingAidCode AS Expr1, [>Settings].XDrawingAid AS Expr2

FROM [>Settings]

WHERE ((([>Settings].XDrawingAidCode)=3 Or ([>Settings].XDrawingAidCode)=4 Or ([>Settings].XDrawingAidCode)=7 Or ([>Settings].XDrawingAidCode)=10 Or ([>Settings].XDrawingAidCode)=11))

ORDER BY [>Settings].XDrawingAidCode;
```
### >Drawing End Y Query
```sql
SELECT DISTINCTROW [>Settings].YDrawingAidCode AS Expr1, [>Settings].YDrawingAid AS Expr2

FROM [>Settings]

WHERE ((([>Settings].YDrawingAidCode)=1 Or ([>Settings].YDrawingAidCode)=2 Or ([>Settings].YDrawingAidCode)=3 Or ([>Settings].YDrawingAidCode)=4 Or ([>Settings].YDrawingAidCode)=5 Or ([>Settings].YDrawingAidCode)=6))

ORDER BY [>Settings].YDrawingAidCode;
```
### >Drawing End Z Query
```sql
SELECT DISTINCTROW [>Settings].ZDrawingAidCode AS Expr1, [>Settings].ZDrawingAid AS Expr2

FROM [>Settings]

WHERE ((([>Settings].ZDrawingAidCode)=3 Or ([>Settings].ZDrawingAidCode)=4 Or ([>Settings].ZDrawingAidCode)=5))

ORDER BY [>Settings].ZDrawingAidCode;
```
### >Drawing Install Query
```sql
SELECT DISTINCTROW [>Drawings].*, Right([ScaleTemplate],Len([ScaleTemplate])-1) AS Expr1

FROM [>Drawings] INNER JOIN [>Settings] ON [>Drawings].TheScale=[>Settings].TheScale

WHERE ((([>Drawings].Drawing) Is Not Null And ([>Drawings].Drawing)<>"") And (([>Drawings].Install)=True) And (([>Drawings].Name)=Forms!Drawings.Category))

ORDER BY [>Drawings].Sequence

WITH OWNERACCESS OPTION;
```
### >Drawing Part Query
```sql
SELECT DISTINCTROW [>Parts].*

FROM [>Parts]

WHERE ((([>Parts].Draw)=Yes) And (([>Parts].Category)=Forms!Parts.CategorySort))

ORDER BY [>Parts].SubAssembly DESC , [>Parts].Part

WITH OWNERACCESS OPTION;
```
### >Drawing Query
```sql
SELECT DISTINCTROW [>Drawings].*, Right([ScaleTemplate],Len([ScaleTemplate])-1) AS Expr1

FROM [>Drawings] INNER JOIN [>Settings] ON [>Drawings].TheScale=[>Settings].TheScale

WHERE ((([>Drawings].Key)=Forms!Drawings.Key))

WITH OWNERACCESS OPTION;
```
### >Drawing Setup Query
```sql
SELECT DISTINCTROW [>Local Settings].*

FROM [>Local Settings];
```
### >Drawing Shop Query
```sql
SELECT DISTINCTROW [>Drawings].*, Right([ScaleTemplate],Len([ScaleTemplate])-1) AS Expr1

FROM [>Drawings] INNER JOIN [>Settings] ON [>Drawings].TheScale=[>Settings].TheScale

WHERE ((([>Drawings].Drawing) Is Not Null And ([>Drawings].Drawing)<>"") And (([>Drawings].Shop)=True) And (([>Drawings].Name)=Forms!Drawings.Category))

ORDER BY [>Drawings].Sequence

WITH OWNERACCESS OPTION;
```
### >Drawing Templates Query
```sql
SELECT DISTINCTROW [>Drawings].ID, [>Drawings].Key

FROM [>Resources] RIGHT JOIN [>Drawings] ON [>Resources].Key=[>Drawings].Name

WHERE (((InStr([Category],"Template"))<>"0"))

ORDER BY [>Drawings].ID

WITH OWNERACCESS OPTION;
```
### >Drawings Categories Query
```sql
SELECT DISTINCTROW [>Resources].Key, [>Resources].ID, Count([>Drawings].Drawing) AS CountOfDrawing

FROM [>Resources] LEFT JOIN [>Drawings] ON [>Resources].Key=[>Drawings].Name

GROUP BY [>Resources].Key, [>Resources].ID, [>Resources].Category

HAVING ((([>Resources].Category)=Forms!Drawings.CategorySort))

ORDER BY [>Resources].ID

WITH OWNERACCESS OPTION;
```
### >Drawings Job Query
```sql
SELECT DISTINCTROW [>Drawings].Job AS Expr1, [>Drawings].Name

FROM [>Drawings]

GROUP BY [>Drawings].Job, [>Drawings].Name

HAVING ((([>Drawings].Name)=Forms!Drawings.Category))

ORDER BY [>Drawings].Job;
```
### >Drawings Query
```sql
SELECT DISTINCTROW [>Drawings].*

FROM [>Drawings]

WHERE ((([>Drawings].Name)=Forms!Drawings.Category And ([>Drawings].Name) Is Not Null))

ORDER BY Val(NNEZ([Sequence]))

WITH OWNERACCESS OPTION;
```
### >Engineer Query
```sql
SELECT DISTINCTROW [MIS Personnel].Employee, [MIS Personnel].Key, [MIS Personnel].Text2

FROM [MIS Personnel]

WHERE ((([MIS Personnel].Text2)="Engineer" Or ([MIS Personnel].Text2)="Project Manager"))

ORDER BY [MIS Personnel].Employee;
```
### >Errors Query
```sql
SELECT DISTINCTROW [>Errors].Error, [>Errors].Time

FROM [>Errors]

WHERE ((([>Errors].Error) Is Not Null) AND (([>Errors].Time) Is Not Null))

ORDER BY [>Errors].Time;
```
### >Estimates All Query
```sql
SELECT [>Jobs].Key, [Sales Journal].Due, [Sales Journal].Description, [>Jobs].Estimate

FROM [Sales Journal] LEFT JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key

WHERE ((([Sales Journal].Due)>=#1/1/2000#) AND (([Sales Journal].Description)="Proposal") AND (([>Jobs].Estimate)=True));
```
### >Estimates All Value Query
```sql
SELECT Year([>estimates all query]!Due) AS Expr1, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount

FROM [>Estimates All Query] LEFT JOIN [Sales Journal] ON [>Estimates All Query].Key=[Sales Journal].Job

GROUP BY Year([>estimates all query]!Due);
```
### >Estimates Closed Query
```sql
SELECT [>Jobs].Key, [Sales Journal].Due, [Sales Journal].Description, [>Jobs].Closed, [>Jobs].Estimate

FROM [Sales Journal] LEFT JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key

WHERE ((([Sales Journal].Due)>=#1/1/2000#) AND (([Sales Journal].Description)="Proposal") AND (([>Jobs].Closed)=True) AND (([>Jobs].Estimate)=True));
```
### >Estimates Closed Value Query
```sql
SELECT Year([>estimates closed query]!Due) AS Expr1, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount

FROM [>Estimates Closed Query] LEFT JOIN [Sales Journal] ON [>Estimates Closed Query].Key=[Sales Journal].Job

GROUP BY Year([>estimates closed query]!Due);
```
### >Estimates Open Query
```sql
SELECT [>Jobs].Key, [Sales Journal].Due, [Sales Journal].Description, [>Jobs].Closed, [>Jobs].Estimate

FROM [Sales Journal] LEFT JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key

WHERE ((([Sales Journal].Due)>=#1/1/2000#) AND (([Sales Journal].Description)="Proposal") AND (([>Jobs].Closed)=False) AND (([>Jobs].Estimate)=True));
```
### >Estimates Partner Query
```sql
SELECT [Sales Journal].*, [>Jobs].ProductionPhase, [>Jobs].ID, [>Jobs].SpecifiedBy, [MIS Personnel_1].Employee, [>Jobs].Info2, [>Jobs].Key, [>Jobs].Estimate, [>Jobs].Closed

FROM (([Sales Journal] INNER JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key) LEFT JOIN [MIS Personnel] AS [MIS Personnel_1] ON [>Jobs].ManagedBy=[MIS Personnel_1].Key) LEFT JOIN [MIS Personnel] ON [>Jobs].SpecifiedBy=[MIS Personnel].Key

WHERE ((([MIS Personnel_1].Employee)=Forms!Sales.Partner) And (([>Jobs].Estimate)=True)...
```
### >Form Logo Query
```sql
SELECT DISTINCTROW [>Settings].Key, [>Settings].New

FROM [>Settings]

WHERE ((([>Settings].Key)=7));
```
### >General Ledger Query
```sql
SELECT DISTINCTROW [General Ledger].*, [>Resources].ID, [MIS Accounts].Account

FROM ([General Ledger] LEFT JOIN [MIS Accounts] ON [General Ledger].AccountNumber=[MIS Accounts].Number) LEFT JOIN [>Resources] ON [General Ledger].SourceOperative=[>Resources].Key

ORDER BY [General Ledger].AccountNumber, [General Ledger].TransactionDate;
```
### >Help Category Sort Query
```sql
SELECT DISTINCTROW [>Help].Label, [>Help].Form, [>Help].Category, [>Help].Key

FROM [>Help]

WHERE ((([>Help].Form)=Forms!Help.HelpForm))

ORDER BY [>Help].Category, [>Help].Label;
```
### >Help Query
```sql
SELECT DISTINCTROW [>Help].*

FROM [>Help]

WHERE ((([>Help].Key)=Forms!HelpEdit.CategorySort))

ORDER BY [>Help].Form, [>Help].Category, [>Help].Label;
```
### >Hours Entry Locked Personnel Query
```sql
SELECT DISTINCTROW [MIS Personnel].Employee, [MIS Personnel].Key, [MIS Personnel].Rate, [MIS Personnel].ADPFile, [MIS Personnel].ADPName, [MIS Personnel].ADPNetAccount, [MIS Personnel].WitholdingAccount, [MIS Personnel].MedicalAccount, [MIS Personnel].EmployerAccount, [MIS Personnel].MiscAccount, [MIS Personnel].RetirementAccount

FROM [MIS Personnel]

WHERE ((([MIS Personnel].Closed)=False))

ORDER BY [MIS Personnel].Employee

WITH OWNERACCESS OPTION;
```
### >Hours Entry Personnel Query
```sql
SELECT DISTINCTROW [MIS Personnel].Employee, [MIS Personnel].Key, [MIS Personnel].Rate, [MIS Personnel].ADPFile, [MIS Personnel].ADPName, [MIS Personnel].ADPNetAccount, [MIS Personnel].WitholdingAccount, [MIS Personnel].MedicalAccount, [MIS Personnel].EmployerAccount, [MIS Personnel].MiscAccount, [MIS Personnel].RetirementAccount

FROM [MIS Personnel]

WHERE ((([MIS Personnel].ADPFile)<>0) And (([MIS Personnel].Closed)=Forms!HoursEntry!ViewArchived))

ORDER BY [MIS Personnel].Employee

WITH OWNE...
```
### >Installer Query
```sql
SELECT DISTINCTROW [MIS Personnel].Employee, [MIS Personnel].Key, [MIS Personnel].Text2

FROM [MIS Personnel]

WHERE ((([MIS Personnel].Text2)="Installer"))

ORDER BY [MIS Personnel].Employee;
```
### >InvoiceSubForm Query
```sql
SELECT DISTINCTROW [Sales Journal].*, IIf(InStr([Description],"Proposal")<>0,[InvoiceAmount],0) AS ProposalAmount, [>Jobs].Key

FROM [>Jobs] LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job

WHERE (((IIf(Not forms!Sales!Family And [Job]=forms!Sales!Jobname,True,IIf(forms!Sales!Family And [Parent]=Forms!Sales!JobName Or forms!Sales!Family And [Job]=Forms!Sales!JobName,True,False)))=True) And (([Sales Journal].Journal)="Invoice"))

ORDER BY [>Jobs].ID, [Sales Journal].InvoiceNumber;
```
### >Invoices and Payments Query
```sql
SELECT DISTINCTROW [>Invoices and Payments].JobName AS Expr1, [>Invoices and Payments].InvoiceDate AS Expr2, [>Invoices and Payments].PaymentDate AS Expr3, [>Invoices and Payments].InvoiveAmount AS Expr4, [>Invoices and Payments].InvoiceNumber AS Expr5, [>Invoices and Payments].Payment AS Expr6

FROM [>Invoices and Payments]

WHERE ((([>Invoices and Payments].InvoiceDate)>=Forms!InvoicesAndPayments.Beginning And ([>Invoices and Payments].InvoiceDate)<=Forms!InvoicesAndPayments.Ending))

ORDER BY...
```
### >Job All Names Query
```sql
SELECT DISTINCTROW [>Jobs].ID, [>Jobs].Key, [>Jobs].Customer, [>Jobs].Estimate, [>Resources].ID, [>Jobs].Closed

FROM [>Jobs] LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key

ORDER BY [>Jobs].Closed DESC , [>Jobs].Estimate DESC , [>Jobs].ID

WITH OWNERACCESS OPTION;
```
### >Job Category Cost Query
```sql
SELECT DISTINCTROW [>Products].Category, Sum([>Product List].TotalCost) AS SumOfTotalCost, Sum([>Product List].PremiumCost) AS SumOfPremiumCost

FROM ([>Product List] INNER JOIN [>Products] ON [>Product List].Product=[>Products].Key) LEFT JOIN [>Product Lists] ON [>Product List].ProductListKey=[>Product Lists].Key

WHERE ((([>Product Lists].Job)=LocalVariable("FormJobs_JobName")))

GROUP BY [>Products].Category, [>Product List].HideItemInList

HAVING ((([>Product List].HideItemInList)=False))

O...
```
### >Job Cost Query
```sql
SELECT DISTINCTROW Count([>Product List].Item) AS CountOfItem, Sum([>Product List].TotalCost) AS SumOfTotalCost, Sum([>Product List].PremiumCost) AS SumOfPremiumCost

FROM [>Product List] LEFT JOIN [>Product Lists] ON [>Product List].ProductListKey=[>Product Lists].Key

WHERE ((([>Product Lists].Job)=LocalVariable("FormJobs_JobName")))

GROUP BY [>Product List].HideItemInList

HAVING ((([>Product List].HideItemInList)=False))

WITH OWNERACCESS OPTION;
```
### >Job Costs Item Query
```sql
SELECT DISTINCTROW [>Product Lists].Job, [>Product Lists].ProductList, [>Products].ID, [>Product List].Item, [>Product List].TotalCost, [>Product List].PremiumCost

FROM ([>Product List] LEFT JOIN [>Products] ON [>Product List].Product=[>Products].Key) LEFT JOIN [>Product Lists] ON [>Product List].ProductListKey=[>Product Lists].Key

WHERE ((([>Product Lists].Job)=LocalVariable("FormJobs_JobName")) AND (([>Product List].HideItemInList)=False))

ORDER BY [>Product Lists].ProductList, [>Product Li...
```
### >Job Costs Query
```sql
SELECT DISTINCTROW [>Product Lists].Job, [>Product Lists].ProductList, [>Products].Category, Sum([>Product List].TotalCost) AS SumOfTotalCost, Sum([>Product List].PremiumCost) AS SumOfPremiumCost

FROM ([>Product List] LEFT JOIN [>Products] ON [>Product List].Product=[>Products].Key) LEFT JOIN [>Product Lists] ON [>Product List].ProductListKey=[>Product Lists].Key

GROUP BY [>Product Lists].Job, [>Product Lists].ProductList, [>Products].Category, [>Product List].HideItemInList

HAVING ((([>Produ...
```
### >Job Costs Summary Query
```sql
SELECT DISTINCTROW [>Product Lists].Job, [>Products].Category, Sum([>Product List].TotalCost) AS SumOfTotalCost, Sum([>Product List].PremiumCost) AS SumOfPremiumCost

FROM ([>Product List] LEFT JOIN [>Products] ON [>Product List].Product=[>Products].Key) LEFT JOIN [>Product Lists] ON [>Product List].ProductListKey=[>Product Lists].Key

GROUP BY [>Product Lists].Job, [>Products].Category

HAVING ((([>Product Lists].Job)=NNEZ(LocalVariable("FormJobs_JobName"))) AND (([>Products].Category) Is Not N...
```
### >Job Hours Cost Query
```sql
SELECT DISTINCTROW [>Jobs].Key, [>Jobs].ID, Sum([MIS Hours].Cost) AS SumOfCost, Sum([MIS Hours].Hours) AS SumOfHours

FROM [>Jobs] LEFT JOIN [MIS Hours] ON [>Jobs].Key=[MIS Hours].[Job ID]

GROUP BY [>Jobs].Key, [>Jobs].ID

WITH OWNERACCESS OPTION;
```
### >Job Hours Design Cost Query
```sql
SELECT DISTINCTROW [>Jobs].Key, [>Jobs].ID, Sum([MIS Hours].Cost) AS SumOfCost, Sum([MIS Hours].Hours) AS SumOfHours, [MIS Hours].Activity

FROM [>Jobs] LEFT JOIN [MIS Hours] ON [>Jobs].Key=[MIS Hours].[Job ID]

WHERE (((InStr([Activity],"DN") Or InStr([Activity],"DR") Or InStr([Activity],"PA"))<>0))

GROUP BY [>Jobs].Key, [>Jobs].ID, [MIS Hours].Activity

WITH OWNERACCESS OPTION;
```
### >Job Hours Project Cost Query
```sql
SELECT DISTINCTROW [>Jobs].Key, [>Jobs].ID, Sum([MIS Hours].Cost) AS SumOfCost, Sum([MIS Hours].Hours) AS SumOfHours

FROM [>Jobs] LEFT JOIN [MIS Hours] ON [>Jobs].Key=[MIS Hours].[Job ID]

WHERE (((InStr([Charge],"Project"))<>0))

GROUP BY [>Jobs].Key, [>Jobs].ID

WITH OWNERACCESS OPTION;
```
### >Job List Count Query
```sql
SELECT DISTINCTROW Count([>Jobs List Summary Query].ProductList) AS CountOfProductList

FROM [>Jobs List Summary Query]

WITH OWNERACCESS OPTION;
```
### >Job Names Query
```sql
SELECT DISTINCTROW [>Jobs].ID, [>Jobs].Key, [>Jobs].Customer

FROM [>Jobs]

WHERE ((([>Jobs].Customer)=Forms!Resources.ResourceList))

ORDER BY [>Jobs].ID

WITH OWNERACCESS OPTION;
```
### >Job Product List Query
```sql
SELECT DISTINCTROW [>Product List].*, [>Resources].ID, [>Resources].Field1, [>Resources].Field3, [>Resources].Field2, [>Jobs].ShipTo, [>Jobs].ID, [>Options].OptionRequirement, [>Options].OptionName AS Expr1

FROM ([>Product List] INNER JOIN ([>Jobs] LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key) ON [>Product List].Job=[>Jobs].Key) LEFT JOIN [>Options] ON [>Product List].Key=[>Options].ProductListKey

WHERE ((([>Product List].Job)=Forms!Jobs.JobName) And (([>Product List].HideItemIn...
```
### >Job Production Phase Query
```sql
SELECT DISTINCTROW [>Settings].Phase, [>Settings].PhaseSort

FROM [>Settings]

GROUP BY [>Settings].Phase, [>Settings].PhaseSort

HAVING ((([>Settings].Phase) Is Not Null) AND (([>Settings].PhaseSort) Is Not Null))

ORDER BY [>Settings].PhaseSort

WITH OWNERACCESS OPTION;
```
### >Job Query
```sql
SELECT DISTINCTROW [>Jobs].*

FROM [>Jobs]

WHERE ((([>Jobs].Key)=NNEZ(LocalVariable("FormJobs_JobName"))))

WITH OWNERACCESS OPTION;
```
### >Job Receipts Query
```sql
SELECT DISTINCTROW [>Jobs].Key, [>Jobs].ID, Sum([Receipts Journal].Amount) AS SumOfAmount

FROM [>Jobs] LEFT JOIN [Receipts Journal] ON [>Jobs].Key=[Receipts Journal].Job

GROUP BY [>Jobs].Key, [>Jobs].ID

WITH OWNERACCESS OPTION;
```
### >Job Status Query
```sql
SELECT [>Jobs].Info2, Count([>Jobs].ID) AS CountOfID, First([>Jobs].ID) AS FirstOfID

FROM [>Jobs]

GROUP BY [>Jobs].Info2

HAVING ((([>Jobs].Info2) Is Not Null))

ORDER BY [>Jobs].Info2;
```
### >Job SubForm Query
```sql
SELECT DISTINCTROW [>Jobs].*, [>Resources].Field1, [>Resources].Field3, [>Resources].Field2

FROM [>Jobs] LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key

WHERE ((([>Jobs].Key)=Forms!Resources.JobName))

WITH OWNERACCESS OPTION;
```
### >JobCustomerQuery
```sql
SELECT DISTINCTROW [>Resources].ID, [>Resources].Category, [>Resources].Key, [>Resources].Field1, [>Resources].Field2, [>Resources].Field3, [>Resources].Field4, [>Resources].TheName, [>Resources].Address, [>Resources].State, [>Resources].Zip, [>Resources].AreaCode, [>Resources].Comment, [>Resources].Customer AS Expr1

FROM [>Resources]

ORDER BY [>Resources].Category, [>Resources].ID;
```
### >JobFormQuery
```sql
SELECT DISTINCTROW [>Jobs].*, [>Resources].ID

FROM [>Jobs] LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key

WHERE ((([>Jobs].Key)=Forms!Job.JobName))

ORDER BY [>Jobs].ID;
```
### >JobNameQuery
```sql
SELECT DISTINCTROW [>Jobs].ID, [>Jobs].Key, [>Jobs].Customer, [>Jobs].Estimate, [>Resources].ID, [>Jobs].Closed

FROM [>Jobs] LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key

ORDER BY [>Jobs].Closed DESC , [>Jobs].Estimate DESC , [>Jobs].ID;
```
### >JobSubFormQuery
```sql
SELECT DISTINCTROW [>Jobs].*, [>Resources].ID, [>Jobs].ID AS JobName

FROM [>Jobs] LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key

WHERE ((([>Jobs].Key)=Forms!Sales.JobName))

ORDER BY [>Jobs].ID;
```
### >Jobs Fix Query
```sql
SELECT DISTINCTROW [>Jobs].Closed, [>Jobs].Estimate, [>Jobs].ID, [>Resources].ID

FROM [>Jobs] LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key

ORDER BY [>Jobs].Closed DESC , [>Jobs].Estimate DESC , [>Jobs].ID;
```
### >Jobs Form Query
```sql
SELECT DISTINCTROW [>Jobs].*, [>Resources].ID

FROM [>Jobs] LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key

WHERE ((([>Jobs].Key)=Forms!Job.JobName))

ORDER BY [>Jobs].ID;
```
### >Jobs ID
```sql
SELECT DISTINCTROW [>Jobs].ID, [>Jobs].Key

FROM [>Jobs]

WHERE ((([>Jobs].Estimate)=False))

ORDER BY [>Jobs].ID;
```
### >Jobs List Summary Query
```sql
SELECT DISTINCTROW [>Product Lists].ProductList, Count([>Product List].Item) AS CountOfItem

FROM [>Product List] LEFT JOIN [>Product Lists] ON [>Product List].ProductListKey=[>Product Lists].Key

GROUP BY [>Product Lists].ProductList, [>Product Lists].Job, [>Product List].HideItemInList

HAVING ((([>Product Lists].Job)=LocalVariable("FormJobs_JobName")) AND (([>Product List].HideItemInList)=False))

ORDER BY [>Product Lists].ProductList

WITH OWNERACCESS OPTION;
```
### >Jobs PL Query
```sql
SELECT DISTINCTROW [>Product List].*

FROM [>Product List] LEFT JOIN [>Product Lists] ON [>Product List].ProductListKey=[>Product Lists].Key

WHERE ((([>Product Lists].Job)=forms!Jobs.JobName))

WITH OWNERACCESS OPTION;
```
### >Jobs Product List Query
```sql
SELECT DISTINCTROW [>Product List].*

FROM [>Product List] LEFT JOIN [>Product Lists] ON [>Product List].ProductListKey=[>Product Lists].Key

WHERE ((([>Product Lists].Job)=Forms!Jobs.JobName))

ORDER BY [>Product Lists].ProductList, [>Product List].Item

WITH OWNERACCESS OPTION;
```
### >Jobs Query
```sql
SELECT DISTINCTROW [>Jobs].ID, [>Jobs].Key, [>Jobs].Customer

FROM [>Jobs]

GROUP BY [>Jobs].ID, [>Jobs].Key, [>Jobs].Customer

ORDER BY [>Jobs].ID

WITH OWNERACCESS OPTION;
```
### >Jobs Report Query
```sql
SELECT DISTINCTROW [>Jobs].*, [>Resources].*

FROM [>Jobs] LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key

WHERE ((([>Jobs].Estimate)=No) AND (([>Jobs].Closed)=No))

ORDER BY [>Jobs].Estimate DESC , [>Jobs].ID

WITH OWNERACCESS OPTION;
```
### >Jobs Type1
```sql
SELECT DISTINCTROW [>Jobs].JobType1

FROM [>Jobs]

GROUP BY [>Jobs].JobType1

ORDER BY [>Jobs].JobType1;
```
### >JobsFormQuery
```sql
SELECT DISTINCTROW [>Jobs].*, [>Resources].ID

FROM [>Jobs] LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key

WHERE ((([>Jobs].Key)=Forms!Jobs.JobName))

ORDER BY [>Jobs].ID;
```
### >Length Query
```sql
SELECT DISTINCTROW [>Parts Data].[Length Code] AS Expr1, [>Parts Data].Length AS Expr2

FROM [>Parts Data]

WHERE ((([>Parts Data].[Length Code])>=0))

ORDER BY [>Parts Data].[Length Code]

WITH OWNERACCESS OPTION;
```
### >Local Settings Last Resource Query
```sql
SELECT DISTINCTROW [>Local Settings].LocalSettingText6, [>Local Settings].LocalSettingText7

FROM [>Local Settings]

WHERE (((InStr([LocalSettingText5],"Form_Resources_ResourceList1"))<>"0")) OR (((InStr([LocalSettingText5],"Form_Resources_ResourceList2"))<>"0")) OR (((InStr([LocalSettingText5],"Form_Resources_ResourceList3"))<>"0")) OR (((InStr([LocalSettingText5],"Form_Resources_ResourceList4"))<>"0")) OR (((InStr([LocalSettingText5],"Form_Resources_ResourceList5"))<>"0"))

ORDER BY [>Local Se...
```
### >Logo Query
```sql
SELECT DISTINCTROW [>Settings].Key, [>Settings].New

FROM [>Settings]

WHERE ((([>Settings].Key)=1));
```
### >MIS ADP Hours Code Query
```sql
SELECT DISTINCTROW [MIS Hours].ADPHoursCode

FROM [MIS Hours]

GROUP BY [MIS Hours].ADPHoursCode

HAVING ((([MIS Hours].ADPHoursCode) Is Not Null))

ORDER BY [MIS Hours].ADPHoursCode;
```
### >MIS Activity Billable Query
```sql
SELECT DISTINCTROW [>Settings].JobActivity, [>Settings].JobActivityCharge

FROM [>Settings]

WHERE ((([>Settings].JobActivity) Is Not Null) AND ((InStr([Phase],"DesignJob"))<>0))

ORDER BY [>Settings].JobActivity;
```
### >MIS Activity Query
```sql
SELECT DISTINCTROW [>Settings].JobActivity, [>Settings].JobActivityCharge, [>Settings].Phase

FROM [>Settings]

WHERE ((([>Settings].JobActivity) Is Not Null) AND (([>Settings].Phase) Is Null))

ORDER BY [>Settings].JobActivity;
```
### >MIS General Query
```sql
SELECT DISTINCTROW [>Settings].NonRevenueActivity

FROM [>Settings]

WHERE ((([>Settings].NonRevenueActivity) Is Not Null))

ORDER BY [>Settings].NonRevenueActivity;
```
### >Main Menu Query
```sql
SELECT DISTINCTROW [>Settings].Logo, [>Settings].ReportHeading

FROM [>Settings]

WHERE ((([>Settings].Key)=1))

ORDER BY [>Settings].Key;
```
### >Maintenance Administrator Query
```sql
SELECT DISTINCTROW [>Settings].MaintenanceAdministrator

FROM [>Settings]

WHERE ((([>Settings].MaintenanceAdministrator)<>"" Or ([>Settings].MaintenanceAdministrator) Is Not Null))

ORDER BY [>Settings].MaintenanceAdministrator;
```
### >Maintenance Data Query
```sql
SELECT DISTINCTROW [>Settings].TableIndex

FROM [>Settings]

WHERE ((([>Settings].TableIndex)<>"" Or ([>Settings].TableIndex) Is Not Null))

ORDER BY [>Settings].TableIndex

WITH OWNERACCESS OPTION;
```
### >Material Categories Query
```sql
SELECT DISTINCTROW [>Material].Category

FROM [>Material]

GROUP BY [>Material].Category

ORDER BY [>Material].Category

WITH OWNERACCESS OPTION;
```
### >Material Category Query
```sql
SELECT DISTINCTROW [>Material].Category, [>Material].ID, [>Material].Description, [>Material].Factor, [>Material].CostAmount, [>Material].CostUnit

FROM [>Material]

WHERE ((([>Material].Category)<>"All"))

ORDER BY [>Material].Category, [>Material].ID

WITH OWNERACCESS OPTION;
```
### >Material Cost Revision Query
```sql
SELECT DISTINCTROW [>Material].Category, [>Material].ID, [>Material].Description, [>Material].CostAmount, [>Material].StandardMaterial, IIf(IsNull([CostAmountDate]),#1/1/2000#,[CostAmountDate]) AS CostDate

FROM [>Material]

WHERE ((([>Material].Category)=forms!Material!CategorySort) And ((IIf(Forms!Material!StandardMaterials And [StandardMaterial],True,IIf(Not Forms!Material!StandardMaterials And Not [StandardMaterial],True,False)))=True))

ORDER BY [>Material].Category, [>Material].ID

WITH OW...
```
### >Material Query
```sql
SELECT DISTINCTROW [>Material].*

FROM [>Material]

WHERE ((([>Material].Category)=Forms!Material.CategorySort) And (([>Material].StandardMaterial)=No))

ORDER BY [>Material].Category, [>Material].Description

WITH OWNERACCESS OPTION;
```
### >Material Standard Query
```sql
SELECT DISTINCTROW [>Material].*

FROM [>Material]

WHERE ((([>Material].Category)=Forms!Material.CategorySort) And (([>Material].StandardMaterial)=Yes))

ORDER BY [>Material].Category, [>Material].ID

WITH OWNERACCESS OPTION;
```
### >Materials Query
```sql
SELECT DISTINCTROW [>Material].Description, [>Material].Key, [>Material].Category, [>Material].ID

FROM [>Material]

WHERE ((([>Material].StandardMaterial)=No))

ORDER BY [>Material].Category, [>Material].Description, [>Material].ID

WITH OWNERACCESS OPTION;
```
### >Materials Standard Query
```sql
SELECT DISTINCTROW [>Material].Category, [>Material].ID, [>Material].Description, [>Material].Key, [>Material].Category, [>Material].Description, [>Material].CostAmount, [>Material].CostUnit

FROM [>Material]

WHERE ((([>Material].StandardMaterial)=Yes))

ORDER BY [>Material].Category, [>Material].ID

WITH OWNERACCESS OPTION;
```
### >Menu Index Query
```sql
SELECT DISTINCTROW [>Settings].MenuCategory, [>Settings].MenuText

FROM [>Settings]

GROUP BY [>Settings].MenuCategory, [>Settings].MenuText

HAVING ((([>Settings].MenuCategory) Is Not Null))

ORDER BY [>Settings].MenuCategory, [>Settings].MenuText

WITH OWNERACCESS OPTION;
```
### >Option Part Query
```sql
SELECT DISTINCTROW [>Option Parts].*

FROM [>Option Parts]

WHERE ((([>Option Parts].Category)=Forms!OptionParts.CategorySort))

ORDER BY [>Option Parts].SubAssembly, [>Option Parts].Part

WITH OWNERACCESS OPTION;
```
### >Option Query
```sql
SELECT DISTINCTROW [>Products].Description, [>Products].Category, [>Products].ID, [>Products].Key, [>Products].Requirement

FROM [>Products]

WHERE ((([>Products].ProductType)="Option"))

ORDER BY [>Products].Description

WITH OWNERACCESS OPTION;
```
### >Options Category Sort Query
```sql
SELECT DISTINCTROW [>Options].ID AS Expr1, [>Options].Description AS Expr2, [>Options].Category AS Expr3

FROM [>Options]

ORDER BY [>Options].Category, [>Options].Description

WITH OWNERACCESS OPTION;
```
### >Options Query
```sql
SELECT DISTINCTROW [>Products].ID, [>Products].Category, [>Products].Description, [>Products].Key, [>Products].Requirement

FROM [>Products]

WHERE ((([>Products].ProductType)="Option"))

ORDER BY [>Products].Category, [>Products].ID

WITH OWNERACCESS OPTION;
```
### >Part List By Component Query
```sql
SELECT DISTINCTROW [>Part List].*, Activity.Activity, Components.Component, IIf(Forms!PartsList!SelectComponent And nnez([Processcomponent])<>Forms!PartsList!ComponentSort,False,True) AS ComponentSelect

FROM ([>Part List] LEFT JOIN Activity ON [>Part List].ProcessActivity=Activity.Key) LEFT JOIN Components ON [>Part List].ProcessComponent=Components.key

WHERE ((([>Part List].ProductList)=Forms!ProductListMaster!ProductListControl!ProductListName) And (([>Part List].DisplayPart)=True Or ([>Part...
```
### >Part List By Component X Sort Query
```sql
SELECT DISTINCTROW [>Part List].*, Components.Component, Activity.Activity, IIf(Forms!PartsList!SelectComponent And nnez([Processcomponent])<>Forms!PartsList!ComponentSort,False,True) AS ComponentSelect

FROM ([>Part List] LEFT JOIN Activity ON [>Part List].ProcessActivity=Activity.Key) LEFT JOIN Components ON [>Part List].ProcessComponent=Components.key

WHERE ((([>Part List].ProductList)=Forms!ProductListMaster!ProductListControl!ProductListName) And (([>Part List].DisplayPart)=True Or ([>Part...
```
### >Part List By Item Process Query
```sql
SELECT DISTINCTROW [>Part List].Category, [>Part List].Processes, [>Part List].DefaultMaterial, [>Part List].CostUnit, [>Part List].PartProcessAlternate, [>Part List].ProcessCost, IIf(Localvariable("Scratchpad")<>"",[Category],IIf([Category]<>"Assembly" And [category]<>"Finish","Milling + Specials",[Category])) AS TheCategory

FROM [>Part List]

WHERE ((([>Part List].Item)=Forms!ProductListMaster!ProductListControl!Key) And (([>Part List].ProductList)=Forms!ProductListMaster!ProductListControl!P...
```
### >Part List By Item Query
```sql
SELECT DISTINCTROW [>Part List Whole Query].*, Activity.Activity, Components.Component, IIf(Forms!PartsList!SelectComponent And nnez([Processcomponent])<>Forms!PartsList!ComponentSort,False,True) AS ComponentSelect

FROM ([>Part List Whole Query] LEFT JOIN Activity ON [>Part List Whole Query].ProcessActivity=Activity.Key) LEFT JOIN Components ON [>Part List Whole Query].ProcessComponent=Components.key

WHERE ((([>Part List Whole Query].ProductList)=Forms!ProductListMaster!ProductListControl!Prod...
```
### >Part List By Item X Sort Query
```sql
SELECT DISTINCTROW [>Part List Whole Query].*, Components.Component, Activity.Activity, IIf(Forms!PartsList!SelectComponent And nnez([Processcomponent])<>Forms!PartsList!ComponentSort,False,True) AS ComponentSelect

FROM ([>Part List Whole Query] LEFT JOIN Activity ON [>Part List Whole Query].ProcessActivity=Activity.Key) LEFT JOIN Components ON [>Part List Whole Query].ProcessComponent=Components.key

WHERE (((IIf(Forms!PartsList!SelectComponent And nnez([Processcomponent])<>Forms!PartsList!Com...
```
### >Part List By Material Query
```sql
SELECT DISTINCTROW [>Part List].*, Activity.Activity, Components.Component, IIf(Forms!PartsList!SelectComponent And nnez([Processcomponent])<>Forms!PartsList!ComponentSort,False,True) AS ComponentSelect

FROM ([>Part List] LEFT JOIN Activity ON [>Part List].ProcessActivity=Activity.Key) LEFT JOIN Components ON [>Part List].ProcessComponent=Components.key

WHERE ((([>Part List].ProductList)=Forms!ProductListMaster!ProductListControl!ProductListName) And (([>Part List].DisplayPart)=True Or ([>Part...
```
### >Part List By Material Usage Query
```sql
SELECT DISTINCTROW [>Part List].*, Activity.Activity, Components.Component, IIf(Forms!PartsList!SelectComponent And nnez([Processcomponent])<>Forms!PartsList!ComponentSort,False,True) AS ComponentSelect

FROM ([>Part List] LEFT JOIN Activity ON [>Part List].ProcessActivity = Activity.Key) LEFT JOIN Components ON [>Part List].ProcessComponent = Components.key

WHERE ((([>Part List].ProductList)=[Forms]![ProductListMaster]![ProductListControl]![ProductListName]) AND (([>Part List].DisplayPart)=Tru...
```
### >Part List By Material X Sort Query
```sql
SELECT DISTINCTROW [>Part List].*, Activity.Activity, Components.Component, IIf(Forms!PartsList!SelectComponent And nnez([Processcomponent])<>Forms!PartsList!ComponentSort,False,True) AS ComponentSelect

FROM ([>Part List] LEFT JOIN Activity ON [>Part List].ProcessActivity=Activity.Key) LEFT JOIN Components ON [>Part List].ProcessComponent=Components.key

WHERE ((([>Part List].ProductList)=Forms!ProductListMaster!ProductListControl!ProductListName) And (([>Part List].DisplayPart)=True Or ([>Part...
```
### >Part List By Process Query
```sql
SELECT DISTINCTROW [>Part List].DefaultMaterial, [>Part List].Category, [>Part List].Processes, [>Part List].ProcessCostAlternate, IIf(Localvariable("Scratchpad")<>"",[Category],IIf([Category]<>"Assembly" And [category]<>"Finish","Milling + Specials",[Category])) AS TheCategory, [>Part List].ProcessCost

FROM [>Part List]

WHERE ((([>Part List].ProductList)=Forms!ProductListMaster!ProductListControl!ProductListName) And (([>Part List].ProcessList)=True) And (([>Part List].DisplayPart)=True))

OR...
```
### >Part List By Process Summary Query
```sql
SELECT DISTINCTROW [>Part List].Item, [>Part List].DefaultMaterial, [>Part List].Category, [>Part List].Processes, [>Part List].PartProcessAlternate, [>Part List].ProcessCostAlternate, [>Part List].ProcessCost, IIf(Localvariable("Scratchpad")<>"",[SubAssembly],IIf([Category]<>"Assembly" And [category]<>"Finish","Milling + Specials",[Category])) AS TheCategory

FROM [>Part List]

WHERE ((([>Part List].ProcessCost)<>0) And (([>Part List].ProductList)=Forms!ProductListMaster!ProductListControl!Prod...
```
### >Part List Info Query
```sql
SELECT DISTINCTROW [>Resources].Field1, [>Resources].Field3, [>Resources].Field2, [>Jobs].ShipTo, [>Jobs].ID, [>Product List].ProductList, [>Product List].Key

FROM ([>Product List] INNER JOIN [>Jobs] ON [>Product List].Job=[>Jobs].Key) LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key

WHERE ((([>Product List].ProductList)=Forms!ProductListMaster!ProductListControl!ProductListName))

ORDER BY [>Product List].Key

WITH OWNERACCESS OPTION;
```
### >Part List Material Categories Query
```sql
SELECT DISTINCTROW [>Part List].MaterialCategory, [>Part List].PartProcessAlternate

FROM [>Part List]

GROUP BY [>Part List].MaterialCategory, [>Part List].PartProcessAlternate, [>Part List].ProductList

HAVING ((([>Part List].ProductList)=Forms!ProductListMaster!ProductListControl!ProductListName) And ((IIf(InStr(forms!PartsList!PartAlternateProcess,"Alternate")<>0 And nnez([PartProcessAlternate])<>0,True,IIf(InStr(forms!PartsList!PartAlternateProcess,"Alternate")=0 And NNEZ([PartProcessAltern...
```
### >Part List Report By Item Multiple Material Query
```sql
SELECT DISTINCTROW [>Part List].Item, Sum([>Part List].Pieces) AS SumOfPieces, [>Part List].DefaultMaterial, [>Part List].Z, [>Part List].Y, [>Part List].X, [>Part List].PartProcessAlternate, [>Part List].MaterialCategory, [>Part List].ShowPart, [>Part List].ProcessList

FROM [>Part List]

GROUP BY [>Part List].Item, [>Part List].DefaultMaterial, [>Part List].Z, [>Part List].Y, [>Part List].X, [>Part List].PartProcessAlternate, [>Part List].MaterialCategory, [>Part List].ShowPart, [>Part List].P...
```
### >Part List Report By Item Query
```sql
SELECT DISTINCTROW [>Part List].ItemNumber, [>Product List Whole Query].Key, [>Product List Whole Query].X, [>Product List Whole Query].Y, [>Product List Whole Query].Z, [>Part List].PartProcessAlternate, [>Product List Whole Query].Description, [>Product List Whole Query].Alternate, [>Product List Whole Query].Reference1, [>Product List Whole Query].Reference2, [>Part List].SubAssembly, [>Part List].PartName, [>Part List].DefaultMaterial, [>Part List].Processes, [>Part List].X, [>Part List].Y, ...
```
### >Part List Report By Material Query
```sql
SELECT DISTINCTROW [>Part List].SubAssembly, [>Part List].DefaultMaterial, [>Part List].Z, [>Part List].Y, [>Part List].X, [>Part List].PartProcessAlternate, [>Part List].Processes, [>Part List].PartName, Sum([>Part List].Pieces) AS SumOfPieces, [>Part List].ItemNumber, [>Part List].MaterialCategory, [>Part List].Item, [>Part List].ShowPart, [>Part List].PartPositionName, [>Part List].ProcessList

FROM [>Part List]

GROUP BY [>Part List].SubAssembly, [>Part List].DefaultMaterial, [>Part List].Z,...
```
### >Part List Report By Material Usage Query
```sql
SELECT DISTINCTROW [>Part List].SubAssembly, [>Part List].DefaultMaterial, [>Part List].UsageUnit, Count([>Part List].DefaultMaterial) AS CountOfDefaultMaterial, [>Part List].PartProcessAlternate, Sum([>Part List].Quantity) AS SumOfQuantity, Sum(NNEZ([Quantity])) AS TotalQuantity, Sum([>Part List].MaterialCost) AS SumOfMaterialCost, IIf(InStr(Forms!PartsList!IncludeWaste,"Includ")<>0,Sum(NNEZ([MaterialCost])),Sum(IIf(nnez([materialcost])<>0,[materialcost]/(1+[waste]),0))) AS TotalMaterialCost, I...
```
### >Part List Report By Material Z Usage Query
```sql
SELECT DISTINCTROW [>Part List].SubAssembly, [>Part List].DefaultMaterial, [>Part List].UsageUnit, Sum([>Part List].Pieces) AS SumOfPieces, Count([>Part List].DefaultMaterial) AS CountOfDefaultMaterial, [>Part List].PartProcessAlternate, Sum([>Part List].Quantity) AS SumOfQuantity, Sum(NNEZ([Quantity])) AS TotalQuantity, Sum([>Part List].MaterialCost) AS SumOfMaterialCost, Sum([>Part List].ProcessCost) AS SumOfProcessCost, [>Part List].ProcessList, [>Part List].ShowPart, [>Part List].MaterialCat...
```
### >Part List Report By Multiple Material Query
```sql
SELECT DISTINCTROW Sum([>Part List].Pieces) AS SumOfPieces, [>Part List].DefaultMaterial, [>Part List].Z, [>Part List].Y, [>Part List].X, [>Part List].PartProcessAlternate, [>Part List].MaterialCategory, [>Part List].ShowPart, [>Part List].ProcessList

FROM [>Part List]

GROUP BY [>Part List].DefaultMaterial, [>Part List].Z, [>Part List].Y, [>Part List].X, [>Part List].PartProcessAlternate, [>Part List].MaterialCategory, [>Part List].ShowPart, [>Part List].ProcessList, [>Part List].ProductList, ...
```
### >Part List Rip Report Query
```sql
SELECT DISTINCTROW [>Rip Report].Pieces, [>Rip Report].SubAssembly, [>Rip Report].DefaultMaterial, [>Rip Report].Z, [>Rip Report].X, [>Rip Report].Y, [>Rip Report].PartPositionName, [>Rip Report].PartName

FROM [>Rip Report]

GROUP BY [>Rip Report].Pieces, [>Rip Report].SubAssembly, [>Rip Report].DefaultMaterial, [>Rip Report].Z, [>Rip Report].X, [>Rip Report].Y, [>Rip Report].PartPositionName, [>Rip Report].PartName, [>Rip Report].SubAssembly, [>Rip Report].DefaultMaterial, [>Rip Report].Z, [>R...
```
### >Part List Whole Query
```sql
SELECT [>Part List].*

FROM [>Part List]

WHERE ((([>Part List].ProductList)=Forms!ProductListMaster!ProductListControl!ProductListName));
```
### >Partner Query
```sql
SELECT DISTINCTROW [MIS Personnel].Employee, [MIS Personnel].Key, [MIS Personnel].Text2

FROM [MIS Personnel]

WHERE ((([MIS Personnel].Text2)="Partner"))

ORDER BY [MIS Personnel].Employee;
```
### >Parts List Component Query
```sql
SELECT DISTINCTROW Components.Component, Components.key

FROM Components

ORDER BY Components.Component

WITH OWNERACCESS OPTION;
```
### >Parts List Key Query
```sql
SELECT DISTINCTROW [>Product List Whole Query].[>Product List].Key, [>Product List Whole Query].Item, [>Products].Description, [>Product List Whole Query].X, [>Product List Whole Query].Y, [>Product List Whole Query].Z

FROM [>Product List Whole Query] LEFT JOIN [>Products] ON [>Product List Whole Query].Product=[>Products].Key

ORDER BY [>Product List Whole Query].Item

WITH OWNERACCESS OPTION;
```
### >Parts List SubAssembly Cost Query
```sql
SELECT DISTINCTROW [>Part List].SubAssembly, Sum([>Part List].MaterialCost) AS SumOfMaterialCost, Sum([>Part List].ProcessCost) AS SumOfProcessCost, Sum([MaterialCost]+[ProcessCost]) AS Total, [>Part List].PartProcessAlternate

FROM [>Part List]

GROUP BY [>Part List].SubAssembly, [>Part List].PartProcessAlternate, [>Part List].ProductList

HAVING ((([>Part List].ProductList)=Forms!ProductListMaster!ProductListControl!ProductListName))

WITH OWNERACCESS OPTION;
```
### >Parts List SubAssembly Query
```sql
SELECT DISTINCTROW [>Part List].SubAssembly

FROM [>Part List]

GROUP BY [>Part List].SubAssembly, [>Part List].ProductList

HAVING ((([>Part List].ProductList)=Forms!ProductListMaster!ProductListControl!ProductListName))

WITH OWNERACCESS OPTION;
```
### >Parts Type Query
```sql
SELECT DISTINCTROW [>Settings].PartsTypeCode, [>Settings].PartsType

FROM [>Settings]

WHERE ((([>Settings].PartsType)<>"" And ([>Settings].PartsType) Is Not Null))

ORDER BY [>Settings].PartsTypeCode

WITH OWNERACCESS OPTION;
```
### >Personnel Engineer Query
```sql
SELECT DISTINCTROW [MIS Personnel].Employee, [MIS Personnel].Key, [MIS Personnel].Rate, [MIS Personnel].ADPFile, [MIS Personnel].ADPName, [MIS Personnel].ADPNetAccount, [MIS Personnel].WitholdingAccount, [MIS Personnel].MedicalAccount, [MIS Personnel].EmployerAccount, [MIS Personnel].MiscAccount, [MIS Personnel].RetirementAccount, [MIS Personnel].Closed

FROM [MIS Personnel]

WHERE ((([MIS Personnel].ADPFile)>2) AND (([MIS Personnel].Closed)=False) AND (([MIS Personnel].Text2)="Engineer"))

ORDE...
```
### >Personnel Installer Query
```sql
SELECT DISTINCTROW [MIS Personnel].Employee, [MIS Personnel].Key, [MIS Personnel].Rate, [MIS Personnel].ADPFile, [MIS Personnel].ADPName, [MIS Personnel].ADPNetAccount, [MIS Personnel].WitholdingAccount, [MIS Personnel].MedicalAccount, [MIS Personnel].EmployerAccount, [MIS Personnel].MiscAccount, [MIS Personnel].RetirementAccount, [MIS Personnel].Closed

FROM [MIS Personnel]

WHERE ((([MIS Personnel].ADPFile)>2) AND (([MIS Personnel].ADPNetAccount)=601) AND (([MIS Personnel].Closed)=False))

ORD...
```
### >Personnel PM Query
```sql
SELECT DISTINCTROW [MIS Personnel].Text1, [MIS Personnel].Key

FROM [MIS Personnel]

WHERE ((([MIS Personnel].Text2)="Project Manager" Or ([MIS Personnel].Text2)="Partner"))

ORDER BY [MIS Personnel].Text2 DESC , [MIS Personnel].Text1

WITH OWNERACCESS OPTION;
```
### >Personnel Partner Manager Query
```sql
SELECT DISTINCTROW [MIS Personnel].Employee, [MIS Personnel].Key, [MIS Personnel].Closed

FROM [MIS Personnel]

WHERE ((([MIS Personnel].Closed)=False) AND (([MIS Personnel].Text2)="Partner" Or ([MIS Personnel].Text2)="Project Manager") AND (([MIS Personnel].TerminationDate) Is Null))

ORDER BY [MIS Personnel].Employee

WITH OWNERACCESS OPTION;
```
### >Personnel Partner Query
```sql
SELECT DISTINCTROW [MIS Personnel].Employee, [MIS Personnel].Key, [MIS Personnel].Rate, [MIS Personnel].ADPFile, [MIS Personnel].ADPName, [MIS Personnel].ADPNetAccount, [MIS Personnel].WitholdingAccount, [MIS Personnel].MedicalAccount, [MIS Personnel].EmployerAccount, [MIS Personnel].MiscAccount, [MIS Personnel].RetirementAccount, [MIS Personnel].Closed

FROM [MIS Personnel]

WHERE ((([MIS Personnel].ADPFile)>2) AND (([MIS Personnel].Closed)=False) AND (([MIS Personnel].Text2)="Partner"))

ORDER...
```
### >Personnel Project Manager Query
```sql
SELECT DISTINCTROW [MIS Personnel].Employee, [MIS Personnel].Key, [MIS Personnel].Rate, [MIS Personnel].ADPFile, [MIS Personnel].ADPName, [MIS Personnel].ADPNetAccount, [MIS Personnel].WitholdingAccount, [MIS Personnel].MedicalAccount, [MIS Personnel].EmployerAccount, [MIS Personnel].MiscAccount, [MIS Personnel].RetirementAccount, [MIS Personnel].Closed

FROM [MIS Personnel]

WHERE ((([MIS Personnel].ADPFile)>2) AND (([MIS Personnel].Closed)=False) AND (([MIS Personnel].Text2)="engineer" Or ([MI...
```
### >Personnel Query
```sql
SELECT DISTINCTROW [MIS Personnel].Employee, [MIS Personnel].Key, [MIS Personnel].Rate, [MIS Personnel].ADPFile, [MIS Personnel].ADPName, [MIS Personnel].ADPNetAccount, [MIS Personnel].WitholdingAccount, [MIS Personnel].MedicalAccount, [MIS Personnel].EmployerAccount, [MIS Personnel].MiscAccount, [MIS Personnel].RetirementAccount, [MIS Personnel].Closed

FROM [MIS Personnel]

WHERE ((([MIS Personnel].ADPFile)>2) AND (([MIS Personnel].Closed)=False))

ORDER BY [MIS Personnel].Employee

WITH OWNER...
```
### >Personnel Shop Query
```sql
SELECT DISTINCTROW [MIS Personnel].Employee, [MIS Personnel].Key, [MIS Personnel].Rate, [MIS Personnel].ADPFile, [MIS Personnel].ADPName, [MIS Personnel].ADPNetAccount, [MIS Personnel].WitholdingAccount, [MIS Personnel].MedicalAccount, [MIS Personnel].EmployerAccount, [MIS Personnel].MiscAccount, [MIS Personnel].RetirementAccount, [MIS Personnel].Closed

FROM [MIS Personnel]

WHERE ((([MIS Personnel].ADPFile)>2) AND (([MIS Personnel].ADPNetAccount)=501) AND (([MIS Personnel].Closed)=False))

ORD...
```
### >Process Query
```sql
SELECT DISTINCTROW [>Processes].Key, [>Processes].ID, [>Processes].Category, [>Processes].[Process Abbreviation], [>Processes].Cost, [>Processes].CostUnit

FROM [>Processes]

ORDER BY [>Processes].Category, [>Processes].ID

WITH OWNERACCESS OPTION;
```
### >Procuct List Query
```sql
SELECT DISTINCTROW [>Product List].*, [>Products].Category, [>Product Lists].ProductList, [>Product Lists].Job, [>Products].Description

FROM ([>Product List] LEFT JOIN [>Products] ON [>Product List].Product=[>Products].Key) LEFT JOIN [>Product Lists] ON [>Product List].ProductListKey=[>Product Lists].Key

WHERE ((([>Product List].ProductListKey)=Forms!ProductListMaster!ProductListControl!ProductListName))

ORDER BY [>Product List].Item, [>Product List].Reference1

WITH OWNERACCESS OPTION;
```
### >Product All Detailed Specs Report
```sql
SELECT DISTINCTROW [>Products].Key, [>Products].ProductType, [>Products].Category, [>Products].Description, [>Products].Specification AS Expr1

FROM [>Products]

WHERE ((([>Products].Description) Is Not Null) And (([>Products].Specification) Is Not Null));
```
### >Product All Specs Report
```sql
SELECT DISTINCTROW [>Products].Key, [>Products].ProductType, [>Products].Category, [>Products].Description, [>Products].SpecificationReportText AS Expr1

FROM [>Products]

WHERE ((([>Products].Description) Is Not Null) And (([>Products].SpecificationReportText) Is Not Null));
```
### >Product All Specs Report Material
```sql
SELECT DISTINCTROW [>Material].Key, [>Material].Category, [>Material].Description, [>Material].SpecReportText AS Expr1

FROM [>Material]

WHERE ((([>Material].Description) Is Not Null) And (([>Material].SpecReportText) Is Not Null));
```
### >Product Category Query
```sql
SELECT DISTINCTROW [>Products].Category

FROM [>Products]

WHERE ((([>Products].ProductType)="Product"))

GROUP BY [>Products].Category, [>Products].HideInPLList

HAVING ((([>Products].Category) Is Not Null) AND (([>Products].HideInPLList)=False))

ORDER BY [>Products].Category;
```
### >Product Drawing Query
```sql
SELECT DISTINCTROW [>Products].ID, [>Products].Category, [>Products].ProductDrawing AS Expr1, [>Products].Key

FROM [>Products]

WHERE ((([>Products].ProductDrawing) Is Not Null))

ORDER BY [>Products].Category, [>Products].ID;
```
### >Product List Archive Names Query
```sql
SELECT DISTINCTROW [>Product Lists].ProductList, [>Jobs].ID, [>Product Lists].Key, [>Product Lists].Archive

FROM [>Product Lists] LEFT JOIN [>Jobs] ON [>Product Lists].Job=[>Jobs].Key

WHERE ((([>Product Lists].Archive)=True))

ORDER BY [>Product Lists].ProductList, [>Jobs].ID

WITH OWNERACCESS OPTION;
```
### >Product List Costs Report Query
```sql
SELECT DISTINCTROW [>Product List Whole Query].*, IIf(IsNull([Category]),"Miscellaneous",[Category]) AS TheCategory

FROM [>Product List Whole Query]

WITH OWNERACCESS OPTION;
```
### >Product List Cover Page
```sql
SELECT DISTINCTROW [>Jobs].*, [>Resources].*

FROM [>Jobs] LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key

WHERE ((([>Jobs].Key)=Forms!ProductList.JobName));
```
### >Product List Designs Query
```sql
SELECT DISTINCTROW [>Designs].*

FROM [>Designs]

WHERE ((([>Designs].ProductListKey)=Forms!ProductListMaster!ProductListControl!ProductListName) And (([>Designs].Alternate)=Forms!ProductListMaster!ProductListControl!Alternate))

ORDER BY [>Designs].DesignType

WITH OWNERACCESS OPTION;
```
### >Product List Detailed Specs Report
```sql
SELECT DISTINCTROW [>Products].Key, [>Products].ProductType, [>Products].Category, [>Products].Description, [>Products].Specification AS Expr1

FROM [>Products]

WHERE ((([>Products].Specification) Is Not Null));
```
### >Product List Detailed Specs Report Material
```sql
SELECT DISTINCTROW [>Material].Description, [>Material].SpecReportText AS Expr1, [>Material].Key, [>Material].Category

FROM [>Material]

WHERE ((([>Material].SpecReportText) Is Not Null))

ORDER BY [>Material].Description;
```
### >Product List Drawings Report
```sql
SELECT DISTINCTROW [>Products].Key, [>Products].ProductType, [>Products].Category, [>Products].ID, [>Products].Description, [>Products].ProductDrawing AS Expr1, [>Products].Graphic2 AS Expr2, [>Products].Graphic3 AS Expr3

FROM [>Products]

WHERE ((([>Products].ProductDrawing) Is Not Null));
```
### >Product List Job Names Query
```sql
SELECT DISTINCTROW [>Jobs].ID, [>Jobs].Key, [>Resources].ID

FROM [>Jobs] LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key

WHERE ((([>Jobs].Closed)=False))

ORDER BY [>Jobs].ID

WITH OWNERACCESS OPTION;
```
### >Product List Jobs Query
```sql
SELECT DISTINCTROW [>Jobs].ID, [>Jobs].Key

FROM [>Jobs]

ORDER BY [>Jobs].ID

WITH OWNERACCESS OPTION;
```
### >Product List Materials Query
```sql
SELECT DISTINCTROW [>Materials].*, [>Material].Description

FROM [>Materials] LEFT JOIN [>Material] ON [>Materials].Material=[>Material].Key

WHERE ((([>Materials].ProductListKey)=Forms!ProductListMaster!ProductListControl!ProductListName) And (([>Materials].Alternate)=Forms!ProductListMaster!ProductListControl!Alternate))

ORDER BY [>Material].Description

WITH OWNERACCESS OPTION;
```
### >Product List Names Delete Query
```sql
SELECT DISTINCTROW [>Product Lists].ProductList, [>Jobs].ID, [>Product Lists].Key

FROM [>Product Lists] LEFT JOIN [>Jobs] ON [>Product Lists].Job=[>Jobs].Key

WHERE ((([>Product Lists].Key)<>Forms!ProductListMaster!ProductListControl!ProductListName) And (([>Product Lists].Archive)=False))

ORDER BY [>Product Lists].ProductList, [>Jobs].ID

WITH OWNERACCESS OPTION;
```
### >Product List Names Job Query
```sql
SELECT DISTINCTROW [>Product Lists].ProductList AS [Product List Name], IIf([IncludeinEstimate],[ID] & " (estimate)",[ID]) AS Job, [>Product Lists].Key AS [Record Number], [>Product Lists].Archive

FROM [>Product Lists] LEFT JOIN [>Jobs] ON [>Product Lists].Job=[>Jobs].Key

WHERE ((([>Product Lists].Archive)=False) And (([>Product Lists].Job)=forms!ProductListMaster!ProductListControl!JobName))

ORDER BY [>Product Lists].ProductList, IIf([IncludeinEstimate],[ID] & " (estimate)",[ID])

WITH OWNER...
```
### >Product List Names Query
```sql
SELECT DISTINCTROW [>Product Lists].ProductList AS [Product List Name], IIf([IncludeinEstimate] And [>Product Lists].Job<>0,[ID] & " (estimate)",IIf([IncludeinEstimate],"No job selected",[ID])) AS Job, [>Product Lists].Key AS [Record Number], [>Product Lists].EntryDate, [>Product Lists].Archive

FROM [>Product Lists] LEFT JOIN [>Jobs] ON [>Product Lists].Job=[>Jobs].Key

WHERE ((([>Product Lists].Archive)=False))

ORDER BY [>Product Lists].ProductList, IIf([IncludeinEstimate] And [>Product Lists...
```
### >Product List Names Queryz
```sql
SELECT DISTINCTROW [>Product Lists].ProductList AS [Product List Name], [>Jobs].ID AS Job, [>Product Lists].Key AS [Record Number], [>Product Lists].Archive

FROM [>Product Lists] LEFT JOIN [>Jobs] ON [>Product Lists].Job=[>Jobs].Key

WHERE ((([>Product Lists].Archive)=False))

ORDER BY [>Product Lists].ProductList, [>Jobs].ID

WITH OWNERACCESS OPTION;
```
### >Product List Note All Query
```sql
SELECT DISTINCTROW [>Product List Note ID Match Query].ID, [>Product List Note ID Match Query].Note, [>Product Lists].ProductList, [>Product List].Item, IIf(nnen(Forms!NoteSearch!SearchList)="",True,IIf(Forms!NoteSearch!SearchList=[>Product Lists].ProductList,True,False)) AS Expr2

FROM [>Product List Note ID Match Query] LEFT JOIN ([>Product List] LEFT JOIN [>Product Lists] ON [>Product List].ProductListKey=[>Product Lists].Key) ON [>Product List Note ID Match Query].ProductListKey=[>Product Li...
```
### >Product List Note Categories Query
```sql
SELECT DISTINCTROW [>Note].ID, Count([>Note].ID) AS CountOfID

FROM [>Note] INNER JOIN [>Product List Whole Query] ON [>Note].ProductListKey=[>Product List Whole Query].Key

GROUP BY [>Note].ID

HAVING (((Count([>Note].ID))<>0))

WITH OWNERACCESS OPTION;
```
### >Product List Note Current Query
```sql
SELECT DISTINCTROW [>Note].ID, [>Note].Note, [>Note].ProductListKey, IIf(Forms!NoteSearch!IDMatch="Whole Field" And [ID]=NNEN(Forms!NoteSearch!SearchID),True,False) AS Expr1

FROM [>Product List Note Headings Query] RIGHT JOIN [>Note] ON [>Product List Note Headings Query].MacroToRun=[>Note].ID

WHERE (((IIf(Forms!NoteSearch!ViewID="View Current" And Not IsNull([MacroToRun]),True,IIf(Forms!NoteSearch!ViewID<>"View Current",True,False)))=True) And ((IIf(IsNull(Forms!NoteSearch!SearchID),True,IIf(...
```
### >Product List Note Headings Query
```sql
SELECT DISTINCTROW [>Settings].MacroToRun

FROM [>Settings]

WHERE ((([>Settings].MacroToRun) Is Not Null) AND (([>Settings].MenuText)="Note"))

ORDER BY [>Settings].MacroToRun

WITH OWNERACCESS OPTION;
```
### >Product List Note ID Categories Query
```sql
SELECT DISTINCTROW [>Product List Note All Query].ID, Count([>Product List Note All Query].ID) AS CountOfID

FROM [>Product List Note All Query]

GROUP BY [>Product List Note All Query].ID

WITH OWNERACCESS OPTION;
```
### >Product List Note ID Match Query
```sql
SELECT DISTINCTROW [>Product List Note Note Match Query].ID, [>Product List Note Note Match Query].Note, [>Product List Note Note Match Query].Key, [>Product List Note Note Match Query].ProductListKey, IIf(nnen(Forms!NoteSearch!SearchID)="",True,False) AS IDMatch, IIf(IsNull([ID]),False,IIf(Forms!NoteSearch!IDMatch="Whole Field" And Forms!NoteSearch!SearchID=[ID],True,False))=True AS Expr1, IIf(Forms!NoteSearch!IDMatch="Any Part of Field" And InStr([ID],NNEN(Forms!NoteSearch!SearchID))<>0,True,F...
```
### >Product List Note List Query
```sql
SELECT DISTINCTROW [>Note].ID, [>Note].Note, [>Product List].ProductListKey, [>Note].EntryDate, [>Note].Key, [>Note].EntryDate, [>Product List].Item, [>Product Lists].ProductList

FROM ([>Note] RIGHT JOIN [>Product List] ON [>Note].ProductListKey = [>Product List].Key) LEFT JOIN [>Product Lists] ON [>Product List].ProductListKey = [>Product Lists].Key

WHERE ((([>Note].Note)<>"") And (([>Product List].ProductListKey)=Forms!ProductListMaster!ProductListControl!ProductListName))

ORDER BY [>Note]....
```
### >Product List Note Lists Query
```sql
SELECT DISTINCTROW [>Product List Note All Query].ProductList, Count([>Product List Note All Query].ProductList) AS CountOfProductList

FROM [>Product List Note All Query]

GROUP BY [>Product List Note All Query].ProductList

HAVING ((Not ([>Product List Note All Query].ProductList) Is Null))

WITH OWNERACCESS OPTION;
```
### >Product List Note Note Match Query
```sql
SELECT DISTINCTROW [>Product List Note View Match Query].ID, [>Product List Note View Match Query].Note, [>Product List Note View Match Query].Key, [>Product List Note View Match Query].ProductListKey, IIf(NNEN(Forms!NoteSearch!SearchNote)="",True,IIf(InStr([Note],Forms!NoteSearch!SearchNote)<>0,True,False)) AS NoteMatch

FROM [>Product List Note View Match Query]

WHERE (((IIf(NNEN(Forms!NoteSearch!SearchNote)="",True,IIf(InStr([Note],Forms!NoteSearch!SearchNote)<>0,True,False)))=True))

ORDER ...
```
### >Product List Note Query
```sql
SELECT DISTINCTROW [>Note].*

FROM [>Note]

WHERE ((([>Note].ProductListKey)=Forms!ProductListMaster!ProductListControl!Key))

ORDER BY [>Note].ID

WITH OWNERACCESS OPTION;
```
### >Product List Note Search ID Query
```sql
SELECT DISTINCTROW [>Product List Note View Match Query].ID, Count(IIf(IsNull([ID]),"",[ID])) AS [Count]

FROM [>Product List Note View Match Query]

GROUP BY [>Product List Note View Match Query].ID

ORDER BY [>Product List Note View Match Query].ID

WITH OWNERACCESS OPTION;
```
### >Product List Note View Match Query
```sql
SELECT DISTINCTROW [>Note].ID, [>Note].Key, [>Note].Note, [>Note].ProductListKey, IIf(Forms!NoteSearch!ViewID="View Current" And Not IsNull([MacroToRun]),True,IIf(Forms!NoteSearch!ViewID<>"View Current",True,False)) AS ViewCurrent

FROM [>Product List Note Headings Query] RIGHT JOIN [>Note] ON [>Product List Note Headings Query].MacroToRun=[>Note].ID

WHERE (((IIf(Forms!NoteSearch!ViewID="View Current" And Not IsNull([MacroToRun]),True,IIf(Forms!NoteSearch!ViewID<>"View Current",True,False)))=Tr...
```
### >Product List Option List Query
```sql
SELECT DISTINCTROW [>Product List].Item, [>Products].ID, [>Products].Description, [>Options].OptionRequirement, [>Product List].ProductListKey, [>Product Lists].ProductList

FROM ([>Options] RIGHT JOIN ([>Product List] LEFT JOIN [>Product Lists] ON [>Product List].ProductListKey = [>Product Lists].Key) ON [>Options].ProductListKey = [>Product List].Key) LEFT JOIN [>Products] ON [>Options].Option = [>Products].Key

WHERE ((([>Products].ID)<>"") And (([>Product List].ProductListKey)=Forms!ProductL...
```
### >Product List Options Query
```sql
SELECT DISTINCTROW [>Options].*, [>Products].Category, [>Products].ID

FROM [>Options] INNER JOIN [>Products] ON [>Options].Option=[>Products].Key

WHERE ((([>Options].ProductListKey)=Forms!ProductListMaster!ProductListControl!Key))

ORDER BY [>Products].Category, [>Products].ID

WITH OWNERACCESS OPTION;
```
### >Product List Position Query
```sql
SELECT DISTINCTROW [>Product List Whole Query].Item, [>Products].ID, [>Product List Whole Query].X, [>Product List Whole Query].Y, [>Product List Whole Query].Z, [>Product List Whole Query].Key

FROM [>Product List Whole Query] LEFT JOIN [>Products] ON [>Product List Whole Query].Product=[>Products].Key

ORDER BY [>Product List Whole Query].Item;
```
### >Product List Premium Query
```sql
SELECT DISTINCTROW [>Product List Whole Query].PremiumCost, [>Product List Whole Query].OfficeHours, [>Product List Whole Query].ShopHours, [>Product List Whole Query].FinishHours, [>Product List Whole Query].AssemblyHours, [>Product List Whole Query].InstallHours, [>Product List Whole Query].Inventory, [>Product List Whole Query].SpecialMaterials, [>Product List Whole Query].TotalCost, [>Product List Whole Query].Category

FROM [>Product List Whole Query]

WHERE ((([>Product List Whole Query].P...
```
### >Product List Product Categories Query
```sql
SELECT DISTINCTROW [>Products].Category

FROM [>Product List Whole Query] INNER JOIN [>Products] ON [>Product List Whole Query].Product=[>Products].Key

GROUP BY [>Products].Category

ORDER BY [>Products].Category

WITH OWNERACCESS OPTION;
```
### >Product List Products Query
```sql
SELECT DISTINCTROW [>Products].ID, [>Products].Category, [>Products].Description, [>Products].Key

FROM [>Products]

WHERE ((([>Products].ProductType)="Product"))

ORDER BY [>Products].Category, [>Products].ID

WITH OWNERACCESS OPTION;
```
### >Product List Report Drawing Note Query
```sql
SELECT DISTINCTROW [>Note].*, [>Product List Query].Key AS Expr1, [>Product List Query].ProductList AS Expr2, [>Product List Query].Item AS Expr3, [>Product List Query].Reference1 AS Expr4, [>Product List Query].Reference2 AS Expr5, [>Product List Query].ProductName AS Expr6, [>Product List Query].X AS Expr7, [>Product List Query].Y AS Expr8, [>Product List Query].Z AS Expr9

FROM [>Note], [>Product List Query]

WHERE ((([>Note].ID) Is Not Null) AND (([>Note].DrawingNote)=True))

WITH OWNERACCES...
```
### >Product List Report Note Query
```sql
SELECT DISTINCTROW [>Note].*, [>Product List Whole Query].Key, [>Product List Whole Query].[>Product Lists].ProductList, [>Product List Whole Query].Item, [>Product List Whole Query].Reference1, [>Product List Whole Query].Reference2, [>Product List Whole Query].Sort1, [>Product List Whole Query].Sort2, [>Product List Whole Query].X, [>Product List Whole Query].Y, [>Product List Whole Query].Z, [>Product List Whole Query].Description, [>Note].Note

FROM [>Product List Whole Query] LEFT JOIN [>No...
```
### >Product List Report Premium Query
```sql
SELECT DISTINCTROW [>Product List Whole Query].*, IIf(nnen([Reference1])="","No specific room",[Reference1]) AS TheRoom

FROM [>Product List Whole Query]

WITH OWNERACCESS OPTION;
```
### >Product List Report Query
```sql
SELECT DISTINCTROW [>Product List Whole Query].*, [>Product List Whole Query].HideItemInList

FROM [>Product List Whole Query]

WHERE ((([>Product List Whole Query].HideItemInList)=False))

WITH OWNERACCESS OPTION;
```
### >Product List Report by Room Query
```sql
SELECT DISTINCTROW [>Product List Whole Query].*, IIf(nnen([Reference1])="","No room specified",[Reference1]) AS TheRoom

FROM [>Product List Whole Query]

WHERE (((nnez([Premiumcost])+nnez([totalcost]))<>0))

WITH OWNERACCESS OPTION;
```
### >Product List Specs Report
```sql
SELECT DISTINCTROW [>Products].Key, [>Products].ProductType, [>Products].Category, [>Products].Description, [>Products].SpecificationReportText AS Expr1

FROM [>Products]

WHERE ((([>Products].SpecificationReportText) Is Not Null));
```
### >Product List Specs Report Material
```sql
SELECT DISTINCTROW [>Material].Description, [>Material].SpecReportText AS Expr1, [>Material].Key, [>Material].Category

FROM [>Material]

WHERE ((([>Material].SpecReportText) Is Not Null))

ORDER BY [>Material].Description;
```
### >Product List Whole Query
```sql
SELECT DISTINCTROW [>Product List].*, [>Product List].Key AS PLKey, [>Products].Category, [>Product Lists].ProductList, [>Product Lists].Job, [>Products].Description, [>Product Lists].Text1, [>Product Lists].IncludeInEstimate

FROM ([>Product List] LEFT JOIN [>Products] ON [>Product List].Product = [>Products].Key) LEFT JOIN [>Product Lists] ON [>Product List].ProductListKey = [>Product Lists].Key

WHERE ((([>Product List].ProductListKey)=[Forms]![ProductListMaster]![ProductListControl]![Product...
```
### >Product List Whole Query 1
```sql
SELECT DISTINCTROW [>Product List].*, [>Product List].Key AS PLKey, [>Products].Category, [>Products].Description

FROM [>Product List] LEFT JOIN [>Products] ON [>Product List].Product=[>Products].Key

WHERE ((([>Product List].ProductListKey)=Forms!ProductListMaster!ProductListControl!ProductListName))

ORDER BY [>Product List].Item, [>Product List].Reference1

WITH OWNERACCESS OPTION;
```
### >Product List Whole SQL Query
```sql
SELECT DISTINCTROW [>Product List].*, [>Products].Category, [>Product Lists].ProductList, [>Product Lists].Job, [>Products].Description, [>Product Lists].Text1, IIf(Not Forms!ProductListMaster!ProductListControl!SelectReference1,True,IIf([Reference1]=Forms!ProductListMaster!ProductListControl!Reference1Select,True,False)) AS Expr2, IIf(Not Forms!ProductListMaster!ProductListControl!SelectReference2,True,IIf([Reference2]=Forms!ProductListMaster!ProductListControl!Reference2Select,True,False)) AS ...
```
### >Product Lists Query
```sql
SELECT [>Product Lists].*

FROM [>Product Lists];
```
### >Product Query
```sql
SELECT DISTINCTROW [>Products].*

FROM [>Products]

WHERE ((([>Products].Key)=Forms!Products.CategorySort) And (([>Products].ProductType)=Forms!Products.ProductType))

WITH OWNERACCESS OPTION;
```
### >Product Sales Category Query
```sql
SELECT DISTINCTROW [>Products].Category

FROM [>Products]

WHERE ((([>Products].ProductType)="Product") AND ((Left([Category],1)<>"z")=True) AND (([>Products].Category)<>"Obsolete" And ([>Products].Category)<>"Utility" And ([>Products].Category)<>"Drawing Appliance"))

GROUP BY [>Products].Category, [>Products].HideInPLList

HAVING ((([>Products].Category) Is Not Null) AND (([>Products].HideInPLList)=False))

ORDER BY [>Products].Category;
```
### >ProductListQuery
```sql
SELECT DISTINCTROW [>Product List].Reference1, [>Product List].Reference2, [>Product List].Item, [>Product List].ID AS Expr1, [>Product List].Product, [>Product List].ProductName, [>Product List].W AS Expr2, [>Product List].D AS Expr3, [>Product List].H AS Expr4, [>Product List].Option1 AS Expr5, [>Product List].Option1Requirement AS Expr6, [>Product List].Option2 AS Expr7, [>Product List].Option2Requirement AS Expr8, [>Product List].Option3 AS Expr9, [>Product List].Option3Requirement AS Expr10...
```
### >Products Categories Query
```sql
SELECT DISTINCTROW [>Products].Category, [>Products].ProductType

FROM [>Products]

GROUP BY [>Products].Category, [>Products].ProductType

HAVING ((([>Products].ProductType)=Forms!Products.ProductType))

ORDER BY [>Products].Category

WITH OWNERACCESS OPTION;
```
### >Products Category Query
```sql
SELECT DISTINCTROW [>Products].ID, [>Products].Category, [>Products].Description, [>Products].Key

FROM [>Products]

WHERE ((([>Products].ID)<>"") And (([>Products].ProductType)=Forms!Products.ProductType))

ORDER BY [>Products].Category, [>Products].ID

WITH OWNERACCESS OPTION;
```
### >Products PL Drawing Query
```sql
SELECT DISTINCTROW [>Products].*, [>Product Drawing].ProductDrawing AS Expr1

FROM [>Directory], [>Products], [>Product Drawing]

WHERE ((([>Product Drawing].ProductDrawing) Is Not Null And ([>Product Drawing].ProductDrawing)<>""))

ORDER BY [>Products].ProductType, [>Products].ID

WITH OWNERACCESS OPTION;
```
### >Products Query
```sql
SELECT DISTINCTROW [>Products].*

FROM [>Products]

ORDER BY [>Products].Category, [>Products].ID

WITH OWNERACCESS OPTION;
```
### >Products Report All Drawing Query
```sql
SELECT DISTINCTROW [>Products].ProductDrawing AS Expr1, [>Products].ProductType, [>Products].ID, [>Products].Description, [>Products].Key

FROM [>Products]

WHERE ((([>Products].ProductDrawing) Is Not Null) And (([>Products].HideDrawing)=False))

ORDER BY [>Products].ProductType, [>Products].ID

WITH OWNERACCESS OPTION;
```
### >Products Report Drawing Query
```sql
SELECT DISTINCTROW [>Products].ProductDrawing AS Expr1, [>Products].ProductType, [>Products].ID, [>Products].Key, [>Products].Key, [>Products].Description

FROM [>Products]

WHERE ((([>Products].Key)=Forms!Products.Key) And (([>Products].ProductDrawing) Is Not Null) And (([>Products].HideDrawing)=False))

ORDER BY [>Products].ProductType, [>Products].ID

WITH OWNERACCESS OPTION;
```
### >Products Report PL Designs Drawing Query
```sql
SELECT DISTINCTROW [>Products].ProductDrawing AS Expr1, [>Products].ProductType, [>Products].ID, [>Products].Key

FROM ([>Product List] LEFT JOIN [>Designs] ON [>Product List].ProductListKey=[>Designs].ProductListKey) LEFT JOIN [>Products] ON [>Designs].DesignAlternate=[>Products].Key

WHERE ((([>Products].ProductDrawing) Is Not Null) And (([>Products].HideDrawing)=False) And (([>Product List].ProductListKey)=Forms!ProductList.ProductListName))

ORDER BY [>Products].ProductType, [>Products].ID

...
```
### >Products Report PL Drawing Query
```sql
SELECT DISTINCTROW [>Products].ID, [>Products_1].ID, [>Products].ProductDrawing AS Expr1, [>Products_1].ProductDrawing AS Expr2, [>Products].ProductType, [>Products_1].ProductType

FROM (([>Product List] LEFT JOIN [>Options] ON [>Product List].Key=[>Options].ProductListKey) LEFT JOIN [>Products] ON [>Options].Option=[>Products].Key) LEFT JOIN ([>Designs] LEFT JOIN [>Products] AS [>Products_1] ON [>Designs].DesignAlternate=[>Products_1].Key) ON [>Product List].Key=[>Designs].ProductListKey

WHERE...
```
### >Products Report PL Options Drawing Query
```sql
SELECT DISTINCTROW [>Products].ProductDrawing AS Expr1, [>Products].ProductType, [>Products].ID, [>Products].Key

FROM [>Product List] LEFT JOIN ([>Options] LEFT JOIN [>Products] ON [>Options].Option=[>Products].Key) ON [>Product List].Key=[>Options].ProductListKey

WHERE ((([>Products].ProductDrawing) Is Not Null) And (([>Products].HideDrawing)=False) And (([>Product List].ProductListKey)=Forms!ProductList.ProductListName))

ORDER BY [>Products].ProductType, [>Products].ID

WITH OWNERACCESS OPT...
```
### >Products Report PL Products Drawing Query
```sql
SELECT DISTINCTROW [>Products].ProductDrawing AS Expr1, [>Products].ProductType, [>Products].ID, [>Products].Key

FROM [>Product List] LEFT JOIN [>Products] ON [>Product List].Product=[>Products].Key

WHERE ((([>Products].ProductDrawing) Is Not Null) And (([>Products].HideDrawing)=False) And (([>Product List].ProductListKey)=Forms!ProductList.ProductListName))

ORDER BY [>Products].ProductType, [>Products].ID

WITH OWNERACCESS OPTION;
```
### >Products Type Query
```sql
SELECT DISTINCTROW [>Settings].ProductsType

FROM [>Settings]

GROUP BY [>Settings].ProductsType

HAVING ((([>Settings].ProductsType)<>""))

ORDER BY [>Settings].ProductsType

WITH OWNERACCESS OPTION;
```
### >Project Manager Query
```sql
SELECT DISTINCTROW [MIS Personnel].Employee, [MIS Personnel].Key, [MIS Personnel].Text1

FROM [MIS Personnel]

WHERE ((([MIS Personnel].Text2)="Project Manager" Or ([MIS Personnel].Text2)="Partner"))

ORDER BY [MIS Personnel].Text2 DESC , [MIS Personnel].Employee;
```
### >ProposalSubForm Query
```sql
SELECT DISTINCTROW [>Settings].Key, [>Settings].ContractHeader, [>Settings].ContractFooter

FROM [>Settings]

WHERE ((([>Settings].Key)=20));
```
### >Rate Units Query
```sql
SELECT DISTINCTROW [>Settings].RateUnits, [>Settings].RateAmount, [>Settings].Key

FROM [>Settings]

WHERE ((([>Settings].RateUnits) Is Not Null))

ORDER BY [>Settings].RateUnits;
```
### >Receivables Account Query
```sql
SELECT DISTINCTROW [MIS Accounts].Number, [MIS Accounts].Account

FROM [MIS Accounts]

WHERE (((InStr([Account],"receivable"))<>"0"));
```
### >Receivables Query
```sql
SELECT DISTINCTROW [>Jobs].Key, Date()-[MaxofDue] AS Days, NNEZ([invoices])-NNEZ([payments])+NNEZ([DebitAmount]) AS Owed

FROM ((([>Jobs] LEFT JOIN [*InvoicesQuery2] ON [>Jobs].ID=[*InvoicesQuery2].ID) LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key) LEFT JOIN [*RefundQuery] ON [>Jobs].ID=[*RefundQuery].ID) LEFT JOIN [*PaymentsQuery2] AS [*PaymentsQuery2_1] ON [>Jobs].ID=[*PaymentsQuery2_1].ID

WHERE (((NNEZ([invoices])-NNEZ([payments])+NNEZ([DebitAmount]))>100) AND (([>Jobs]....
```
### >Reference #1 Query
```sql
SELECT DISTINCTROW [>Product List Whole Query].Reference1

FROM [>Product List Whole Query]

GROUP BY [>Product List Whole Query].Reference1

ORDER BY [>Product List Whole Query].Reference1

WITH OWNERACCESS OPTION;
```
### >Reference #2 Query
```sql
SELECT DISTINCTROW [>Product List Whole Query].Reference2

FROM [>Product List Whole Query]

GROUP BY [>Product List Whole Query].Reference2

ORDER BY [>Product List Whole Query].Reference2

WITH OWNERACCESS OPTION;
```
### >Referral Query
```sql
SELECT DISTINCTROW [>Resources].ID, [>Resources].Category, [>Resources].Key, InStr([Category],"Contract") Or InStr([Category],"Customer") Or InStr([Category],"Architect") Or InStr([Category],"Design") AS Expr1

FROM [>Resources]

WHERE (((InStr([Category],"Contract") Or InStr([Category],"Customer") Or InStr([Category],"Architect") Or InStr([Category],"Design"))<>0))

ORDER BY [>Resources].Category, [>Resources].ID;
```
### >Report Heading Query
```sql
SELECT DISTINCTROW [>Settings].Key, [>Settings].New

FROM [>Settings]

WHERE ((([>Settings].Key)=2));
```
### >Resource Area Code Query
```sql
SELECT DISTINCTROW [>Resources].AreaCode

FROM [>Resources]

GROUP BY [>Resources].AreaCode

ORDER BY [>Resources].AreaCode

WITH OWNERACCESS OPTION;
```
### >Resource Categories Query
```sql
SELECT DISTINCTROW [>Resources].Category

FROM [>Resources]

GROUP BY [>Resources].Category

HAVING (((InStr([Category],"Select a"))="0"))

ORDER BY [>Resources].Category

WITH OWNERACCESS OPTION;
```
### >Resource Comment Query
```sql
SELECT DISTINCTROW [>Resources].Comment AS [Marketing Category], Count([>Resources].ID) AS [Found]

FROM [>Resources]

GROUP BY [>Resources].Comment

HAVING ((([>Resources].Comment)<>""))

ORDER BY [>Resources].Comment

WITH OWNERACCESS OPTION;
```
### >Resource Job Names Query
```sql
SELECT DISTINCTROW [>Jobs].ID, [>Jobs].Key

FROM [>Jobs]

WHERE ((([>Jobs].Customer)=Forms!Resources.Key))

ORDER BY [>Jobs].ID

WITH OWNERACCESS OPTION;
```
### >Resource State Query
```sql
SELECT DISTINCTROW [>Resources].State

FROM [>Resources]

GROUP BY [>Resources].State

ORDER BY [>Resources].State

WITH OWNERACCESS OPTION;
```
### >Resource Zip Query
```sql
SELECT DISTINCTROW [>Resources].Zip

FROM [>Resources]

GROUP BY [>Resources].Zip

ORDER BY [>Resources].Zip

WITH OWNERACCESS OPTION;
```
### >Resources All Query
```sql
SELECT DISTINCTROW [>Resources].ID, [>Resources].Category, [>Resources].SageID, [>Resources].Key, [>Resources].CompanyName, [>Resources].Conversation, [>Resources].ConversationUser, [>Resources].ConversationDate, [>Resources].Key, [>Resources].Web, [>Resources].Field1, [>Resources].Field2, [>Resources].Field3, [>Resources].Field4, [>Resources].TheName, [>Resources].Address, [>Resources].State, [>Resources].Zip, [>Resources].AreaCode, [>Resources].Comment, [>Resources].Customer AS Expr1

FROM [>R...
```
### >Resources By Category Query
```sql
SELECT DISTINCTROW [>Resources].ID, [>Resources].Category, [>Resources].Key

FROM [>Resources]

WHERE ((([>Resources].Category)=Forms!Resources.CategorySort))

ORDER BY [>Resources].ID, [>Resources].Category

WITH OWNERACCESS OPTION;
```
### >Resources By Comment Query
```sql
SELECT DISTINCTROW [>Resources].ID AS Resource, [>Resources].Comment AS [Marketing Category], [>Resources].Key

FROM [>Resources]

WHERE ((([>Resources].Comment)=Forms!Resources.CommentSort))

ORDER BY [>Resources].ID, [>Resources].Comment

WITH OWNERACCESS OPTION;
```
### >Resources Filtered Query
```sql
SELECT DISTINCTROW [>Resources All Query].ID, [>Resources All Query].Category, [>Resources All Query].Key, [>Resources All Query].Field1, [>Resources All Query].Field2, [>Resources All Query].Field3, [>Resources All Query].Field4, [>Resources All Query].TheName, [>Resources All Query].Address, [>Resources All Query].State, [>Resources All Query].Zip, [>Resources All Query].AreaCode, [>Resources All Query].Comment

FROM [>Resources All Query]

WHERE ((([>Resources All Query].Category)=Forms!Resou...
```
### >Resources Jobs Query
```sql
SELECT DISTINCTROW [>Resources].ID, [>Resources].Category, [>Resources].Key, [>Resources].Field1, [>Resources].Field2, [>Resources].Field3, [>Resources].Field4, [>Resources].TheName, [>Resources].Address, [>Resources].State, [>Resources].Zip, [>Resources].AreaCode, [>Resources].Comment

FROM [>Resources] INNER JOIN [>Jobs] ON [>Resources].Key=[>Jobs].Customer

ORDER BY [>Resources].Category, [>Resources].ID

WITH OWNERACCESS OPTION;
```
### >Resources Label Query
```sql
SELECT DISTINCTROW [>Errors].Form, [>Errors].Error

FROM [>Errors]

WHERE ((([>Errors].Form) Is Not Null))

ORDER BY [>Errors].Form;
```
### >Resources No Info Query
```sql
SELECT DISTINCTROW [>Resources].ID, [>Resources].Category, [>Resources].Key, [>Resources].Field1, [>Resources].Field2, [>Resources].Field3, [>Resources].Field4, [>Resources].TheName, [>Resources].CompanyName, [>Resources].Address, [>Resources].State, [>Resources].Zip, [>Resources].AreaCode, [>Resources].Comment, [>Resources].Customer AS Expr1

FROM [>Resources]

ORDER BY [>Resources].Category, [>Resources].ID

WITH OWNERACCESS OPTION;
```
### >Resources Notes Query
```sql
SELECT DISTINCTROW [>Resources].ID, [>Resources].Category, [>Resources].Conversation, [>Resources].ConversationUser, [>Resources].ConversationDate, [>Resources].Key, [>Resources].Field1, [>Resources].Field2, [>Resources].Field3, [>Resources].Field4, [>Resources].TheName, [>Resources].CompanyName, [>Resources].Address, [>Resources].State, [>Resources].Zip, [>Resources].AreaCode, [>Resources].Comment, [>Resources].Customer AS Expr1

FROM [>Resources]

WHERE ((Not ([>Resources].Conversation) Is Nul...
```
### >Resources One Query
```sql
SELECT DISTINCTROW [>Resources].*

FROM [>Resources]

WHERE ((([>Resources].Key)=Forms!Resources!ResourceList))

WITH OWNERACCESS OPTION;
```
### >Sale Account Query
```sql
SELECT DISTINCTROW [MIS Accounts].Number, [MIS Accounts].Account

FROM [MIS Accounts]

WHERE ((([MIS Accounts].Account)="Sales"));
```
### >Sale Description Query
```sql
SELECT DISTINCTROW [Sales Journal].Description, Count([>Jobs].ID) AS CountOfID, Last([>Jobs].ID) AS LastOfID, Last([Sales Journal].EntryDate) AS LastOfEntryDate

FROM [Sales Journal] LEFT JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key

WHERE ((([Sales Journal].EntryDate)>Year(Date())-2))

GROUP BY [Sales Journal].Description

HAVING ((([Sales Journal].Description) Is Not Null))

ORDER BY [Sales Journal].Description;
```
### >Sales Agreement Query
```sql
SELECT DISTINCTROW [>Resources].ID, [>Jobs].ID, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount, Max([Sales Journal].TheDate) AS MaxOfTheDate

FROM [>Resources] INNER JOIN ([>Jobs] LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job) ON [>Resources].Key=[>Jobs].Agreement

WHERE ((([>Jobs].Estimate)=False) AND (([Sales Journal].TheDate) Is Not Null))

GROUP BY [>Resources].ID, [>Jobs].ID

HAVING ((([>Resources].ID)<>"") AND ((Sum([Sales Journal].SaleAmount))<>0))

ORDER BY [>Resources...
```
### >Sales Agreement Total Query
```sql
SELECT DISTINCTROW [>Resources].ID, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount, Max([Sales Journal].TheDate) AS MaxOfTheDate

FROM [>Resources] LEFT JOIN ([>Jobs] LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job) ON [>Resources].Key=[>Jobs].Agreement

WHERE ((([>Jobs].Estimate)=False) AND (([>Jobs].ProductionPhase)="completed" Or ([>Jobs].ProductionPhase)="Archive") AND (([Sales Journal].TheDate) Is Not Null))

GROUP BY [>Resources].ID

HAVING ((([>Resources].ID)<>"") AND ((S...
```
### >Sales Amounts
```sql
SELECT [Sales Journal].Job, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount

FROM [Sales Journal] RIGHT JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key

WHERE ((([>Jobs].Estimate)=False))

GROUP BY [Sales Journal].Job

HAVING (((Sum([Sales Journal].SaleAmount))<>0));
```
### >Sales Architect Design Cost Query
```sql
SELECT DISTINCTROW [>Sales Architect Total Query].SumOfSumOfSaleAmount, [>Resources].ID AS ResourceID, [>Sales Architect Total Query].Key, [>Jobs].ID AS JobID, [>Jobs].ManagedBy, [>Jobs].SpecifiedBy, [Job Agreement Sales NIC Stone].SumOfSaleAmount, [>Jobs].ProductionPhase, [Job Agreement Sales NIC Stone].LastOfTheDate, [Job Project Hours].TotalCost, [Job Cabinet Hours].TotalCost

FROM ([>Sales Architect Total Query] LEFT JOIN ((([>Jobs] LEFT JOIN [Job Project Hours] ON [>Jobs].Key=[Job Project H...
```
### >Sales Architect Query
```sql
SELECT DISTINCTROW [>Resources].ID, [>Resources].Key, [>Jobs].ID, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount, Max([Sales Journal].TheDate) AS MaxOfTheDate

FROM [>Resources] LEFT JOIN ([>Jobs] LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job) ON [>Resources].Key=[>Jobs].Architect

WHERE ((([>Jobs].Estimate)=False))

GROUP BY [>Resources].ID, [>Resources].Key, [>Jobs].ID

HAVING ((([>Resources].ID)<>"") AND ((Sum([Sales Journal].SaleAmount))<>0))

ORDER BY [>Resources].ID, [>J...
```
### >Sales Architect Total Query
```sql
SELECT DISTINCTROW [>Resources].Key, [>Resources].ID, Sum([Job Agreement Sales NIC Stone].SumOfSaleAmount) AS SumOfSumOfSaleAmount

FROM ([>Resources] LEFT JOIN [>Jobs] ON [>Resources].Key=[>Jobs].Architect) LEFT JOIN [Job Agreement Sales NIC Stone] ON [>Jobs].Key=[Job Agreement Sales NIC Stone].Key

WHERE ((([>Jobs].Estimate)=False))

GROUP BY [>Resources].Key, [>Resources].ID;
```
### >Sales Completed Jobs Query
```sql
SELECT [>Jobs].Key, Max([Sales Journal].TheDate) AS MaxOfTheDate, [>Sales Total].SumOfSaleAmount

FROM ([>Jobs] LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job) LEFT JOIN [>Sales Total] ON [>Jobs].Key=[>Sales Total].Job

WHERE (((InStr([Sales Journal]!Category,"Install"))<>0))

GROUP BY [>Jobs].Key, [>Sales Total].SumOfSaleAmount

HAVING (((Max([Sales Journal].TheDate))>=#1/1/1996#))

ORDER BY Max([Sales Journal].TheDate);
```
### >Sales Contractor Design Cost Query
```sql
SELECT DISTINCTROW [>Sales Contractor Total Query].SumOfSumOfSaleAmount, [>Sales Contractor Total Query].Key, [>Resources].ID AS ResourceID, [>Jobs].ID AS JobID, [>Jobs].ManagedBy, [>Jobs].SpecifiedBy, [Job Agreement Sales NIC Stone].SumOfSaleAmount, [>Jobs].ProductionPhase, [Job Agreement Sales NIC Stone].LastOfTheDate, [Job Project Hours].TotalCost, [Job Cabinet Hours].TotalCost

FROM ([>Resources] RIGHT JOIN [>Sales Contractor Total Query] ON [>Resources].Key=[>Sales Contractor Total Query].K...
```
### >Sales Contractor Query
```sql
SELECT DISTINCTROW [>Resources].ID, [>Jobs].ID, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount, Max([Sales Journal].TheDate) AS MaxOfTheDate

FROM [>Resources] INNER JOIN ([>Jobs] LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job) ON [>Resources].Key=[>Jobs].Contractor

WHERE ((([>Jobs].Estimate)=False) AND (([Sales Journal].TheDate) Is Not Null))

GROUP BY [>Resources].ID, [>Jobs].ID

HAVING ((([>Resources].ID)<>"") AND ((Sum([Sales Journal].SaleAmount))<>0))

ORDER BY [>Resource...
```
### >Sales Contractor Total Query
```sql
SELECT DISTINCTROW [>Resources].Key, [>Resources].ID, Sum([Job Agreement Sales NIC Stone].SumOfSaleAmount) AS SumOfSumOfSaleAmount

FROM [>Resources] LEFT JOIN ([>Jobs] LEFT JOIN [Job Agreement Sales NIC Stone] ON [>Jobs].Key=[Job Agreement Sales NIC Stone].Key) ON [>Resources].Key=[>Jobs].Contractor

WHERE ((([>Jobs].Estimate)=False))

GROUP BY [>Resources].Key, [>Resources].ID;
```
### >Sales Customer Design Cost Query
```sql
SELECT DISTINCTROW [>Sales Customer Total Query].Key, [>Sales Customer Total Query].SumOfSumOfSaleAmount, [>Resources].ID AS ResourceID, [>Jobs].ID AS JobID, [>Jobs].ManagedBy, [>Jobs].SpecifiedBy, [Job Agreement Sales NIC Stone].SumOfSaleAmount, [>Jobs].ProductionPhase, [Job Agreement Sales NIC Stone].LastOfTheDate, [Job Project Hours].TotalCost, [Job Cabinet Hours].TotalCost

FROM ([>Resources] RIGHT JOIN [>Sales Customer Total Query] ON [>Resources].Key=[>Sales Customer Total Query].Key) LEFT...
```
### >Sales Customer Query
```sql
SELECT DISTINCTROW [>Resources].ID, [>Resources].Key, [>Jobs].ID, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount, Max([Sales Journal].TheDate) AS MaxOfTheDate, First([MIS Personnel].Employee) AS FirstOfEmployee

FROM ([>Resources] INNER JOIN ([>Jobs] LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job) ON [>Resources].Key=[>Jobs].Customer) LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key

WHERE ((([>Jobs].Estimate)=False))

GROUP BY [>Resources].ID, [>Resources].Ke...
```
### >Sales Customer Total Query
```sql
SELECT DISTINCTROW [>Resources].Key, [>Resources].ID, Sum([Job Agreement Sales NIC Stone].SumOfSaleAmount) AS SumOfSumOfSaleAmount

FROM [>Resources] LEFT JOIN ([>Jobs] LEFT JOIN [Job Agreement Sales NIC Stone] ON [>Jobs].Key=[Job Agreement Sales NIC Stone].Key) ON [>Resources].Key=[>Jobs].Customer

WHERE ((([>Jobs].Estimate)=False))

GROUP BY [>Resources].Key, [>Resources].ID

ORDER BY [>Resources].Key;
```
### >Sales Dated Estimates Open Query
```sql
SELECT DISTINCTROW First([MIS Personnel].Employee) AS FirstOfEmployee, [>Jobs].Info2, First([>Jobs].ID) AS FirstOfID1, [>Sales Proposals Open Query].MaxOfDue, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount, [>Jobs].ManagedBy, [>Jobs].SpecifiedBy, [>Jobs].Key, First([>Resources].ID) AS FirstOfID, First([>Jobs].Category) AS FirstOfCategory, [>Resources_1].ID, [>Resources_2].ID, [>Resources_3].ID, [>Resources_4].ID

FROM [>Sales Proposals Open Query] LEFT JOIN ([Sales Journal] LEFT JOIN (((((([...
```
### >Sales Dated Estimates Partner Trend Current Query
```sql
SELECT DISTINCTROW [mis personnel].Text1 & " " & [>Jobs].Info2 AS Info2, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount, [MIS Personnel].Employee

FROM (([>Estimates Open Query] LEFT JOIN ([Sales Journal] LEFT JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key) ON [>Estimates Open Query].Key=[Sales Journal].Job) LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key) LEFT JOIN [MIS Personnel] AS [MIS Personnel_1] ON [>Jobs].SpecifiedBy=[MIS Personnel_1].Key

WHERE (((IIf(Forms!Sales...
```
### >Sales Dated Estimates Partner Trend Query
```sql
SELECT DISTINCTROW [>Jobs].Info2, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount, [MIS Personnel].Employee

FROM [>Estimates Closed Query] LEFT JOIN (([Sales Journal] LEFT JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key) LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key) ON [>Estimates Closed Query].Key=[Sales Journal].Job

GROUP BY [>Jobs].Info2, [MIS Personnel].Employee

HAVING ((([MIS Personnel].Employee)=Forms!Sales!Partner))

ORDER BY Sum([Sales Journal].SaleAmount) DES...
```
### >Sales Dated Estimates Query
```sql
SELECT DISTINCTROW First([MIS Personnel].Employee) AS FirstOfEmployee, [>Jobs].Info2, [>Jobs].ID, [>Jobs].ManagedBy, [>Jobs].SpecifiedBy, Max([Sales Journal].Due) AS MaxOfDue, [MIS Personnel].Text2, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount, First([>Resources].ID) AS FirstOfID, First([>Jobs].Category) AS FirstOfCategory, [>Resources_1].ID, [>Resources_2].ID, [>Resources_3].ID, [>Resources_4].ID, [>Jobs].Closed

FROM [Sales Journal] LEFT JOIN (((((([>Jobs] LEFT JOIN [MIS Personnel] ON [>...
```
### >Sales Dated Estimates Status Query
```sql
SELECT DISTINCTROW First([MIS Personnel].Employee) AS FirstOfEmployee, [>Jobs].Info2, [>Jobs].ID, Max([Sales Journal].Due) AS MaxOfDue, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount, First([>Resources].ID) AS FirstOfID, First([>Jobs].Category) AS FirstOfCategory, [>Resources_1].ID, [>Resources_2].ID, [>Resources_3].ID, [>Resources_4].ID, [>Jobs].Closed

FROM ((((([Sales Journal] LEFT JOIN ([>Jobs] LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key) ON [Sales Journal].Job=[>J...
```
### >Sales Dated Estimates Trend Current Query
```sql
SELECT DISTINCTROW [>Jobs].Info2, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount, [MIS Personnel].Text2

FROM ([>Estimates Open Query] LEFT JOIN ([Sales Journal] LEFT JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key) ON [>Estimates Open Query].Key=[Sales Journal].Job) LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key

GROUP BY [>Jobs].Info2, [MIS Personnel].Text2

HAVING ((([MIS Personnel].Text2)="Partner"))

ORDER BY Sum([Sales Journal].SaleAmount) DESC;
```
### >Sales Dated Estimates Trend Partner Current Query
```sql
SELECT DISTINCTROW [>Jobs].Info2, [Sales Journal].SaleAmount, [MIS Personnel].Text2, [MIS Personnel].Employee

FROM ([>Estimates Open Query] LEFT JOIN ([Sales Journal] LEFT JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key) ON [>Estimates Open Query].Key=[Sales Journal].Job) LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key

WHERE ((([MIS Personnel].Text2)="Partner") And (([MIS Personnel].Employee)=Forms!Sales!Partner))

ORDER BY [Sales Journal].SaleAmount DESC;
```
### >Sales Dated Estimates Trend Query
```sql
SELECT DISTINCTROW [>Jobs].Info2, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount, [MIS Personnel].Text2

FROM ([>Estimates Closed Query] LEFT JOIN ([Sales Journal] LEFT JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key) ON [>Estimates Closed Query].Key=[Sales Journal].Job) LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key

GROUP BY [>Jobs].Info2, [MIS Personnel].Text2

HAVING ((([MIS Personnel].Text2)="Partner"))

ORDER BY Sum([Sales Journal].SaleAmount) DESC;
```
### >Sales Dated Query
```sql
SELECT DISTINCTROW [>Resources].ID, [>Jobs].ID, [Sales Journal].SaleAmount, [Sales Journal].TheDate

FROM [>Resources] INNER JOIN ([>Jobs] LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job) ON [>Resources].Key=[>Jobs].Agreement

WHERE ((([>Resources].ID)<>"") AND (([Sales Journal].SaleAmount)<>0) AND (([Sales Journal].TheDate)>#1/1/1999#) AND (([>Jobs].Estimate)=False))

ORDER BY [>Resources].ID, [>Jobs].ID;
```
### >Sales Delivery Milestone Query
```sql
SELECT DISTINCTROW ProjectSchedule.TaskEnd, ProjectSchedule.Task, ProjectSchedule.PercentComplete, [>Jobs].ID, [MIS Personnel].Employee, ProjectSchedule.Job, [>Jobs].ProductionPhase, [>Sales Total Cabinets].SumOfSaleAmount, ProjectSchedule.EntryDate, [>Jobs].ProductionPhase, [MIS Personnel].Employee, [MIS Personnel_1].Employee, [MIS Personnel_2].Employee, [MIS Personnel].Text1, [MIS Personnel_1].Text1, [MIS Personnel_2].Text1, [>Jobs].ManagedBy, [>Jobs].SpecifiedBy, [>Jobs].EstimatedBy

FROM (((...
```
### >Sales Design Cost Query
```sql
SELECT DISTINCTROW [>Sales Architect Total Query].SumOfSumOfSaleAmount, [>Resources].ID AS ResourceID, [>Sales Architect Total Query].Key, [>Jobs].ID AS JobID, [Job Agreement Sales NIC Stone].SumOfSaleAmount, [>Jobs].ProductionPhase, [Job Agreement Sales NIC Stone].LastOfTheDate, [Job Project Hours].TotalCost, [Job Cabinet Hours].TotalCost

FROM ([>Sales Architect Total Query] LEFT JOIN ((([>Jobs] LEFT JOIN [Job Project Hours] ON [>Jobs].Key=[Job Project Hours].Key) LEFT JOIN [Job Cabinet Hours]...
```
### >Sales Design Costs Query
```sql
SELECT [>Jobs].ID, Max([Sales Journal].TheDate) AS MaxOfTheDate2, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount, [MIS Personnel_1].Employee, Sum([>Job Hours Design Cost Query].SumOfCost) AS SumOfSumOfCost

FROM ((([>Sales Completed Jobs Query] LEFT JOIN [Sales Journal] ON [>Sales Completed Jobs Query].Key=[Sales Journal].Job) LEFT JOIN [>Jobs] ON [>Sales Completed Jobs Query].Key=[>Jobs].Key) LEFT JOIN [MIS Personnel] AS [MIS Personnel_1] ON [>Jobs].ManagedBy=[MIS Personnel_1].Key) LEFT JOI...
```
### >Sales Estimate Names Query
```sql
SELECT DISTINCTROW [>Jobs].ID AS Job, [>Jobs].Key, Max([Sales Journal].Due) AS Proposal, Max([Sales Journal].Proposal) AS Amount, [MIS Personnel].Text1 & "/" & [MIS Personnel_1].text1 AS Team, [>Jobs].Info2 AS Status, [>Jobs].Parent, [>Jobs].Family

FROM ((([>Jobs] LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key) LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job) LEFT JOIN [MIS Personnel] AS [MIS Personnel_1] ON [>Jobs].SpecifiedBy=[MIS Personnel_1].Key) LEFT JOIN [...
```
### >Sales Estimate Names by Date Query
```sql
SELECT DISTINCTROW [>Jobs].ID AS Job, [>Jobs].Key, Max([Sales Journal].Due) AS Proposal, Sum([SaleAmount]\1) AS [Total Sale], [MIS Personnel].Text1 & "/" & [MIS Personnel_1].text1 AS Team, [>Resources].ID AS Referral, [>Jobs].Parent, [>Jobs].Family, [>Jobs].Info2 AS Outcome, [>Jobs].DesignJob

FROM ((([>Jobs] LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key) LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job) LEFT JOIN [MIS Personnel] AS [MIS Personnel_1] ON [>Jobs].S...
```
### >Sales Estimates Open Query
```sql
SELECT DISTINCTROW First([MIS Personnel].Employee) AS FirstOfEmployee, [>Jobs].Info2, [>Jobs].ID, Max([Sales Journal].Due) AS MaxOfDue, [MIS Personnel].Text2, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount, First([>Resources].ID) AS FirstOfID, First([>Jobs].Category) AS FirstOfCategory, [>Resources_1].ID, [>Resources_2].ID, [>Resources_3].ID, [>Resources_4].ID, [>Jobs].Closed

FROM [Sales Journal] INNER JOIN (((((([>Jobs] LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key) LE...
```
### >Sales Estimates Query
```sql
SELECT DISTINCTROW [>Jobs].ID, First([Sales Journal].Due) AS FirstOfDue, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount, First([MIS Personnel].Employee) AS FirstOfEmployee, First([>Resources].ID) AS FirstOfID

FROM ([Sales Journal] LEFT JOIN ([>Jobs] LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key) ON [Sales Journal].Job=[>Jobs].Key) LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key

GROUP BY [>Jobs].ID, [>Jobs].Estimate, [>Jobs].Closed

HAVING (((First([Sales Jo...
```
### >Sales Incomplete Estimates Query
```sql
SELECT DISTINCTROW First([MIS Personnel].Employee) AS FirstOfEmployee, [>Jobs].ID, [>Jobs].Info2, [>Jobs].ManagedBy, [>Jobs].SpecifiedBy, Max([Sales Journal].Due) AS MaxOfDue, [MIS Personnel].Text2, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount, First([>Resources].ID) AS FirstOfID, First([>Jobs].Category) AS FirstOfCategory, [>Resources_1].ID, [>Resources_2].ID, [>Resources_3].ID, [>Resources_4].ID, [>Jobs].Closed

FROM ((((([Sales Journal] RIGHT JOIN ([>Jobs] LEFT JOIN [MIS Personnel] ON [...
```
### >Sales Interior Designer Design Cost Query
```sql
SELECT DISTINCTROW [>Sales Interior Designer Total Query].Key, [>Resources].ID AS ResourceID, [>Sales Interior Designer Total Query].SumOfSumOfSaleAmount, [>Jobs].ID AS JobID, [>Jobs].ManagedBy, [>Jobs].SpecifiedBy, [Job Agreement Sales NIC Stone].SumOfSaleAmount, [>Jobs].ProductionPhase, [Job Agreement Sales NIC Stone].LastOfTheDate, [Job Project Hours].TotalCost, [Job Cabinet Hours].TotalCost

FROM ([>Resources] RIGHT JOIN [>Sales Interior Designer Total Query] ON [>Resources].Key=[>Sales Inte...
```
### >Sales Interior Designer Query
```sql
SELECT DISTINCTROW [>Resources].ID, [>Resources].Key, [>Jobs].ID, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount, Max([Sales Journal].TheDate) AS MaxOfTheDate

FROM [>Resources] LEFT JOIN ([>Jobs] LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job) ON [>Resources].Key=[>Jobs].DesignedBy

WHERE ((([>Jobs].Estimate)=False))

GROUP BY [>Resources].ID, [>Resources].Key, [>Jobs].ID

HAVING ((([>Resources].ID)<>"") AND ((Sum([Sales Journal].SaleAmount))<>0))

ORDER BY [>Resources].ID, [>...
```
### >Sales Interior Designer Total Query
```sql
SELECT DISTINCTROW [>Resources].Key, Sum([Job Agreement Sales NIC Stone].SumOfSaleAmount) AS SumOfSumOfSaleAmount

FROM [>Resources] LEFT JOIN ([>Jobs] LEFT JOIN [Job Agreement Sales NIC Stone] ON [>Jobs].Key=[Job Agreement Sales NIC Stone].Key) ON [>Resources].Key=[>Jobs].DesignedBy

WHERE ((([>Jobs].Estimate)=False))

GROUP BY [>Resources].Key

ORDER BY [>Resources].Key;
```
### >Sales Invoice Note Query
```sql
SELECT [Sales Journal].*, [>Jobs].ProductionPhase, [MIS Personnel].Text1, [>Jobs].ID, [MIS Personnel_1].Employee

FROM (([Sales Journal] INNER JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key) LEFT JOIN [MIS Personnel] AS [MIS Personnel_1] ON [>Jobs].ManagedBy=[MIS Personnel_1].Key) LEFT JOIN [MIS Personnel] ON [>Jobs].SpecifiedBy=[MIS Personnel].Key

WHERE ((([>Jobs].ProductionPhase)<>"Archive" And ([>Jobs].ProductionPhase)<>"Completed") AND (([MIS Personnel_1].Employee)="Clinton") AND (([>Jobs]...
```
### >Sales Invoice Report Query
```sql
SELECT DISTINCTROW [General Ledger].*, [>Jobs].ID, [>Resources].ID

FROM ((([General Ledger] LEFT JOIN [Receipts Journal] ON [General Ledger].SourceKey=[Receipts Journal].Key) LEFT JOIN [Sales Journal] ON [General Ledger].SourceKey=[Sales Journal].Key) LEFT JOIN [>Jobs] ON [Receipts Journal].Job=[>Jobs].Key) LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key

WHERE ((([Receipts Journal].Job)=Forms!Sales.JobName));
```
### >Sales Job Hours Query
```sql
SELECT Sum([MIS Hours].Hours) AS SumOfHours, [MIS Hours].Employee, Min([>Resources].TheName) AS MinOfTheName, Sum([MIS Hours].Saturday) AS SumOfSaturday, Sum([MIS Hours].Cost) AS SumOfCost

FROM ([MIS Hours] LEFT JOIN [MIS Personnel] ON [MIS Hours].Employee=[MIS Personnel].Employee) LEFT JOIN [>Resources] ON [MIS Personnel].Resource=[>Resources].Key

GROUP BY [MIS Hours].Employee, [MIS Hours].[Job ID]

HAVING ((([MIS Hours].[Job ID])=Forms!Sales!JobName))

ORDER BY Sum([MIS Hours].Hours) DESC , ...
```
### >Sales Job Names Query
```sql
SELECT DISTINCTROW [>Jobs].ID AS Job, [>Jobs].Key, [>Jobs].ProductionPhase AS Currently, SaleorAmountorTotal.Total AS [Sale or Amount], IIf([DesignJob] And Not [estimate],"Design",IIf([Estimate] And Not [designjob],"Estimate",IIf([Estimate] And [designjob],"Design Estimate",""))) AS [Job Type], IIf([Family],"Parent",IIf(nnez([Parent])<>0,"Child","")) AS [Parent/Child], [>Jobs].Family, [MIS Personnel].Text1 & "/" & [MIS Personnel_1].text1 AS Team, [>Jobs].Closed

FROM ((([>Jobs] LEFT JOIN [>Resou...
```
### >Sales Link Query
```sql
SELECT DISTINCTROW [Sales Journal].Key, [Sales Journal].InvoiceNumber, [Sales Journal].Category

FROM [Sales Journal]

WHERE ((([Sales Journal].Job)=Forms!Sales!JobName) And (([Sales Journal].Journal)="Sale"))

ORDER BY [Sales Journal].InvoiceNumber;
```
### >Sales Milestone Query
```sql
SELECT DISTINCTROW ProjectSchedule.TaskEnd, [>Receivables Query].Days, ProjectSchedule.TaskBegin, ProjectSchedule.Task, ProjectSchedule.TaskDuration, ProjectSchedule.PercentComplete, [>Job Receipts Query].SumOfAmount, [>Job Hours Cost Query].SumOfHours, [>Job Hours Cost Query].SumOfCost, [>Jobs].ID, ProjectSchedule.Job, [>Jobs].ProductionPhase, [>Sales Total Cabinets].SumOfSaleAmount, ProjectSchedule.EntryDate, [>Jobs].ProductionPhase, [MIS Personnel_1].Employee, [MIS Personnel_2].Employee, [MIS...
```
### >Sales No Schedule Query
```sql
SELECT DISTINCTROW [>Jobs].ID, [MIS Personnel].Employee, [MIS Personnel_1].Text1, [>Jobs].ManagedBy, [>Jobs].SpecifiedBy, [>Sales Total Cabinets].SumOfSaleAmount, Count(ProjectSchedule.Job) AS CountOfJob, [>Jobs].ProductionPhase, Sum([>Job Hours Project Cost Query].SumOfCost) AS SumOfSumOfCost, Sum([>Job Hours Project Cost Query].SumOfHours) AS SumOfSumOfHours

FROM (((([>Jobs] LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key) LEFT JOIN ProjectSchedule ON [>Jobs].Key=ProjectSch...
```
### >Sales Not Audited Query
```sql
SELECT DISTINCTROW [>Jobs].ID, [Job Agreement Sales NIC Stone].SumOfSaleAmount, [MIS Personnel].Employee AS Partner, [Job Agreement Sales NIC Stone].LastOfTheDate, [>Jobs].ProductionPhase, [>Jobs].SpecifiedBy, [>Jobs].Completed, [>Jobs].ManagedBy, [>Jobs].Audit

FROM ([>Jobs] LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key) INNER JOIN [Job Agreement Sales NIC Stone] ON [>Jobs].Key=[Job Agreement Sales NIC Stone].Key

WHERE ((([Job Agreement Sales NIC Stone].SumOfSaleAmount)<>0...
```
### >Sales Not Posted Query
```sql
SELECT DISTINCTROW [Sales Journal].*, [>Jobs].ID, [MIS Personnel].Employee, [>Resources].ID, [>Jobs].ManagedBy, [>Jobs].SpecifiedBy

FROM (([Sales Journal] LEFT JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key) LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key) LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key

WHERE ((([Sales Journal].Due) Is Not Null) AND (([Sales Journal].Posted)=False) AND (([Sales Journal].InvoiceAmount)<>0))

ORDER BY [>Jobs].ID, [Sales Journal].D...
```
### >Sales Note Query
```sql
SELECT [>Jobs].Info4, [>Jobs].Info3, [MIS Personnel].Key

FROM [>Jobs] LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key

WHERE ((([>Jobs].Key)=Forms!Sales!JobName));
```
### >Sales PM Query
```sql
SELECT [Sales Journal].*, [>Jobs].ProductionPhase, [MIS Personnel].Text1, [>Jobs].ID, [MIS Personnel].Employee, [>Jobs].SpecifiedBy

FROM ([Sales Journal] INNER JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key) LEFT JOIN [MIS Personnel] ON [>Jobs].SpecifiedBy=[MIS Personnel].Key

WHERE ((([>Jobs].ProductionPhase)<>"Archive" And ([>Jobs].ProductionPhase)<>"Completed") And (([MIS Personnel].Employee)=Forms!Sales.Manager) And (([>Jobs].Estimate)=False) And (([>Jobs].Closed)=False) And (([Sales Journ...
```
### >Sales Partner Query
```sql
SELECT [>Jobs].ID, [Job Agreement Sales NIC Stone].SumOfSaleAmount, [>Jobs].ProductionPhase, [MIS Personnel].Key, [MIS Personnel].Employee, [MIS Personnel].Text1, [MIS Personnel_1].Key, [MIS Personnel_1].Employee, [MIS Personnel_1].Text1, [>Jobs].Info5

FROM (([>Jobs] LEFT JOIN [Job Agreement Sales NIC Stone] ON [>Jobs].Key=[Job Agreement Sales NIC Stone].Key) LEFT JOIN [MIS Personnel] ON [>Jobs].SpecifiedBy=[MIS Personnel].Key) LEFT JOIN [MIS Personnel] AS [MIS Personnel_1] ON [>Jobs].ManagedBy...
```
### >Sales Payments Query
```sql
SELECT DISTINCTROW [>Jobs].ID, [MIS Personnel].Employee, [>Jobs].ManagedBy, [>Jobs].SpecifiedBy, [Receipts Journal].CheckDate, [Receipts Journal].Amount, [>Resources].ID

FROM (([>Jobs] LEFT JOIN [Receipts Journal] ON [>Jobs].Key=[Receipts Journal].Job) LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key) LEFT JOIN [>Resources] ON [Receipts Journal].Payor=[>Resources].Key

WHERE ((([Receipts Journal].CheckDate)>Date()-90) AND (([Receipts Journal].Amount)<>0))

ORDER BY [Receipts J...
```
### >Sales Priced Too High Query
```sql
SELECT DISTINCTROW [>Jobs].Key, [>Jobs].Info2, [Sales Journal].SaleAmount, [>Estimates Closed Query].Due

FROM [>Estimates Closed Query] LEFT JOIN ([Sales Journal] LEFT JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key) ON [>Estimates Closed Query].Key=[Sales Journal].Job

WHERE ((([>Jobs].Info2)="price too high") AND (([Sales Journal].SaleAmount)<>0));
```
### >Sales Prided Too High Trend
```sql
SELECT [>Estimates Closed Query].Due, [Sales Journal].SaleAmount, [>Sales Priced Too High Query].SaleAmount

FROM ([>Estimates Closed Query] LEFT JOIN [>Sales Priced Too High Query] ON [>Estimates Closed Query].Key=[>Sales Priced Too High Query].Key) LEFT JOIN [Sales Journal] ON [>Estimates Closed Query].Key=[Sales Journal].Job;
```
### >Sales Print Design Invoice Query
```sql
SELECT DISTINCTROW TOP 1 [Sales Journal].InvoiceNumber, [Sales Journal].Description AS [Select an Invoice], [Sales Journal].Due AS Dated, [Sales Journal].Key, [Sales Journal].Job

FROM [Sales Journal]

WHERE ((([Sales Journal].Job)=forms!Sales!TheJobName) And (([Sales Journal].Journal)="Invoice") And (([Sales Journal].InvoiceAmount)<>0))

ORDER BY [Sales Journal].Due DESC

WITH OWNERACCESS OPTION;
```
### >Sales Print Design Invoice Query V2
```sql
SELECT DISTINCTROW TOP 1 [Sales Journal].InvoiceNumber

FROM [Sales Journal]

GROUP BY [Sales Journal].Due, [Sales Journal].InvoiceNumber, [Sales Journal].Job, [Sales Journal].Journal, [Sales Journal].InvoiceAmount

HAVING ((([Sales Journal].Job)=forms!Sales!TheJobName) And (([Sales Journal].Journal)="Invoice") And (([Sales Journal].InvoiceAmount)<>0))

ORDER BY [Sales Journal].Due DESC

WITH OWNERACCESS OPTION;
```
### >Sales Print Invoice Query
```sql
SELECT DISTINCTROW [Sales Journal].InvoiceNumber, [Sales Journal].Description AS [Select an Invoice], [Sales Journal].Due AS Dated, [Sales Journal].Key, [Sales Journal].Job

FROM [>Jobs] LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job

WHERE ((([Sales Journal].Journal)="Invoice") And ((IIf(Not forms!Sales!Family And [Job]=forms!Sales!Jobname,True,IIf(forms!Sales!Family And [Parent]=Forms!Sales!JobName Or forms!Sales!Family And [Job]=Forms!Sales!JobName,True,False)))=True) And (([Sal...
```
### >Sales Print Proposal Query
```sql
SELECT DISTINCTROW [Sales Journal].InvoiceNumber, [Sales Journal].Description AS [Select a Proposal], [Sales Journal].Due AS Dated, [Sales Journal].Key, [Sales Journal].Job

FROM [>Jobs] LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job

WHERE ((([Sales Journal].Journal)="Invoice") And ((IIf(Not forms!Sales!Family And [Job]=forms!Sales!Jobname,True,IIf(forms!Sales!Family And [Parent]=Forms!Sales!JobName Or forms!Sales!Family And [Job]=Forms!Sales!JobName,True,False)))=True) And ((InSt...
```
### >Sales Production Query
```sql
SELECT DISTINCTROW ProjectSchedule.Task, ProjectSchedule.PercentComplete, ProjectSchedule.TaskEnd, [>Jobs].ID, [MIS Personnel].Employee, ProjectSchedule.Job, [>Jobs].ProductionPhase, [>Sales Total Cabinets].SumOfSaleAmount, ProjectSchedule.EntryDate, [>Jobs].ProductionPhase, [MIS Personnel].Employee, [MIS Personnel_1].Employee, [MIS Personnel_2].Employee, [MIS Personnel].Text1, [MIS Personnel_1].Text1, [MIS Personnel_2].Text1, [>Jobs].ManagedBy, [>Jobs].SpecifiedBy, [>Jobs].EstimatedBy

FROM (((...
```
### >Sales Proposals Open Query
```sql
SELECT DISTINCTROW First([MIS Personnel].Employee) AS FirstOfEmployee, [MIS Personnel].Text2, [>Jobs].Key, Max([Sales Journal].Due) AS MaxOfDue, [Sales Journal].Description

FROM [Sales Journal] LEFT JOIN ([>Jobs] LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key) ON [Sales Journal].Job=[>Jobs].Key

GROUP BY [MIS Personnel].Text2, [>Jobs].Key, [Sales Journal].Description, [>Jobs].Closed, [>Jobs].Estimate

HAVING ((([MIS Personnel].Text2)="Partner") AND ((Max([Sales Journal].Due)...
```
### >Sales Query
```sql
SELECT DISTINCTROW [Sales Journal].*

FROM [Sales Journal]

WHERE ((([Sales Journal].Job)=Forms!Sales.JobName))

ORDER BY [Sales Journal].Journal DESC , [Sales Journal].InvoiceNumber;
```
### >Sales Report Partner Query
```sql
SELECT [>Settings].PhaseSort, [>Jobs].ProductionPhase, [>Jobs].ID, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount, [>Jobs].Info5, [MIS Personnel].Text1, [MIS Personnel].Employee, [>Jobs].SpecifiedBy, [>Jobs].ManagedBy, [MIS Personnel_1].Employee, [>Jobs].Preliminary, [>Jobs].ProductionPhase

FROM ((([Sales Journal] RIGHT JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key) LEFT JOIN [MIS Personnel] AS [MIS Personnel_1] ON [>Jobs].ManagedBy=[MIS Personnel_1].Key) LEFT JOIN [MIS Personnel] ON [>Jo...
```
### >Sales Sale Not Posted Query
```sql
SELECT DISTINCTROW [Sales Journal].*, [>Jobs].ID, [MIS Personnel].Employee, [>Resources].ID, [>Jobs].ManagedBy, [>Jobs].SpecifiedBy

FROM (([Sales Journal] LEFT JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key) LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key) LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key

WHERE ((([Sales Journal].TheDate) Is Not Null) AND (([Sales Journal].Posted)=False) AND (([Sales Journal].SaleAmount)<>0))

ORDER BY [>Jobs].ID, [Sales Journal]....
```
### >Sales Total
```sql
SELECT [Sales Journal].Job, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount

FROM [Sales Journal] RIGHT JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key

WHERE ((([>Jobs].Estimate)=False) AND (([Sales Journal].TheDate) Is Not Null))

GROUP BY [Sales Journal].Job;
```
### >Sales Total Cabinets
```sql
SELECT [Sales Journal].Job, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount

FROM [Sales Journal]

WHERE (((InStr([Category],"Cabinet") Or InStr([Category],"Countertop"))<>0))

GROUP BY [Sales Journal].Job;
```
### >Sales Underfunded Query
```sql
SELECT DISTINCTROW [>Jobs].ID, [>Jobs].Key, [>Jobs].EntryDate, [>Jobs].Preliminary, [Job Agreement Sales NIC Stone].SumOfSaleAmount AS Agreement, IIf(NNEZ([>Receivables Query].Days)<>0,[>Receivables Query].Days & " d","") AS Receivable, IIf([>Receivables Query].Owed<>0,[>Receivables Query].Owed,"") AS Owed, [Job Project Hours].SumOfHours AS OfficeHours, [>Job Receipts Query].SumOfAmount AS OnAccount, [Job Project Hours].TotalCost AS OfficeCost, [>Jobs].ProductionPhase, [MIS Personnel_1].Employee...
```
### >Sales VOJC PM Query
```sql
SELECT [MIS Personnel_1].Employee, [Sales Journal].TheDate, [>Jobs].ID, [MIS Personnel].Employee, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount, [MIS Personnel_1].Text2, [MIS Personnel_1].Key

FROM (([Sales Journal] LEFT JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key) LEFT JOIN [MIS Personnel] AS [MIS Personnel_1] ON [>Jobs].SpecifiedBy=[MIS Personnel_1].Key) LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key

GROUP BY [MIS Personnel_1].Employee, [Sales Journal].TheDate, [>...
```
### >Sales VOJC Query
```sql
SELECT [MIS Personnel_1].Employee, [Sales Journal].TheDate, [>Jobs].ID, [MIS Personnel].Employee, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount, [MIS Personnel_1].Text2, [MIS Personnel_1].Key, [>Jobs].SpecifiedBy, [>Jobs].ManagedBy

FROM [Sales Journal] LEFT JOIN (([>Jobs] LEFT JOIN [MIS Personnel] AS [MIS Personnel_1] ON [>Jobs].ManagedBy=[MIS Personnel_1].Key) LEFT JOIN [MIS Personnel] ON [>Jobs].SpecifiedBy=[MIS Personnel].Key) ON [Sales Journal].Job=[>Jobs].Key

GROUP BY [MIS Personnel_...
```
### >Sales of Cabinets
```sql
SELECT [Sales Journal].SaleAmount, First([>Jobs].ID) AS FirstOfID

FROM [>Jobs] LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job

WHERE ((([>Jobs].Closed)=False) AND (([>Jobs].Estimate)=False))

GROUP BY [Sales Journal].SaleAmount

ORDER BY First([>Jobs].ID);
```
### >Sales of Cabinets Only
```sql
SELECT [Sales Journal].SaleAmount, [Sales Journal].Key, [Sales Journal].Category

FROM [Sales Journal]

WHERE ((([Sales Journal].Category)="Cabinet"));
```
### >SalesForm Estimate Query
```sql
SELECT [>Jobs].ID, [>Jobs].Key, [>Jobs].Info4, [>Jobs].Spreadsheet, [>Jobs].Info3, [MIS Personnel].Employee, [MIS Personnel_1].Employee, [>Jobs].Category, [>Jobs].Parent, [>Jobs].Family, [>Jobs].ManagedBy, [>Jobs].SpecifiedBy

FROM ([>Jobs] LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key) LEFT JOIN [MIS Personnel] AS [MIS Personnel_1] ON [>Jobs].SpecifiedBy=[MIS Personnel_1].Key

WHERE ((([>Jobs].Key)=Forms!Sales!EstimateName));
```
### >SalesForm Query
```sql
SELECT [>Jobs].ID, [>Jobs].Key, [>Jobs].Info4, [>Jobs].Spreadsheet, [>Jobs].DesignJob, [>Jobs].Family, [>Jobs].Parent, [>Jobs].Category, [>Jobs].Info3, [MIS Personnel].Employee, [MIS Personnel_1].Employee, [>Jobs].ManagedBy, [>Jobs].SpecifiedBy

FROM ([>Jobs] LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key) LEFT JOIN [MIS Personnel] AS [MIS Personnel_1] ON [>Jobs].SpecifiedBy=[MIS Personnel_1].Key

WHERE ((([>Jobs].Key)=Forms!Sales!TheJobName));
```
### >SalesForm Query copy
```sql
SELECT [>Jobs].ID, [>Jobs].Key, [>Jobs].Info4, [>Jobs].Spreadsheet, [>Jobs].Category, [>Jobs].Info3, [MIS Personnel].Employee, [MIS Personnel_1].Employee, [>Jobs].ManagedBy, [>Jobs].SpecifiedBy, [Invoice Report Invoices Total].SumOfInvoiceAmount AS BillableDesignInvoices

FROM (([>Jobs] LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key) LEFT JOIN [MIS Personnel] AS [MIS Personnel_1] ON [>Jobs].SpecifiedBy=[MIS Personnel_1].Key) LEFT JOIN [Invoice Report Invoices Total] ON [>Jobs...
```
### >SalesSchedule by Partner Query
```sql
SELECT DISTINCTROW ProjectSchedule.*, [>Jobs].ID, [MIS Personnel].Employee, [>Jobs].Key, [>Jobs].ManagedBy, [>Jobs].SpecifiedBy, [MIS Personnel_1].Employee, [>Jobs].ProductionPhase, [>Settings.PhaseSort] AS Expr1

FROM ((([>Jobs] LEFT JOIN [MIS Personnel] ON [>Jobs].SpecifiedBy=[MIS Personnel].Key) INNER JOIN ProjectSchedule ON [>Jobs].Key=ProjectSchedule.Job) INNER JOIN [MIS Personnel] AS [MIS Personnel_1] ON [>Jobs].ManagedBy=[MIS Personnel_1].Key) LEFT JOIN [>Settings] ON [>Jobs].ProductionPh...
```
### >SalesSubForm Query
```sql
SELECT DISTINCTROW [Sales Journal].*

FROM [>Jobs] LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job

WHERE ((([Sales Journal].Journal)="Sale") And ((IIf(Not forms!Sales!Family And [Job]=forms!Sales!Jobname,True,IIf(forms!Sales!Family And [Parent]=Forms!Sales!JobName Or forms!Sales!Family And [Job]=Forms!Sales!JobName,True,False)))=True))

ORDER BY [>Jobs].ID, [Sales Journal].InvoiceNumber;
```
### >Scale Drawing Query
```sql
SELECT DISTINCTROW [>Settings].TheScale, [>Settings].ScaleTemplate, Right([ScaleTemplate],Len([ScaleTemplate])-1) AS Expr1

FROM [>Settings]

WHERE ((([>Settings].TheScale)<>""))

ORDER BY [>Settings].ScaleTemplate;
```
### >Schedule Phase Query
```sql
SELECT [>Jobs].ID, Count(ProjectSchedule.TaskSummary) AS CountOfTaskSummary

FROM ProjectSchedule LEFT JOIN [>Jobs] ON ProjectSchedule.Job=[>Jobs].Key

GROUP BY [>Jobs].ID, [>Jobs].Estimate, [>Jobs].Closed, ProjectSchedule.TaskSummary

HAVING ((([>Jobs].Estimate)=False) AND (([>Jobs].Closed)=False) AND ((ProjectSchedule.TaskSummary)=True))

ORDER BY [>Jobs].ID;
```
### >Schedule SubForm All Query
```sql
SELECT ProjectSchedule.Task, ProjectSchedule.TaskEnd, [>Jobs].ID, ProjectSchedule.PercentComplete, [>Jobs].ProductionPhase, [MIS Personnel].Text1, [>Jobs].SpecifiedBy, ProjectSchedule.Drawing, [>Jobs].Key, [MIS Personnel_1].Employee

FROM ProjectSchedule LEFT JOIN (([>Jobs] LEFT JOIN [MIS Personnel] AS [MIS Personnel_1] ON [>Jobs].ManagedBy=[MIS Personnel_1].Key) LEFT JOIN [MIS Personnel] ON [>Jobs].SpecifiedBy=[MIS Personnel].Key) ON ProjectSchedule.Job=[>Jobs].Key

WHERE (((ProjectSchedule.Per...
```
### >Schedule SubForm PM Query
```sql
SELECT ProjectSchedule.Task, ProjectSchedule.TaskEnd, [>Jobs].ID, ProjectSchedule.PercentComplete, [>Jobs].ProductionPhase, [MIS Personnel].Text1, [>Jobs].SpecifiedBy, ProjectSchedule.Drawing, [>Jobs].Key, [MIS Personnel].Employee

FROM ProjectSchedule LEFT JOIN (([>Jobs] LEFT JOIN [MIS Personnel] AS [MIS Personnel_1] ON [>Jobs].ManagedBy=[MIS Personnel_1].Key) LEFT JOIN [MIS Personnel] ON [>Jobs].SpecifiedBy=[MIS Personnel].Key) ON ProjectSchedule.Job=[>Jobs].Key

WHERE (((ProjectSchedule.Perce...
```
### >Schedule SubForm Query
```sql
SELECT ProjectSchedule.Task, ProjectSchedule.TaskEnd, [>Jobs].ID, ProjectSchedule.PercentComplete, WorkFlow.Phase, [>Jobs].Key AS JobKey, [MIS Personnel].Text1, [>Jobs].SpecifiedBy, ProjectSchedule.Drawing, [>Jobs].ManagedBy, [>Jobs].Key, [MIS Personnel].Employee, [MIS Personnel].Key, [MIS Personnel_1].Employee, [MIS Personnel_1].Key

FROM ProjectSchedule LEFT JOIN (WorkFlow LEFT JOIN (([>Jobs] LEFT JOIN [MIS Personnel] AS [MIS Personnel_1] ON [>Jobs].ManagedBy=[MIS Personnel_1].Key) LEFT JOIN [...
```
### >Select Database Query
```sql
SELECT DISTINCTROW [>Local Settings].DirectoryPath, [>Local Settings].LocalSettingNumber1

FROM [>Local Settings]

WHERE ((([>Local Settings].DirectoryPath)=Forms!SelectDatabase.PathTo));
```
### >Setting Query
```sql
SELECT DISTINCTROW [>Settings].*

FROM [>Settings];
```
### >Settings Auto Dimension Query
```sql
SELECT DISTINCTROW [>Settings].AutoDimension

FROM [>Settings];
```
### >Settings Query
```sql
SELECT DISTINCTROW [>Settings].*

FROM [>Settings]

WHERE ((([>Settings].Key)=LocalVariable("Settings_Key")));
```
### >Sort #1 Query
```sql
SELECT DISTINCTROW [>Product List Whole Query].Sort1

FROM [>Product List Whole Query]

GROUP BY [>Product List Whole Query].Sort1

ORDER BY [>Product List Whole Query].Sort1

WITH OWNERACCESS OPTION;
```
### >Sort #2 Query
```sql
SELECT DISTINCTROW [>Product List Whole Query].Sort2

FROM [>Product List Whole Query]

GROUP BY [>Product List Whole Query].Sort2

ORDER BY [>Product List Whole Query].Sort2

WITH OWNERACCESS OPTION;
```
### >Sort #3 Query
```sql
SELECT DISTINCTROW [>Product List Whole Query].Sort3

FROM [>Product List Whole Query]

GROUP BY [>Product List Whole Query].Sort3

ORDER BY [>Product List Whole Query].Sort3

WITH OWNERACCESS OPTION;
```
### >Sort #4 Query
```sql
SELECT DISTINCTROW [>Product List Whole Query].Sort4

FROM [>Product List Whole Query]

GROUP BY [>Product List Whole Query].Sort4

ORDER BY [>Product List Whole Query].Sort4

WITH OWNERACCESS OPTION;
```
### >Spreadsheets Categories Query
```sql
SELECT DISTINCTROW [>Resources].Key, [>Resources].ID, Count([>Spreadsheets].Spreadsheet) AS CountOfSpreadsheet

FROM [>Resources], [>Spreadsheets]

GROUP BY [>Resources].Key, [>Resources].ID, [>Resources].Category

HAVING ((([>Resources].Category)=Forms!Spreadsheets.CategorySort))

ORDER BY [>Resources].ID

WITH OWNERACCESS OPTION;
```
### >Spreadsheets OLE Query
```sql
SELECT DISTINCTROW [>Spreadsheets].Spreadsheet

FROM [>Spreadsheets]

WHERE ((([>Spreadsheets].Name)=Forms!Spreadsheets.Category And ([>Spreadsheets].Name) Is Not Null))

WITH OWNERACCESS OPTION;
```
### >Spreadsheets Query
```sql
SELECT DISTINCTROW [>Spreadsheets].*, Val(NNEZ([Sequence])) AS Expr1

FROM [>Spreadsheets]

WHERE ((([>Spreadsheets].Name)=Forms!Spreadsheets.Category And ([>Spreadsheets].Name) Is Not Null))

ORDER BY Val(NNEZ([Sequence]))

WITH OWNERACCESS OPTION;
```
### >Suppliers Query
```sql
SELECT DISTINCTROW [>Resources].ID, [>Resources].Key

FROM [>Resources]

WHERE ((([>Resources].Category)="Suppliers"))

ORDER BY [>Resources].ID

WITH OWNERACCESS OPTION;
```
### >Survey Completed Jobs Query
```sql
SELECT [>Jobs].ID, [>Jobs].Completed, [MIS Personnel].Employee, [>Resources].TheName, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount

FROM (([>Jobs] LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key) LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key) LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job

GROUP BY [>Jobs].ID, [>Jobs].Completed, [MIS Personnel].Employee, [>Resources].TheName

HAVING ((([>Jobs].Completed) Is Not Null))

ORDER BY [>Jobs].ID;
```
### >Survey Completed Summary Query
```sql
SELECT [>Jobs].ID, [>Jobs].Key, [Sales Journal].TheDate, [Sales Journal].SaleAmount, [MIS Personnel].Employee

FROM ([>Jobs] LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job) LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key

WHERE ((([Sales Journal].TheDate)<=forms!BonusPlan.Currently) And ((Year([TheDate]))=forms!BonusPlan.GoalYear))

ORDER BY [Sales Journal].TheDate DESC;
```
### >Survey Contact Query
```sql
SELECT [>Settings].MenuText, [>Settings].MenuCategory

FROM [>Settings]

WHERE ((([>Settings].MenuCategory)>0) AND (([>Settings].MacroToRun)="SurveyContact"))

ORDER BY [>Settings].MenuCategory;
```
### >Survey Job Names Query
```sql
SELECT DISTINCTROW [>Jobs].ID AS Job, [>Jobs].Completed, [>Jobs].Key, IIf(nnez([>Survey Query].Job)=0,"No","Yes") AS Surveyed, Count([>Survey Query].Question) AS Questions, [>Resources].ID, [MIS Personnel].Employee

FROM (([>Jobs] LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key) LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key) LEFT JOIN [>Survey Query] ON [>Jobs].Key=[>Survey Query].Job

GROUP BY [>Jobs].ID, [>Jobs].Completed, [>Jobs].Key, IIf(nnez([>Survey Query]....
```
### >Survey Names Query
```sql
SELECT DISTINCTROW [>Jobs].ID AS Job, [>Jobs].Completed, [>Jobs].Key, Count(Survey.Question) AS Questions, [>Resources].ID, [MIS Personnel].Employee

FROM (([>Jobs] LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key) LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key) LEFT JOIN Survey ON [>Jobs].Key=Survey.Job

GROUP BY [>Jobs].ID, [>Jobs].Completed, [>Jobs].Key, [>Resources].ID, [MIS Personnel].Employee

HAVING (((First(Survey.Key))<>0) AND ((Sum(Survey.Score))<>0))

OR...
```
### >Survey Query
```sql
SELECT Survey.*

FROM Survey;
```
### >Survey Question Query
```sql
SELECT SurveyQuestions.Question

FROM SurveyQuestions

WHERE (((SurveyQuestions.Team)=Forms!CustomerSurvey!Team))

ORDER BY SurveyQuestions.Team;
```
### >Survey Questions Query
```sql
SELECT SurveyQuestions.*

FROM SurveyQuestions

WHERE (((SurveyQuestions.Index)>0))

ORDER BY SurveyQuestions.Index;
```
### >Survey Summary Incomplete Query
```sql
SELECT [>Jobs].ID, [Sales Journal].TheDate, [MIS Personnel].Employee, First([>Resources].TheName) AS FirstOfTheName, First([>Resources].ID) AS FirstOfID3, [Sales Journal].Job, First([>Resources_1].ID) AS FirstOfID, First([>Resources_2].ID) AS FirstOfID1, First([>Resources_3].ID) AS FirstOfID2

FROM ((((([>Jobs] LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key) LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key) LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].J...
```
### >Survey Summary Query
```sql
SELECT First(Survey.Job) AS FirstOfJob, [>Jobs].ID, [>Jobs].Completed, [MIS Personnel].Employee, [>Resources].TheName

FROM ((Survey LEFT JOIN [>Jobs] ON Survey.Job=[>Jobs].Key) LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key) LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key

GROUP BY [>Jobs].ID, [>Jobs].Completed, [MIS Personnel].Employee, [>Resources].TheName, Year([>Jobs].Completed)

HAVING (((Year([>Jobs].Completed))=NNEZ(Localvariable("Form_BonusPlan_GoalYear")...
```
### >Survey Team Query
```sql
SELECT [>Settings].MenuText

FROM [>Settings]

WHERE ((([>Settings].MacroToRun)="SurveyTeam"))

ORDER BY [>Settings].MenuCategory;
```
### >Templates Query
```sql
SELECT DISTINCTROW [>Resources].Key, [>Resources].ID, Count([>Drawings].Drawing) AS CountOfDrawing

FROM [>Resources] LEFT JOIN [>Drawings] ON [>Resources].Key=[>Drawings].Name

GROUP BY [>Resources].Key, [>Resources].ID, [>Resources].Category

HAVING ((([>Resources].Category)=Forms!Drawings.CategorySort))

ORDER BY [>Resources].ID

WITH OWNERACCESS OPTION;
```
### >Thickness Query
```sql
SELECT DISTINCTROW [>Parts Data].[Thickness Code] AS Expr1, [>Parts Data].Thickness AS Expr2

FROM [>Parts Data]

WHERE ((([>Parts Data].[Thickness Code])>=0))

ORDER BY [>Parts Data].[Thickness Code]

WITH OWNERACCESS OPTION;
```
### >Time ADP Summary Query
```sql
SELECT DISTINCTROW [MIS Hours].*

FROM [MIS Hours]

WHERE ((([MIS Hours].Date)=Forms!HoursEntry.Week) And (([MIS Hours].ADPHoursCode) Is Not Null))

ORDER BY [MIS Hours].Employee;
```
### >Time Card Job Names Query
```sql
SELECT DISTINCTROW [>Jobs].ID AS Job, [>Jobs].Key, [>Resources].ID AS Customer, [>Jobs].ProductionPhase AS Phase, [MIS Personnel].Text1 & "/" & [MIS Personnel_1].text1 AS Team, Sum([SaleAmount]\1) AS [Total Sale], Max([Sales Journal].Due) AS [Last Invoice], [>Jobs].Closed

FROM ((([>Jobs] LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key) LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key) LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job) LEFT JOIN [MIS Pers...
```
### >Time Card Personnel Query
```sql
SELECT DISTINCTROW [MIS Personnel].Employee, [MIS Personnel].Key, [MIS Personnel].Rate, [MIS Personnel].ADPFile, [MIS Personnel].ADPName, [MIS Personnel].ADPNetAccount, [MIS Personnel].WitholdingAccount, [MIS Personnel].MedicalAccount, [MIS Personnel].EmployerAccount, [MIS Personnel].MiscAccount, [MIS Personnel].RetirementAccount

FROM [MIS Personnel]

WHERE ((([MIS Personnel].ADPFile)<>0) And (([MIS Personnel].Closed)=Forms!HoursEntryV2!ViewArchived))

ORDER BY [MIS Personnel].Employee

WITH OW...
```
### >Time Company Summary Query
```sql
SELECT DISTINCTROW [MIS Hours].*, [>Jobs].ID

FROM [MIS Hours] LEFT JOIN [>Jobs] ON [MIS Hours].[Job ID]=[>Jobs].Key

WHERE ((([MIS Hours].Date)=Forms!HoursEntry.Week))

ORDER BY [MIS Hours].Employee, [MIS Hours].Activity;
```
### >Time Detail Query
```sql
SELECT DISTINCTROW [MIS Hours].*, [>Jobs].ID, IIf(nnen([Activity])="",[General],[Activity]) AS TheActivity

FROM [MIS Hours] LEFT JOIN [>Jobs] ON [MIS Hours].[Job ID]=[>Jobs].Key

WHERE ((([MIS Hours].Employee)=Forms!HoursEntry.EmpName) And (([MIS Hours].Date)=Forms!HoursEntry.Week))

ORDER BY [MIS Hours].Activity, IIf(nnen([Activity])="",[General],[Activity]), [>Jobs].ID;
```
### >Time Error Summary Query
```sql
SELECT DISTINCTROW [MIS Hours].*, [>Jobs].ID, [>Jobs].Completed, [>Jobs].DesignJob

FROM [MIS Hours] LEFT JOIN [>Jobs] ON [MIS Hours].[Job ID]=[>Jobs].Key

WHERE ((([MIS Hours].Date)=Forms!HoursEntry.Week))

ORDER BY [MIS Hours].Archive DESC , [MIS Hours].Activity;
```
### >Time Summary Query
```sql
SELECT DISTINCTROW [MIS Hours].*, [>Jobs].ID

FROM [MIS Hours] LEFT JOIN [>Jobs] ON [MIS Hours].[Job ID]=[>Jobs].Key

WHERE ((([MIS Hours].Employee)=Forms!HoursEntry.EmpName) And (([MIS Hours].Date)=Forms!HoursEntry.Week))

ORDER BY [MIS Hours].Archive DESC , [MIS Hours].Activity;
```
### >What's New Query
```sql
SELECT DISTINCTROW [>Settings].Key, [>Settings].New

FROM [>Settings]

WHERE ((([>Settings].Key)=4));
```
### >Width Query
```sql
SELECT DISTINCTROW [>Parts Data].[Width Code] AS Expr1, [>Parts Data].Width AS Expr2

FROM [>Parts Data]

WHERE ((([>Parts Data].[Width Code])>=0))

ORDER BY [>Parts Data].[Width Code]

WITH OWNERACCESS OPTION;
```
### >Work Flow Milestone Query
```sql
SELECT DISTINCTROW WorkFlow.TaskEnd, WorkFlow.Key, [>Receivables Query].Days, WorkFlow.TaskBegin, WorkFlow.Task, WorkFlow.TaskDuration, WorkFlow.PercentComplete, WorkFlow.PhaseAmount, WorkFlow.Engineer, [>Job Receipts Query].SumOfAmount, [>Job Hours Cost Query].SumOfHours, [>Job Hours Cost Query].SumOfCost, WorkFlow.Phase, [>Jobs].ID, WorkFlow.Job, [>Jobs].ProductionPhase, [>Jobs].ManagedBy, [>Jobs].SpecifiedBy, [>Sales Total Cabinets].SumOfSaleAmount, [>Jobs].ProductionPhase, [MIS Personnel_1]....
```
### >Work Flow Query
```sql
SELECT DISTINCTROW ProjectSchedule.*, Workflow.*, [>Jobs].ID, [MIS Personnel].Employee, [MIS Personnel_1].Text1, [MIS Personnel_2].Text1, [>Jobs].Key, ProjectSchedule.PageNumber

FROM ((((ProjectSchedule LEFT JOIN [>Jobs] ON ProjectSchedule.Job=[>Jobs].Key) LEFT JOIN [MIS Personnel] ON ProjectSchedule.EntryBy=[MIS Personnel].Key) LEFT JOIN Workflow ON ProjectSchedule.WorkFlowKey=Workflow.Key) LEFT JOIN [MIS Personnel] AS [MIS Personnel_1] ON [>Jobs].ManagedBy=[MIS Personnel_1].Key) LEFT JOIN [MI...
```
### >WorkFlow Engineer Query
```sql
SELECT DISTINCTROW [MIS Personnel].Text1

FROM [MIS Personnel]

WHERE ((([MIS Personnel].Closed)=False) AND (([MIS Personnel].Text2)="Engineer" Or ([MIS Personnel].Text2)="Project Manager"))

ORDER BY [MIS Personnel].Text1

WITH OWNERACCESS OPTION;
```
### >X Dimension Query
```sql
SELECT DISTINCTROW [>Settings].MenuText, [>Settings].MacroToRun

FROM [>Settings]

WHERE (((InStr([MenuText],"dim"))<>"0") AND ((InStr([MenuText],"X"))<>"0"))

ORDER BY [>Settings].MacroToRun;
```
### >Z Dimension Query
```sql
SELECT DISTINCTROW [>Settings].MenuText, [>Settings].MacroToRun

FROM [>Settings]

WHERE (((InStr([MenuText],"dim"))<>"0") AND ((InStr([MenuText],"Z"))<>"0"))

ORDER BY [>Settings].MacroToRun;
```
### >eMail Subform Query
```sql
SELECT DISTINCTROW eMail.*

FROM eMail

WHERE (((eMail.ResourceKey)=Forms!Resources.Key))

ORDER BY eMail.email, eMail.ContactName

WITH OWNERACCESS OPTION;
```
### CNCFunctionQuery
```sql
SELECT [>Settings].Key, [>Settings].CNCFunctionDescription

FROM [>Settings]

WHERE ((([>Settings].CNCFunctionDescription)<>"") AND (([>Settings].CNCDXF)<>""))

ORDER BY [>Settings].CNCFunctionDescription;
```
### Chart Estimates Trend
```sql
SELECT [>Sales Dated Estimates Trend Query].Info2, [>Sales Dated Estimates Trend Query].SumOfSaleAmount

FROM [>Sales Dated Estimates Trend Query];
```
### Children
```sql
SELECT [>Jobs].Parent AS theParent, Sum(SalesSummarybyJob.Amount) AS SumOfAmount

FROM [>Jobs] LEFT JOIN SalesSummarybyJob ON [>Jobs].Key=SalesSummarybyJob.Key

GROUP BY [>Jobs].Parent

HAVING ((([>Jobs].Parent)<>0))

ORDER BY [>Jobs].Parent;
```
### ComponentsQuery
```sql
SELECT Components.Component, Components.key

FROM Components

WHERE (((nnez([Office]))=0))

ORDER BY Components.Sequence;
```
### CostSubForm Current Selection Query
```sql
SELECT [>Jobs].ID, [Job Project Hours].TotalCost, [Job Agreement Sales].SumOfSaleAmount-NNEZ([Job Stone Sales].sumofsaleamount) AS TotalSales, [MIS Personnel].Key, [MIS Personnel_1].Key, [>Jobs].Closed, [>Jobs].Key AS JobKey, [TotalCost]/[TotalSales] AS Percentage, [>Jobs].ProductionPhase

FROM (((([>Jobs] LEFT JOIN [Job Project Hours] ON [>Jobs].Key=[Job Project Hours].Key) LEFT JOIN [MIS Personnel] ON [>Jobs].SpecifiedBy=[MIS Personnel].Key) LEFT JOIN [MIS Personnel] AS [MIS Personnel_1] ON [>...
```
### CostSubForm Design Query
```sql
SELECT [>Jobs].ID, [Job Project Hours].TotalCost, [Job Agreement Sales].SumOfSaleAmount-NNEZ([Job Stone Sales].sumofsaleamount) AS TotalSales, [MIS Personnel].Key, [MIS Personnel_1].Key, [>Jobs].DesignJob, [>Jobs].Closed, [>Jobs].Key AS JobKey, [TotalCost]/[TotalSales] AS Percentage, [>Jobs].ProductionPhase

FROM (((([>Jobs] LEFT JOIN [Job Project Hours] ON [>Jobs].Key=[Job Project Hours].Key) LEFT JOIN [MIS Personnel] ON [>Jobs].SpecifiedBy=[MIS Personnel].Key) LEFT JOIN [MIS Personnel] AS [MIS...
```
### CostSubForm Query
```sql
SELECT [>Jobs].ID, [Job Project Hours].TotalCost, [Job Agreement Sales].SumOfSaleAmount-NNEZ([Job Stone Sales].sumofsaleamount) AS TotalSales, [MIS Personnel].Key, [MIS Personnel_1].Key, [>Jobs].DesignJob, [>Jobs].Closed, [>Jobs].Key AS JobKey, [TotalCost]/[TotalSales] AS Percentage, [>Jobs].ProductionPhase

FROM ((((([>Jobs] LEFT JOIN [Job Project Hours] ON [>Jobs].Key=[Job Project Hours].Key) LEFT JOIN [MIS Personnel] ON [>Jobs].SpecifiedBy=[MIS Personnel].Key) LEFT JOIN [MIS Personnel] AS [MI...
```
### DesignCurrentExpenseSubForm Query
```sql
SELECT Sum([Purchase Journal].DebitAmount) AS SumOfDebitAmount

FROM [Purchase Journal] LEFT JOIN [MIS Accounts] ON [Purchase Journal].AccountNo=[MIS Accounts].Number

WHERE ((([Purchase Journal].InvoiceDate)>=Forms!Sales!FromDate And ([Purchase Journal].InvoiceDate)<=Forms!Sales!toDate) And (([Purchase Journal].Job)=Forms!Sales!JobName));
```
### DesignExpenseSubForm Query
```sql
SELECT [Purchase Journal].InvoiceDate, [Account] & " " & [Description] AS SourceTransaction, [Purchase Journal].DebitAmount

FROM [Purchase Journal] INNER JOIN [MIS Accounts] ON [Purchase Journal].AccountNo=[MIS Accounts].Number

GROUP BY [Purchase Journal].InvoiceDate, [Account] & " " & [Description], [Purchase Journal].DebitAmount, [Purchase Journal].Job

HAVING ((([Purchase Journal].InvoiceDate)>=Forms!Sales!FromDate And ([Purchase Journal].InvoiceDate)<=Forms!Sales!toDate) And (([Purchase Jo...
```
### DesignPaymentSubForm Query
```sql
SELECT [Receipts Journal].CheckDate, [Receipts Journal].Description, [Receipts Journal].Amount

FROM [Receipts Journal]

GROUP BY [Receipts Journal].CheckDate, [Receipts Journal].Description, [Receipts Journal].Amount, [Receipts Journal].Job

HAVING ((([Receipts Journal].Job)=Forms!Sales!theJobName))

ORDER BY [Receipts Journal].CheckDate;
```
### DesignPreviousExpenseSubForm Query
```sql
SELECT Sum([Purchase Journal].DebitAmount) AS SumOfDebitAmount

FROM [Purchase Journal] INNER JOIN [MIS Accounts] ON [Purchase Journal].AccountNo=[MIS Accounts].Number

WHERE ((([Purchase Journal].InvoiceDate)<Forms!Sales!FromDate) And (([Purchase Journal].Job)=Forms!Sales!JobName));
```
### DesignRateSubForm Query
```sql
SELECT [MIS Personnel].Employee, [MIS Personnel].DesignRate, [MIS Personnel].TerminationDate

FROM [MIS Personnel]

WHERE ((([MIS Personnel].TerminationDate) Is Null) AND ((InStr([Text2],"Partner")<>0 Or InStr([Text2],"Project")<>0 Or InStr([Text2],"Engineer")<>0)=True) AND (([MIS Personnel].Closed)=False))

ORDER BY [MIS Personnel].Employee;
```
### DesignSubForm Query
```sql
SELECT [MIS Hours].Date, [MIS Hours].Employee, Sum([MIS Hours].Hours) AS SumOfHours, [Invoice Report Payments Total].ID, Min([>Design Rate].DesignRate) AS MinOfDesignRate, [Invoice Report Payments Total].SumOfAmount, [Invoice Report Design Invoices Total].SumOfInvoiceAmount, [SumofHours]*[MinofDesignRate] AS DesignCost

FROM (([MIS Hours] LEFT JOIN [>Design Rate] ON [MIS Hours].Employee=[>Design Rate].Designer) LEFT JOIN [Invoice Report Payments Total] ON [MIS Hours].[Job ID]=[Invoice Report Pay...
```
### DesignSubFormCurrentbyRate Query
```sql
SELECT Sum([Hours]*[DesignRate]) AS CurrentDesignCost, [>Jobs].Key

FROM [>Jobs] LEFT JOIN ([MIS Hours] LEFT JOIN [>Design Rate] ON [MIS Hours].Employee=[>Design Rate].Designer) ON [>Jobs].Key=[MIS Hours].[Job ID]

WHERE ((([MIS Hours].Date)>=Forms!Sales!FromDate And ([MIS Hours].Date)<=Forms!Sales!ToDate))

GROUP BY [>Jobs].Key

HAVING ((([>Jobs].Key)=forms!Sales!thejobname));
```
### DesignSubFormPreviousbyRate Query
```sql
SELECT Sum([Hours]*[DesignRate]) AS PreviousDesignCost, [>Jobs].Key, Min([MIS Hours].Date) AS PreviousDate

FROM [>Jobs] LEFT JOIN ([MIS Hours] LEFT JOIN [>Design Rate] ON [MIS Hours].Employee=[>Design Rate].Designer) ON [>Jobs].Key=[MIS Hours].[Job ID]

WHERE ((([MIS Hours].Date)<Forms!Sales!FromDate))

GROUP BY [>Jobs].Key

HAVING ((([>Jobs].Key)=forms!Sales!thejobname));
```
### DesignSubFormTotal Query
```sql
SELECT Sum([DesignSubForm Query].DesignCost) AS SumOfDesignCost

FROM [DesignSubForm Query];
```
### DesignSubFormbyRate Query
```sql
SELECT Sum([MIS Hours].Hours) AS SumOfHours, [DesignSubFormCurrentbyRate Query].CurrentDesignCost, [DesignSubFormPreviousbyRate Query].PreviousDesignCost, Min([DesignSubFormPreviousbyRate Query].PreviousDate) AS MinofDate, [Invoice Report Payments Total].ID, [Invoice Report Payments Total].SumOfAmount, [Invoice Report Design Invoices Total].SumOfInvoiceAmount, IIf([Date]>=Forms!Sales!FromDate And [Date]<=Forms!Sales!toDate,"Current Period","Previous Periods") AS ThePeriod, Previousday(Forms!Sale...
```
### DesignSubFormbyWeek Query
```sql
SELECT [MIS Hours].Date, [MIS Hours].Employee, Sum([MIS Hours].Hours) AS SumOfHours, [MIS Hours].DesignNote, [DesignSubFormCurrentbyRate Query].CurrentDesignCost, [DesignSubFormPreviousbyRate Query].PreviousDesignCost, Min([DesignSubFormPreviousbyRate Query].PreviousDate) AS MinofDate, IIf([Date]>=Forms!Sales!FromDate And [Date]<=Forms!Sales!toDate,"Current Period","Previous Periods") AS ThePeriod, Previousday(Forms!Sales!fromdate) AS maxofdate, [MIS Hours].Archive, [>Design Rate].DesignRate, [M...
```
### GLReceiptsQuery
```sql
SELECT DISTINCTROW [>Jobs].Closed, [>Jobs].Estimate, [>Jobs].ID, [>Jobs].Key, Sum([General Ledger].CreditAmount) AS SumOfCreditAmount, Sum([General Ledger].DebitAmount) AS SumOfDebitAmount, Sum(-[DebitAmount]+[CreditAmount]) AS SumofAmount

FROM [>Jobs] LEFT JOIN [General Ledger] ON [>Jobs].Key=[General Ledger].Job

WHERE ((([General Ledger].AccountNumber)=121 Or ([General Ledger].AccountNumber)=123) AND (([SourceJournal]="Receipt" Or [SourceJournal]="Purchase" And [SourceTransaction]="Refund")=...
```
### GLReceivableQuery
```sql
SELECT DISTINCTROW GLSalesQuery.[>Jobs].ID, GLSalesQuery.MaxOfDue, GLSalesQuery.SumOfInvoiceAmount, GLReceiptsQuery.SumofAmount, GLSalesQuery.[>Resources].ID, [MIS Personnel].Employee, [>Jobs].ManagedBy, [>Jobs].SpecifiedBy, IIf(Date()-[MaxofDue]>30 And NNEZ([SumofInvoiceAmount])-NNEZ([SumofAmount])>0,NNEZ([SumofInvoiceAmount])-NNEZ([SumofAmount]),0) AS Over30, IIf(Date()-[MaxofDue]<=30 And NNEZ([SumofInvoiceAmount])-NNEZ([SumofAmount])>0,NNEZ([SumofInvoiceAmount])-NNEZ([SumofAmount]),0) AS [Cur...
```
### GLSalesQuery
```sql
SELECT DISTINCTROW [>Jobs].ID, Max([Sales Journal].Due) AS MaxOfDue, Sum([Sales Journal].InvoiceAmount) AS SumOfInvoiceAmount, [>Resources].ID, [>Jobs].Key

FROM ([Sales Journal] RIGHT JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key) LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key

WHERE ((([Sales Journal].Due) Is Not Null))

GROUP BY [>Jobs].ID, [>Resources].ID, [>Jobs].Key, [>Jobs].Closed, [>Jobs].Estimate

HAVING ((([>Jobs].Closed)=False) AND (([>Jobs].Estimate)=False))

ORDER BY ...
```
### Guide Query
```sql
SELECT DISTINCTROW Guide.Name AS Expr1, Guide.Category AS Expr2, Guide.Key AS Expr3, Guide.Sequence AS Expr4, Guide.Purpose AS Expr5, Guide.Synopsis AS Expr6, Guide.Description AS Expr7, Guide.Examples AS Expr8, Guide.Limitations AS Expr9, Guide.Algorithm AS Expr10, Guide.SeeAlso AS Expr11, Guide.References AS Expr12

FROM Guide

ORDER BY Guide.Category, Guide.Name;
```
### Hours Glitch 2
```sql
SELECT [MIS Hours].*, *

FROM [MIS Hours]

WHERE ((([MIS Hours].JobHour)=True) AND (([MIS Hours].Activity) Is Null))

ORDER BY [MIS Hours].Date DESC;
```
### Hours Glitch 3
```sql
SELECT [MIS Hours].*, *

FROM [MIS Hours]

WHERE ((([MIS Hours].GeneralHour)=True) AND (([MIS Hours].General) Is Null))

ORDER BY [MIS Hours].Date DESC;
```
### Hours Glitch 4
```sql
SELECT [MIS Hours].*, [MIS Personnel].Employee, *

FROM [MIS Hours] INNER JOIN [MIS Personnel] ON [MIS Hours].ADPFile=[MIS Personnel].ADPFile

WHERE ((([MIS Personnel].Employee)="Monkevich") AND (([MIS Hours].Date)=#12/19/2011#))

ORDER BY [MIS Hours].Date DESC;
```
### Hours Glitch Good MIS
```sql
SELECT [MIS Hours1].*, *

FROM [MIS Hours1], [MIS Personnel]

ORDER BY [MIS Hours1].Date DESC , [MIS Personnel].Employee DESC;
```
### Hours Glitch Job Hour
```sql
SELECT [MIS Hours].*, *

FROM [MIS Hours]

WHERE ((([MIS Hours].JobHour)=True) AND (([MIS Hours].[Job ID]) Is Null Or ([MIS Hours].[Job ID])=0))

ORDER BY [MIS Hours].Date DESC;
```
### Hours Glitch MIS Hours
```sql
SELECT [MIS Hours].*, [MIS Hours].Date, [MIS Personnel].Employee, *

FROM [MIS Hours] LEFT JOIN [MIS Personnel] ON [MIS Hours].ADPFile=[MIS Personnel].ADPFile

ORDER BY [MIS Hours].Date DESC , [MIS Personnel].Employee DESC;
```
### Hours Glitch Missing Record
```sql
SELECT [MIS Hours1].*, *

FROM [MIS Hours], [MIS Hours1], [MIS Personnel]

WHERE ((([MIS Hours1].Cost)<>0) And (([MIS Hours].Key) Is Null))

ORDER BY [MIS Hours1].Date DESC , [MIS Personnel].Employee DESC;
```
### Hours glitch
```sql
SELECT [MIS Hours].Date, [MIS Hours].Activity, [MIS Hours].[Job ID], [MIS Hours].Charge, [MIS Hours].General, [MIS Hours].Employee, [MIS Hours].Hours, [MIS Hours].Journal, [MIS Hours].GeneralHour, [MIS Hours].JobHour

FROM [MIS Hours]

WHERE ((([Job ID]<>0 And [General]<>"" Or [date]>#1/8/2012# And [GeneralHour]=False And [Jobhour]=False)=True))

ORDER BY [MIS Hours].Date DESC , [MIS Hours].Activity;
```
### HoursByEmployeeWeekLockedQuery
```sql
SELECT DISTINCTROW [MIS Hours].Employee, [MIS Hours].Date, Sum([MIS Hours].Hours) AS SumOfHours, Sum([MIS Hours].Monday) AS SumOfMonday, Sum([MIS Hours].Tuesday) AS SumOfTuesday, Sum([MIS Hours].Wednesday) AS SumOfWednesday, Sum([MIS Hours].Thursday) AS SumOfThursday, Sum([MIS Hours].Friday) AS SumOfFriday, Sum([MIS Hours].Saturday) AS SumOfSaturday, Sum([MIS Hours].Sunday) AS SumOfSunday

FROM [MIS Hours]

GROUP BY [MIS Hours].Employee, [MIS Hours].Date

HAVING ((([MIS Hours].Employee)=Forms!Ho...
```
### HoursByEmployeeWeekQuery
```sql
SELECT DISTINCTROW [MIS Hours].Employee, [MIS Hours].Date, Sum([MIS Hours].Hours) AS SumOfHours, Sum([MIS Hours].Monday) AS SumOfMonday, Sum([MIS Hours].Tuesday) AS SumOfTuesday, Sum([MIS Hours].Wednesday) AS SumOfWednesday, Sum([MIS Hours].Thursday) AS SumOfThursday, Sum([MIS Hours].Friday) AS SumOfFriday, Sum([MIS Hours].Saturday) AS SumOfSaturday, Sum([MIS Hours].Sunday) AS SumOfSunday, IIf(nnen([activity])<>"" Or nnen([General])<>"",True,False) AS Expr1

FROM [MIS Hours]

GROUP BY [MIS Hours...
```
### HoursByGeneralLockedQuery
```sql
SELECT DISTINCTROW [MIS Hours].Employee, [MIS Hours].Date, [MIS Hours].General, [MIS Hours].EntryDate AS Expr1, [MIS Hours].ADPFile, [MIS Hours].Archive, [MIS Hours].Hours, [MIS Hours].Rate, [MIS Hours].Cost, [MIS Hours].Monday, [MIS Hours].Tuesday, [MIS Hours].Wednesday, [MIS Hours].Thursday, [MIS Hours].Friday, [MIS Hours].Saturday, [MIS Hours].Sunday, [MIS Hours].Key, [MIS Hours].[Job ID]

FROM [MIS Hours]

WHERE ((([MIS Hours].Employee)=Forms!HoursEntryLocked!EmpName) And (([MIS Hours].Date)...
```
### HoursByGeneralQuery
```sql
SELECT DISTINCTROW [MIS Hours].Employee, [MIS Hours].Date, [MIS Hours].Archive AS Expr1, [MIS Hours].EntryDate AS Expr2, [MIS Hours].[Job ID], [MIS Hours].Activity, [MIS Hours].Charge, [MIS Hours].DesignNote, [MIS Hours].Journal, [MIS Hours].ADPFile, [MIS Hours].General, [MIS Hours].GeneralHour, [MIS Hours].JobHour, [MIS Hours].Hours, [MIS Hours].Rate, [MIS Hours].MondayNote, [MIS Hours].TuesdayNote, [MIS Hours].WednesdayNote, [MIS Hours].ThursdayNote, [MIS Hours].FridayNote, [MIS Hours].Saturda...
```
### HoursByJobLockedQuery
```sql
SELECT DISTINCTROW [MIS Hours].Employee, [MIS Hours].Date, [MIS Hours].[Job ID], [MIS Hours].Activity, [MIS Hours].Archive, [MIS Hours].ADPFile, [MIS Hours].EntryDate AS Expr1, [MIS Hours].Charge, [MIS Hours].Hours, [MIS Hours].Rate, [MIS Hours].Cost, [MIS Hours].Monday, [MIS Hours].Tuesday, [MIS Hours].Wednesday, [MIS Hours].Thursday, [MIS Hours].Friday, [MIS Hours].Saturday, [MIS Hours].Sunday, [MIS Hours].Key

FROM [MIS Hours] LEFT JOIN [>Jobs] ON [MIS Hours].[Job ID]=[>Jobs].Key

WHERE ((([M...
```
### HoursByJobQuery
```sql
SELECT DISTINCTROW [MIS Hours].Employee, [MIS Hours].Date, [MIS Hours].[Job ID], [MIS Hours].Activity, [MIS Hours].DesignNote, [>Jobs].Archive, [MIS Hours].EntryDate AS Expr1, [MIS Hours].Journal, [MIS Hours].GeneralHour, [MIS Hours].JobHour, [MIS Hours].Charge, [MIS Hours].Hours, [MIS Hours].SaturdayNote, [MIS Hours].SundayNote, [MIS Hours].MondayNote, [MIS Hours].TuesdayNote, [MIS Hours].WednesdayNote, [MIS Hours].ThursdayNote, [MIS Hours].FridayNote, [MIS Hours].Rate, [MIS Hours].Cost, [MIS H...
```
### HoursToPayQuery
```sql
SELECT DISTINCTROW [MIS Hours].Employee, [MIS Hours].Date, [MIS Hours].ADPHoursCode, [MIS Hours].ADPHours, [MIS Hours].ADPFile, [MIS Hours].Key

FROM [MIS Hours]

WHERE ((([MIS Hours].Employee)=Forms!HoursEntry.EmpName) And (([MIS Hours].Date)=Forms!HoursEntry.Week) And (([MIS Hours].ADPHoursCode) Is Not Null));
```
### Invoice Report Additional
```sql
SELECT [Sales Journal].Key, IIf(NNEN([Sales Journal]!PrivateNote)="",[Sales Journal]!Category,[Sales Journal]!PrivateNote) & IIf(NNEN([InvoiceNote_1])<>"",", " & [InvoiceNote_1],"") AS InvoiceNote, IIf(NNEN([Sales Journal_1]!PrivateNote)="",[Sales Journal_1]!Category,[Sales Journal_1]!PrivateNote) AS InvoiceNote_1, NNez([Sales Journal].SaleAmount)+NNEZ([Sales Journal_1].SaleAmount) AS Sale_Amount, [Sales Journal_1].SaleAmount, [>Jobs].ID, [Sales Journal].InvoiceNumber, [Sales Journal].Job, NNEZ(...
```
### Invoice Report Agreement
```sql
SELECT [Sales Journal].Key, [>Jobs].ID, IIf([Sales Journal]!Category="Cabinet","Cabinetry",[Sales Journal]!Category) AS TheCategory, IIf(NNEN([Sales Journal]!PrivateNote)="",[TheCategory],[Sales Journal]!PrivateNote) & IIf(NNEN([InvoiceNote_1])<>""," and " & [InvoiceNote_1],"") AS InvoiceNote, IIf(NNEN([Sales Journal_1]!PrivateNote)="",[Sales Journal_1]!Category,[Sales Journal_1]!PrivateNote) AS InvoiceNote_1, [Sales Journal].SaleAmount+NNEZ([Sales Journal_1].SaleAmount) AS Sale_Amount, [Sales J...
```
### Invoice Report Design Invoices Total
```sql
SELECT Sum([Sales Journal].InvoiceAmount) AS SumOfInvoiceAmount, [Sales Journal].Job

FROM [Sales Journal]

WHERE ((([Sales Journal].Due) Is Not Null))

GROUP BY [Sales Journal].Job

HAVING (((Sum([Sales Journal].InvoiceAmount))<>0) And (([Sales Journal].Job)=Forms!Sales!TheJobName));
```
### Invoice Report Invoices
```sql
SELECT IIf(NNEN([PrivateNote])="",[Description],[PrivateNote]) & IIf([Parent]," " & [ID],"") AS InvoiceNote, [Sales Journal].InvoiceAmount, [Sales Journal].InvoiceNumber, [Sales Journal].Job, [>Jobs].ID, [Sales Journal].Due

FROM [>Jobs] LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job

GROUP BY IIf(NNEN([PrivateNote])="",[Description],[PrivateNote]) & IIf([Parent]," " & [ID],""), [Sales Journal].InvoiceAmount, [Sales Journal].InvoiceNumber, [Sales Journal].Job, [>Jobs].ID, [Sales Jo...
```
### Invoice Report Invoices Total
```sql
SELECT Sum([Sales Journal].InvoiceAmount) AS SumOfInvoiceAmount, [Sales Journal].Job

FROM [Sales Journal]

WHERE ((([Sales Journal].Due) Is Not Null))

GROUP BY [Sales Journal].Job

HAVING (((Sum([Sales Journal].InvoiceAmount))<>0) And (([Sales Journal].Job)=forms!Sales!thejobname));
```
### Invoice Report Payments
```sql
SELECT [Receipts Journal].Amount, [Receipts Journal].Job, IIf([Parent],[>jobs].ID,"") AS JobID, [Receipts Journal].CheckDate, [>Resources].ID

FROM ([>Jobs] LEFT JOIN [Receipts Journal] ON [>Jobs].Key=[Receipts Journal].Job) LEFT JOIN [>Resources] ON [>Jobs].Agreement=[>Resources].Key

WHERE ((([Receipts Journal].Amount)<>0) And ((IIf(Not forms!Sales!Family And [Receipts Journal].Job=forms!Sales!Jobname,True,IIf(forms!Sales!Family And [Parent]=Forms!Sales!JobName Or forms!Sales!Family And [Recei...
```
### Invoice Report Payments Total
```sql
SELECT [>Jobs].ID, Sum([Receipts Journal].Amount) AS SumOfAmount, [Receipts Journal].Job

FROM [>Jobs] LEFT JOIN [Receipts Journal] ON [>Jobs].Key=[Receipts Journal].Job

GROUP BY [>Jobs].ID, [Receipts Journal].Job

HAVING (((Sum([Receipts Journal].Amount))<>0))

ORDER BY [>Jobs].ID;
```
### Invoice Report Query
```sql
SELECT [>Jobs].ID, [Sales Journal].Note, [Sales Journal].Job

FROM [>Jobs] LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job

GROUP BY [>Jobs].ID, [Sales Journal].Note, [Sales Journal].Job, [>Jobs].Key

HAVING ((([>Jobs].Key)=forms!Sales!Jobname));
```
### Invoice Report Refunds
```sql
SELECT [Cash Disbursements Journal].CheckDate, [Cash Disbursements Journal].DebitAmount, [Cash Disbursements Journal].Job, [>Resources].ID, [Cash Disbursements Journal].Void

FROM ([Cash Disbursements Journal] INNER JOIN [Receipts Journal] ON ([Cash Disbursements Journal].Job=[Receipts Journal].Job) AND ([Cash Disbursements Journal].SupplierID=[Receipts Journal].Payor)) INNER JOIN [>Resources] ON [Cash Disbursements Journal].SupplierID=[>Resources].Key

GROUP BY [Cash Disbursements Journal].Chec...
```
### Invoice Report Terms
```sql
SELECT IIf(NNEN([PrivateNote])="",[Description],[PrivateNote]) AS InvoiceNote, [Sales Journal].InvoiceAmount, [Sales Journal].InvoiceNumber, [>Jobs].ID, [Sales Journal].Job

FROM [>Jobs] LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job

WHERE ((([Sales Journal].InvoiceAmount)<>0) And ((IIf(Not forms!Sales!Family And [Sales Journal].Job=forms!Sales!Jobname,True,IIf(forms!Sales!Family And [Parent]=Forms!Sales!JobName Or forms!Sales!Family And [Sales Journal].Job=Forms!Sales!JobName,Tru...
```
### Job Agreement Sales
```sql
SELECT [>Jobs].ID, [>Jobs].Key, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount

FROM [>Jobs] LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job

WHERE ((([>Jobs].Estimate)=False))

GROUP BY [>Jobs].ID, [>Jobs].Key

HAVING (((Sum([Sales Journal].SaleAmount))<>0))

ORDER BY [>Jobs].ID;
```
### Job Agreement Sales NIC Stone
```sql
SELECT [>Jobs].ID, [>Jobs].Key, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount, Last([Sales Journal].TheDate) AS LastOfTheDate

FROM [>Jobs] LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job

WHERE ((([>Jobs].Estimate)=False) And ((IIf(InStr([Sales Journal].Category,'Stone')=0,True,False))=True))

GROUP BY [>Jobs].ID, [>Jobs].Key

HAVING (((Sum([Sales Journal].SaleAmount))>0))

ORDER BY [>Jobs].ID;
```
### Job Audit Report Job Query
```sql
SELECT;
```
### Job Cabinet Hours
```sql
SELECT [>Jobs].ID, [>Jobs].Key, Sum([MIS Hours].Hours) AS SumOfHours, Sum([MIS Hours].Cost) AS SumOfCost, [SumofHours]*Variable("ShopOH")+[SumofCost] AS TotalCost

FROM [>Jobs] LEFT JOIN [MIS Hours] ON [>Jobs].Key=[MIS Hours].[Job ID]

WHERE (((InStr([MIS Hours].Charge,"Cabinet")<>0)=True) And (([>Jobs].Estimate)=False))

GROUP BY [>Jobs].ID, [>Jobs].Key

ORDER BY [>Jobs].ID;
```
### Job Cabinet and Counter Agreement
```sql
SELECT [>Jobs].ID, [>Jobs].Key, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount

FROM [>Jobs] LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job

WHERE (((InStr([Sales Journal].Category,"Cabinet")<>0 Or InStr([Sales Journal].Category,"Counter")<>0)=True) And ((InStr([Sales Journal].Category,"Stone")<>0)=False) And (([>Jobs].Estimate)=False))

GROUP BY [>Jobs].ID, [>Jobs].Key

ORDER BY [>Jobs].ID;
```
### Job Cabinet and Counter Sales
```sql
SELECT [>Jobs].ID, [>Jobs].Key, Last([Sales Journal].TheDate) AS LastOfTheDate, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount

FROM [>Jobs] LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job

WHERE (((InStr([Sales Journal].Category,"Cabinet")<>0 Or InStr([Sales Journal].Category,"Counter")<>0)=True) And ((InStr([Sales Journal].Category,"Stone")<>0)=False) And (([>Jobs].Estimate)=False))

GROUP BY [>Jobs].ID, [>Jobs].Key

HAVING (((Last([Sales Journal].TheDate))>#12/31/1999#))

ORD...
```
### Job Estimated $
```sql
SELECT [>Jobs].Key, Format(nnez([EstimatedPM])+nnez([EstimatedSpec])+nnez([estimatedOther])+nnez([estimatedmaterial])+nnez([estimatedsolidlumber])+nnez([estimatedveneer])+nnez([estimatedspecial])+nnez([estimatedshopstaff])+nnez([estimatedfinish])+nnez([estimatedassembly])+nnez([estimatedinstallstaff])+nnez([estimateddriving])+nnez([estimatedcontract])+nnez([estimatedofficestaff]),"#,#") AS [Estimated $]

FROM [>Jobs]

WHERE ((([>Jobs].ID) Is Not Null));
```
### Job Install Hours
```sql
SELECT [>Jobs].ID, [>Jobs].Key, Sum([MIS Hours].Hours) AS SumOfHours, Sum([MIS Hours].Cost) AS SumOfCost, [SumofHours]*Variable("ShopOH")+[SumofCost] AS TotalCost

FROM [>Jobs] LEFT JOIN [MIS Hours] ON [>Jobs].Key=[MIS Hours].[Job ID]

WHERE (((InStr([MIS Hours].Charge,"Install")<>0)=True) And (([>Jobs].Estimate)=False))

GROUP BY [>Jobs].ID, [>Jobs].Key

HAVING (((Last([MIS Hours].Date))>#12/31/1999#))

ORDER BY [>Jobs].ID;
```
### Job Install Sales
```sql
SELECT [>Jobs].ID, [>Jobs].Key, Last([Sales Journal].TheDate) AS LastOfTheDate, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount

FROM [>Jobs] LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job

WHERE (((InStr([Sales Journal].Category,"Install")<>0)=True) And (([>Jobs].Estimate)=False))

GROUP BY [>Jobs].ID, [>Jobs].Key

HAVING (((Last([Sales Journal].TheDate))>#12/31/1999#))

ORDER BY [>Jobs].ID;
```
### Job Other Sales
```sql
SELECT [>Jobs].ID, [>Jobs].Key, Last([Sales Journal].TheDate) AS LastOfTheDate, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount

FROM [>Jobs] LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job

WHERE (((InStr([Sales Journal].Category,"Install")<>0 Or InStr([Sales Journal].Category,"Cabinet")<>0 Or InStr([Sales Journal].Category,"Counter")<>0)=False) And ((InStr([Sales Journal].Category,"Stone")<>0)=False) And (([>Jobs].Estimate)=False))

GROUP BY [>Jobs].ID, [>Jobs].Key

HAVING (((L...
```
### Job Parents
```sql
SELECT DISTINCTROW [>Jobs].Key, [>Jobs].ID

FROM [>Jobs]

WHERE ((([>Jobs].Key)<>Forms!Sales!Jobname) And (([>Jobs].Family)=True))

ORDER BY [>Jobs].ID;
```
### Job Production
```sql
SELECT [MIS Personnel].Employee, [>Jobs].ID, [>Jobs].ProductionPhase, [Job Cabinet and Counter Sales].LastOfTheDate, [Job Agreement Sales].SumOfSaleAmount, [Job Cabinet and Counter Sales].SumOfSaleAmount, [Job Stone Sales].SumOfSaleAmount, [Job Install Sales].SumOfSaleAmount, [Job Other Sales].SumOfSaleAmount, [Job Project Hours].SumOfHours, [Job Project Hours].SumOfCost, [Job Cabinet Hours].SumOfHours, [Job Cabinet Hours].SumOfCost, [Job Install Hours].SumOfHours, [Job Install Hours].SumOfCost,...
```
### Job Profit Report Job Query
```sql
SELECT DISTINCTROW [>Jobs].ID, [>Jobs].Key, [>Jobs].Info1, Last([Sales Journal].TheDate) AS LastOfTheDate1, Max([MIS Personnel].Employee) AS Partner, Max([MIS Personnel_1].Employee) AS Manager, [>Jobs].Completed, [>Jobs].SpecifiedBy, [>Jobs].ManagedBy, [Job Agreement Sales].SumOfSaleAmount, [Job Cabinet and Counter Sales].SumOfSaleAmount, [Job Install Sales].SumOfSaleAmount, [Job Project Hours].TotalCost, [Job Cabinet Hours].TotalCost, [Job Install Hours].TotalCost, IIf(NNEZ([Job Cabinet and Cou...
```
### Job Project Hours
```sql
SELECT [>Jobs].ID, [>Jobs].Key, [>Jobs].DesignOH, Sum([MIS Hours].Hours) AS SumOfHours, Sum([MIS Hours].Cost) AS SumOfCost, IIf(nnez([>Jobs]!DesignOH)=0,[SumofHours]*Variable("Design OH")+[SumofCost],[SumofHours]*[>Jobs]!DesignOH+[SumofCost]) AS TotalCost

FROM [>Jobs] LEFT JOIN [MIS Hours] ON [>Jobs].Key=[MIS Hours].[Job ID]

WHERE (((InStr([MIS Hours].Charge,"Project")<>0)=True) And (([>Jobs].Estimate)=False))

GROUP BY [>Jobs].ID, [>Jobs].Key, [>Jobs].DesignOH

ORDER BY [>Jobs].ID;
```
### Job Stone Sales
```sql
SELECT [>Jobs].ID, [>Jobs].Key, Last([Sales Journal].TheDate) AS LastOfTheDate, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount

FROM [>Jobs] LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job

WHERE (((InStr([Sales Journal].Category,"Stone")<>0)=True) And (([>Jobs].Estimate)=False))

GROUP BY [>Jobs].ID, [>Jobs].Key

HAVING (((Last([Sales Journal].TheDate))>#12/31/1999#))

ORDER BY [>Jobs].ID;
```
### JobEstimatedListCost
```sql
SELECT [>Product Lists].Job, Sum([>Product List].TotalCost) AS SumOfTotalCost, Sum([>Product List].PremiumCost) AS SumOfPremiumCost

FROM [>Product Lists] INNER JOIN [>Product List] ON [>Product Lists].Key = [>Product List].ProductListKey

GROUP BY [>Product Lists].Job

HAVING ((([>Product Lists].Job)=[forms]![ProductListMaster].[ProductListControl]![JobName]));
```
### JobEstimatedOfficeCost
```sql
SELECT Estimates.Job, Sum(Estimates.[11]) AS SumOf11, Sum(Estimates.[11Cost]) AS SumOf11Cost, Sum(Estimates.[12]) AS SumOf12, Sum(Estimates.[12Cost]) AS SumOf12Cost

FROM Estimates

GROUP BY Estimates.Job

HAVING (((Estimates.Job)=[forms]![ProductListMaster].[ProductListControl]![JobName]));
```
### JobEstimatedVariables
```sql
SELECT [>Jobs].Key, [>Jobs].Margin, [>Jobs].DesignEstCost, [>Jobs].ShopEstCost, [>Jobs].InstallEstCost

FROM [>Jobs]

WHERE ((([>Jobs].Key)=[forms]![ProductListMaster].[ProductListControl]![JobName]));
```
### Jobs Query
```sql
SELECT [>Jobs].*, [>Resources].ID

FROM [>Jobs] LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key

ORDER BY [>Jobs].Estimate DESC , [>Jobs].Closed DESC , [>Jobs].ID;
```
### MIS General Entry Query
```sql
SELECT DISTINCTROW [MIS Hours].[Job ID], [MIS Hours].Date, [MIS Hours].Employee, [MIS Hours].Activity, [MIS Hours].General, [MIS Hours].Hours, [MIS Hours].Cost, [MIS Hours].Rate, [MIS Hours].Charge

FROM [MIS Hours]

WHERE ((([MIS Hours].[Job ID]) Is Null Or ([MIS Hours].[Job ID])=0) And (([MIS Hours].Date)=Forms!MISHoursEntry!Week) And (([MIS Hours].Employee)=Forms!MISHoursEntry!EmpName));
```
### MIS Hours Architect Design Cabinet Cost
```sql
SELECT [>Resources].ID, [>Resources].Key, Sum([>Sales Total].SumOfSaleAmount) AS SumOfSumOfSaleAmount, Sum([MIS Hours Job Cabinet Cost].SumOfCost) AS SumOfSumOfCost, Sum([MIS Hours Job Design Cost].SumOfCost) AS SumOfSumOfCost1

FROM ([>Resources] INNER JOIN ((([>Jobs] LEFT JOIN [MIS Hours Job Cabinet Cost] ON [>Jobs].Key=[MIS Hours Job Cabinet Cost].[Job ID]) LEFT JOIN [MIS Hours Job Design Cost] ON [>Jobs].Key=[MIS Hours Job Design Cost].[Job ID]) LEFT JOIN [>Sales Total Cabinets] ON [>Jobs].K...
```
### MIS Hours Charge Query
```sql
SELECT DISTINCTROW [>Settings].JobActiviy AS Expr1, [>Settings].JobActivityCharge

FROM [>Settings]

WHERE ((([>Settings].JobActiviy)=Forms!MISHoursEntry.Activity));
```
### MIS Hours Contractor Design Cabinet Cost
```sql
SELECT [>Resources].ID, [>Resources].Key, Sum([>Sales Total].SumOfSaleAmount) AS SumOfSumOfSaleAmount, Sum([MIS Hours Job Cabinet Cost].SumOfCost) AS SumOfSumOfCost, Sum([MIS Hours Job Design Cost].SumOfCost) AS SumOfSumOfCost1

FROM [>Resources] INNER JOIN (((([>Jobs] LEFT JOIN [MIS Hours Job Cabinet Cost] ON [>Jobs].Key=[MIS Hours Job Cabinet Cost].[Job ID]) LEFT JOIN [MIS Hours Job Design Cost] ON [>Jobs].Key=[MIS Hours Job Design Cost].[Job ID]) LEFT JOIN [>Sales Total Cabinets] ON [>Jobs].K...
```
### MIS Hours Dates
```sql
SELECT DISTINCTROW [MIS Hours].Date

FROM [MIS Hours]

GROUP BY [MIS Hours].Date

ORDER BY [MIS Hours].Date DESC;
```
### MIS Hours Entry Query
```sql
SELECT DISTINCTROW [MIS Hours].[Job ID], [MIS Hours].Date, [MIS Hours].Employee, [MIS Hours].Activity, [MIS Hours].Hours, [MIS Hours].Charge, [MIS Hours].Cost, [MIS Hours].Rate

FROM [MIS Hours]

WHERE ((([MIS Hours].[Job ID])=Forms!MISHoursEntry!JobName) And (([MIS Hours].Date)=Forms!MISHoursEntry!Week) And (([MIS Hours].Employee)=Forms!MISHoursEntry!EmpName) And (([MIS Hours].Activity) Is Not Null));
```
### MIS Hours Interior Designer Design Cabinet Cost
```sql
SELECT [>Resources].ID, [>Resources].Key, Sum([>Sales Total].SumOfSaleAmount) AS SumOfSumOfSaleAmount, Sum([MIS Hours Job Cabinet Cost].SumOfCost) AS SumOfSumOfCost, Sum([MIS Hours Job Design Cost].SumOfCost) AS SumOfSumOfCost1

FROM [>Resources] INNER JOIN (((([>Jobs] LEFT JOIN [MIS Hours Job Cabinet Cost] ON [>Jobs].Key=[MIS Hours Job Cabinet Cost].[Job ID]) LEFT JOIN [MIS Hours Job Design Cost] ON [>Jobs].Key=[MIS Hours Job Design Cost].[Job ID]) LEFT JOIN [>Sales Total Cabinets] ON [>Jobs].K...
```
### MIS Hours Job Cabinet Cost
```sql
SELECT [MIS Hours].[Job ID], Sum([MIS Hours].Cost) AS SumOfCost

FROM [MIS Hours]

WHERE (((InStr([Charge],"Cabinet"))<>0) AND ((InStr([Activity],"Design"))=0))

GROUP BY [MIS Hours].[Job ID]

ORDER BY [MIS Hours].[Job ID];
```
### MIS Hours Job Design Cost
```sql
SELECT [MIS Hours].[Job ID], Sum([MIS Hours].Cost) AS SumOfCost

FROM [MIS Hours]

WHERE (((InStr([activity],"Design"))<>0))

GROUP BY [MIS Hours].[Job ID]

ORDER BY [MIS Hours].[Job ID];
```
### MIS Job Costs Query
```sql
SELECT DISTINCTROW [MIS Hours].[Job ID], [>Jobs].ID, [MIS Hours].Charge, [MIS Hours].Activity, Sum([MIS Hours].Hours) AS SumOfHours, Sum([MIS Hours].Cost) AS SumOfCost, [MIS Contracts].Order AS Expr1, First([MIS Contracts].Amount) AS FirstOfAmount, [>Jobs].Delivered, First([MIS Contracts].[Materials Cost]) AS [FirstOfMaterials Cost]

FROM [MIS Contracts], [MIS Hours] LEFT JOIN [>Jobs] ON [MIS Hours].[Job ID] = [>Jobs].Key

GROUP BY [MIS Hours].[Job ID], [>Jobs].ID, [MIS Hours].Charge, [MIS Hours...
```
### MIS Jobs Query
```sql
SELECT DISTINCTROW [>Jobs].ID, [>Jobs].Key, [>Jobs].Delivered, [>Jobs].Estimate

FROM [>Jobs]

WHERE ((([>Jobs].ID) Is Not Null) AND (([>Jobs].Estimate)=False) AND (([>Jobs].Closed)=False))

ORDER BY [>Jobs].ID;
```
### MIS Material Costs Query
```sql
SELECT DISTINCTROW [>Jobs].Key, [MIS Material Costs].Order AS Expr1, [MIS Material Costs].Materials AS Expr2

FROM [>Jobs], [MIS Material Costs]

WHERE ((([>Jobs].Key)=Forms!Jobs.JobName));
```
### MemoSubFormQuery
```sql
SELECT DISTINCTROW [>Jobs].memo

FROM [>Jobs]

WHERE ((([>Jobs].Key)=Forms!Sales.JobName))

ORDER BY [>Jobs].memo;
```
### PremiumAttachmentQuery
```sql
SELECT DISTINCTROW [>Correspondence].Name, [>Correspondence].Correspondence, [>Correspondence].Key, [>Correspondence].ID, [>Correspondence].Date, [>Correspondence].UserName, [>Correspondence].PrimaryKey, [>Correspondence].Description

FROM [>Correspondence]

WHERE ((([>Correspondence].Name)=forms!ProductListMaster.Form.ProductListControl!Key) And (([>Correspondence].Description)="ProductList"));
```
### PremiumQuery
```sql
SELECT DISTINCTROW [>Product List Whole Query].[>Product List].Key, [>Product List Whole Query].Spreadsheet, [>Product List Whole Query].EstimateOfficeRate, [>Product List Whole Query].EstimateShopRate, [>Product List Whole Query].EstimateInstallRate, [>Product List Whole Query].PremiumCost, [>Product List Whole Query].OfficeHours, [>Product Lists].Margin, [>Product List Whole Query].ShopHours, [>Product List Whole Query].FinishHours, [>Product List Whole Query].AssemblyHours, [>Product List Who...
```
### ProblemLogQuery
```sql
SELECT [>ProblemLog].*

FROM [>ProblemLog]

ORDER BY [>ProblemLog].Date, [>ProblemLog].ProblemType;
```
### Product List Whole Cost Query
```sql
SELECT DISTINCTROW Sum([>Product List].TotalCost) AS SumOfTotalCost, Sum([>Product List].PremiumCost) AS SumOfPremiumCost

FROM [>Product List]

GROUP BY [>Product List].ProductListKey

HAVING ((([>Product List].ProductListKey)=[Forms]![ProductListMaster]![ProductListControl]![ProductListName]))

WITH OWNERACCESS OPTION;
```
### Product List Whole Query
```sql
SELECT DISTINCTROW [>Product List].Item

FROM [>Product List]

WHERE ((([>Product List].ProductListKey)=[Forms]![ProductListMaster]![ProductListControl]![ProductListName]))

ORDER BY [>Product List].Item, [>Product List].Reference1

WITH OWNERACCESS OPTION;
```
### ProposalsQuery
```sql
SELECT Last([Sales Journal].Due) AS LastOfDue, Last([privateNote]) AS Expr2, [>Jobs].ID, [Sales Journal].Job, [Sales Journal].Description, [Sales Journal].Proposal

FROM [Sales Journal] LEFT JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key

GROUP BY [>Jobs].ID, [Sales Journal].Job, [Sales Journal].Description, [Sales Journal].Proposal, InStr([Sales Journal].Description,"Proposal")<>0

HAVING (((Last([privateNote])) Is Not Null) And ((InStr([Sales Journal].Description,"Proposal")<>0)=True))

ORDER...
```
### Query1
```sql
SELECT [>Product Lists].ProductList, [>Note].ID, [>Note].Note, [>Note].EntryDate

FROM ([>Product List] LEFT JOIN [>Product Lists] ON [>Product List].ProductListKey=[>Product Lists].Key) LEFT JOIN [>Note] ON [>Product List].Key=[>Note].ProductListKey

WHERE ((([>Note].ID)="Rework") AND (([>Note].EntryDate) Is Not Null))

ORDER BY [>Note].EntryDate DESC;
```
### Query10
```sql
SELECT [>Product List].Component, [>Product List].ComponentText, [>Product List].PremiumCost, [>Product List].Entry, [>Product List].OfficeHours, [>Product List].ShopHours, [>Product List].FinishHours, [>Product List].AssemblyHours, [>Product List].InstallHours, [>Product List].TotalCost, [>Product List].SpecialMaterials, [>Product List].Inventory, [>Product List].ShopCost, [>Product List].OfficeCost, IIf(IsNull([officehours]) And IsNull([shophours]) And IsNull([finishhours]) And IsNull([assembl...
```
### Query11
```sql
SELECT Estimates.[50], Estimates.[50Cost], Estimates.Import50, Estimates.[51], Estimates.[51Cost], Estimates.Import51, Estimates.[52], Estimates.[52Cost], Estimates.Import52, Estimates.[53], Estimates.[53Cost], Estimates.Import53, IIf(nnez(Estimates.[50])<>0 Or nnez(Estimates.[51])<>0,True,False) AS Expr1

FROM Estimates

WHERE (((IIf(nnez(Estimates.[50])<>0 Or nnez(Estimates.[51])<>0,True,False))=True));
```
### Query12
```sql
SELECT [>Product List].Activity50, [>Product List].Activity51, [>Product List].Activity52, [>Product List].Activity53

FROM [>Product List]

WHERE (((IIf(nnez([activity50])<>0 Or nnez([activity51])<>0,True,False))=True));
```
### Query13
```sql
SELECT [>Part List].*

FROM [>Part List]

WHERE ((([>Part List].ProductList)="2146973190"));
```
### Query14
```sql
SELECT [dbo_>Part List].*

FROM [dbo_>Part List]

WHERE ((([dbo_>Part List].ProductList)="2146973190"));
```
### Query15
```sql
SELECT nnez([ShopHours]) AS Shop, [>Product List Whole Query].Pieces, nne1([Pieces]) AS thePieces

FROM [>Product List Whole Query]

ORDER BY [>Product List Whole Query].Pieces;
```
### Query16
```sql
SELECT Sum([>Part List].ProcessActivityCost) AS SumOfProcessActivityCost, Sum([>Part List].ProcessCost) AS SumOfProcessCost, [>Part List].DisplayPart

FROM [>Part List]

GROUP BY [>Part List].DisplayPart;
```
### Query17
```sql
SELECT Estimates.Sequence, Estimates.Component

FROM Estimates

GROUP BY Estimates.Job, Estimates.Sequence, Estimates.Component, Estimates.Description, Estimates.ImportPL, Estimates.ImportParts

HAVING (((Estimates.Job)=forms!ProductListMaster!ProductListControl!JobName) And ((Estimates.Description) Is Null) And ((Estimates.ImportPL)=True) And ((Estimates.ImportParts)=True))

ORDER BY Estimates.Sequence, Estimates.Component, Estimates.Description;
```
### Query18
```sql
SELECT [>Product List].Entry, [>Product Lists].Key, [>Product List].ProductListKey, [>Product List].Item

FROM [>Product Lists] RIGHT JOIN [>Product List] ON [>Product Lists].Key = [>Product List].ProductListKey

WHERE ((([>Product Lists].Key) Is Null))

ORDER BY [>Product List].Entry DESC , [>Product Lists].Key, [>Product List].ProductListKey, [>Product List].Item;
```
### Query19
```sql
SELECT [>Part List].ProcessComponent, [>Part List].ProcessActivity, [>Part List].ProcessCost, Components.Component, Activity.Activity, [>Part List].ProcessActivityCost, [>Part List].ItemNumber

FROM ([>Part List] INNER JOIN Components ON [>Part List].ProcessComponent = Components.key) INNER JOIN Activity ON [>Part List].ProcessActivity = Activity.Key

WHERE ((([>Part List].ProcessActivity)<>0) AND (([>Part List].ProcessCost)=0))

ORDER BY [>Part List].ProcessComponent, [>Part List].ProcessActivi...
```
### Query2
```sql
SELECT [>Resources].Field4 AS Email, [>Resources].ID AS Company, [>Resources].State AS State, [>Resources].Comment

FROM [>Resources]

WHERE ((([>Resources].Field4)<>"") AND (([>Resources].Comment)<>""))

ORDER BY [>Resources].Comment, [>Resources].ID;
```
### Query3
```sql
SELECT [MIS Hours].Hours, nnez([Monday])+nnez([Tuesday])+nnez([Wednesday])+nnez([Thursday])+nnez([Friday])+nnez([Saturday])+nnez([Sunday]) AS Expr1, *

FROM [MIS Hours]

WHERE ((((nnez([Monday])+nnez([Tuesday])+nnez([Wednesday])+nnez([Thursday])+nnez([Friday])+nnez([Saturday])+nnez([Sunday]))<>[Hours])=True))

ORDER BY [MIS Hours].Date DESC;
```
### Query4
```sql
SELECT [>Products].ID, [>Parts].Process1Alternate, *

FROM [>Parts] LEFT JOIN [>Products] ON [>Parts].Part=[>Products].Key

WHERE ((([>Parts].Process1Alternate) Is Not Null));
```
### Query5
```sql
SELECT [>Product Lists].Key, [>Product Lists].ProductList, [>Product List].*

FROM [>Product Lists] INNER JOIN [>Product List] ON [>Product Lists].Key=[>Product List].Key

WHERE ((([>Product Lists].Key)=83));
```
### Query6
```sql
SELECT [>Product List].Component, [>Product List].ComponentText

FROM [>Product List]

WHERE ((([>Product List].ProductListKey)=[Forms]![ProductListMaster]![ProductListControl]![ProductListName]))

GROUP BY [>Product List].Component, [>Product List].ComponentText

HAVING ((([>Product List].Component) Is Not Null));
```
### Query7
```sql
SELECT [>Product Lists].ProductList, [>Designs].*, InStr([ProductList],"8.10.15") AS Expr1

FROM [>Product Lists] INNER JOIN [>Designs] ON [>Product Lists].Key = [>Designs].ProductListKey

WHERE (((InStr([ProductList],"8.10.15"))<>0));
```
### Query8
```sql
SELECT [>Designs].Key, [>Designs].ProductListKey AS TheKey, [>Designs].Alternate, GetPLName([theKey]) AS PLName

FROM [>Designs] LEFT JOIN [>Product List] ON [>Designs].ProductListKey=[>Product List].ProductListKey

WHERE ((([>Product List].ProductListKey) Is Null))

ORDER BY [>Designs].ProductListKey, [>Designs].Alternate;
```
### Query9
```sql
SELECT [>Product List].Item, [>Product Lists].ProductList

FROM ([>Product List] INNER JOIN [>Correspondence] ON [>Product List].Key = [>Correspondence].Name) INNER JOIN [>Product Lists] ON [>Product List].ProductListKey = [>Product Lists].Key;
```
### Receivables Report Query
```sql
SELECT DISTINCTROW [>Jobs].ID, [General Ledger].AccountNumber, Last([General Ledger].TransactionDate) AS LastOfTransactionDate, Sum([General Ledger].DebitAmount) AS SumOfDebitAmount, Sum([General Ledger].CreditAmount) AS SumOfCreditAmount, [>Jobs].Closed, [>Jobs].Key, [General Ledger].SourceOperative, [>Resources].ID

FROM ([General Ledger] INNER JOIN [>Jobs] ON [General Ledger].Job=[>Jobs].Key) LEFT JOIN [>Resources] ON [>Jobs].Agreement=[>Resources].Key

GROUP BY [>Jobs].ID, [General Ledger].A...
```
### SaleorAmountorTotal
```sql
SELECT [>Jobs].Key, [>Jobs].ID, IIf([family],Format([sumofamount],"#,#") & " Total",[saleorproposal]) AS Total, SalesSummarybyJob.MaxOfTheDate

FROM (SalesSummarybyJob RIGHT JOIN [>Jobs] ON SalesSummarybyJob.Key=[>Jobs].Key) LEFT JOIN Children ON [>Jobs].Key=Children.theParent

ORDER BY [>Jobs].ID;
```
### Sales Job Names by Design Phase
```sql
SELECT DISTINCTROW [>Jobs].ID AS Job, [>Jobs].Key, IIf(Not IsNull([Completed]),[Phase] & " " & [Completed],[ProductionPhase]) AS Currently, Format([SumOfSaleAmount],"#,#") AS Agreement, Max([Sales Journal].Due) AS [Last Invoice], IIf([DesignJob],"Design","") AS Design, IIf([Family],"Parent",IIf(nnez([Parent])<>0,"Child","")) AS [Parent/Child], Format(nnez([EstimatedPM])+nnez([EstimatedSpec])+nnez([estimatedOther])+nnez([estimatedmaterial])+nnez([estimatedsolidlumber])+nnez([estimatedveneer])+nne...
```
### Sales Job Names by Phase
```sql
SELECT DISTINCTROW [>Jobs].ID AS Job, [>Jobs].Key, IIf(InStr([Phase],"Complete")<>0,[Phase],IIf([estimate] Or [designJob],[Phase],[ProductionPhase])) AS Currently, SaleorAmountorTotal.Total AS [Sale or Proposal], IIf([DesignJob] And Not [estimate],"Design",IIf([Estimate] And Not [designjob],"Estimate",IIf([Estimate] And [designjob],"Design Estimate",""))) AS [Job Type], IIf([Family],"Parent",IIf(nnez([>Jobs].Parent)<>0,"Child","")) AS [Parent/Child], [>Jobs].DesignJob, [>Jobs].Delivered, [>Jobs]...
```
### Sales Last Invoice
```sql
SELECT DISTINCT [>Jobs].ID, [Sales Journal].Job AS TheJob, Max([Sales Journal].Due) AS MaxOfDue

FROM [Sales Journal] RIGHT JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key

WHERE ((([Sales Journal].InvoiceAmount)<>0))

GROUP BY [>Jobs].ID, [Sales Journal].Job, [>Jobs].Family

HAVING ((([Sales Journal].Job)=forms!Sales!TheJobName) And ((Max([Sales Journal].Due)) Is Not Null) And (([>Jobs].Family)=False))

ORDER BY [>Jobs].ID;
```
### Sales Profit Chart Query
```sql
SELECT Sum(EstimateTrend.Trend3Amount) AS Profit, EstimateTrend.Trend1Job AS Employee

FROM EstimateTrend

GROUP BY EstimateTrend.Trend1Job, EstimateTrend.TrendDate

HAVING (((EstimateTrend.TrendDate) Is Not Null))

ORDER BY Sum(EstimateTrend.Trend3Amount) DESC;
```
### SalesInvoiceSummarybyJob
```sql
SELECT DISTINCT [>Jobs].ID, [Sales Journal].Job, Sum([Sales Journal].InvoiceAmount) AS SumOfInvoiceAmount, [>Jobs].Estimate, [>Jobs].Family

FROM [Sales Journal] RIGHT JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key

GROUP BY [>Jobs].ID, [Sales Journal].Job, [>Jobs].Estimate, [>Jobs].Family

HAVING (((Sum([Sales Journal].InvoiceAmount))=0) AND (([>Jobs].Estimate)=False) AND (([>Jobs].Family)=False))

ORDER BY [>Jobs].ID;
```
### SalesProposalDatebyJob
```sql
SELECT DISTINCT [Sales Journal].Proposal, [Sales Journal].Job, [Sales Journal].Due

FROM [Sales Journal]

WHERE ((([Sales Journal].Proposal)<>0))

ORDER BY [Sales Journal].Job;
```
### SalesProposalSummarybyJob
```sql
SELECT DISTINCT [>Jobs].ID, [Sales Journal].Job, Last([Sales Journal].Proposal) AS LastOfProposal

FROM [Sales Journal] RIGHT JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key

GROUP BY [>Jobs].ID, [Sales Journal].Job

HAVING (((Last([Sales Journal].Proposal))<>0))

ORDER BY [>Jobs].ID;
```
### SalesSaleSummarybyJob
```sql
SELECT [Sales Journal].Job, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount, Max([Sales Journal].TheDate) AS MaxOfTheDate

FROM [Sales Journal]

GROUP BY [Sales Journal].Job

HAVING (((Sum([Sales Journal].SaleAmount))<>0));
```
### SalesSummarybyJob
```sql
SELECT [>Jobs].ID, [>Jobs].Key, IIf([sumofsaleamount]<>0,Format([sumofsaleamount],"#,#"),IIf([lastofproposal]<>0,Format([lastofproposal],"#,#") & " Proposal","")) AS SaleorProposal, IIf([sumofsaleamount]<>0,[sumofsaleamount],IIf([lastofproposal]<>0,[lastofproposal],0)) AS Amount, SalesSaleSummarybyJob.MaxOfTheDate

FROM ([>Jobs] LEFT JOIN SalesProposalSummarybyJob ON [>Jobs].Key=SalesProposalSummarybyJob.Job) LEFT JOIN SalesSaleSummarybyJob ON [>Jobs].Key=SalesSaleSummarybyJob.Job

GROUP BY [>Jo...
```
### Time Card Job Names by Phase
```sql
SELECT DISTINCTROW [>Jobs].ID AS Job, [>Jobs].Key, IIf(Not IsNull([Completed]),[Phase] & " " & [Completed],[ProductionPhase]) AS Currently, Format([SumOfSaleAmount],"#,#") AS Agreement, Max([Sales Journal].Due) AS [Last Invoice], IIf([DesignJob],"Design","") AS Design, IIf([Estimate]<>0,"Estimate","") AS Estimates, IIf([Family],"Parent",IIf(nnez([Parent])<>0,"Child","")) AS [Parent/Child], [>Jobs].Delivered, [>Jobs].Customer, [>Jobs].Estimate, [>Jobs].Owner

FROM (([>Jobs] LEFT JOIN [>Settings] ...
```
### Time Job Names
```sql
SELECT DISTINCTROW [>Jobs].ID, IIf([DesignJob] And Not [estimate],"Design",IIf([Estimate] And Not [designjob],"Estimate",IIf([Estimate] And [designjob],"Design Estimate",""))) AS [Job Type], IIf(Not IsNull([Completed]),[Phase] & " " & [Completed],IIf([estimate] Or [designJob],[Phase] & " " & [Preliminary],[ProductionPhase])) AS Currently, [>Jobs].Key, Format([SumOfSaleAmount],"#,#") AS Agreement, Max([Sales Journal].Due) AS [Last Invoice], IIf([Family],"Parent",IIf(nnez([Parent])<>0,"Child",""))...
```
### Time Job Names by Phase
```sql
SELECT DISTINCTROW [>Jobs].ID AS Job, IIf([DesignJob] And Not [estimate],"Design",IIf([Estimate] And Not [designjob],"Estimate",IIf([Estimate] And [designjob],"Design Estimate",""))) AS [Job Type], IIf(Not IsNull([Completed]),[Phase] & " " & [Completed],IIf([estimate] Or [designJob],[Phase] & " " & [Preliminary],[ProductionPhase])) AS Currently, [>Jobs].Key, Format([SumOfSaleAmount],"#,#") AS Agreement, Max([Sales Journal].Due) AS [Last Invoice], IIf([Family],"Parent",IIf(nnez([Parent])<>0,"Chil...
```
### TimeCardQuery
```sql
SELECT DISTINCTROW [MIS Hours].Employee, [MIS Hours].Date, [MIS Hours].Archive, [MIS Hours].DesignNote, [MIS Hours].Journal, [MIS Hours].ADPFile, [MIS Hours].General, [MIS Hours].GeneralHour, [MIS Hours].JobHour, [MIS Hours].Hours, [MIS Hours].Rate, [MIS Hours].MondayNote, [MIS Hours].TuesdayNote, [MIS Hours].WednesdayNote, [MIS Hours].ThursdayNote, [MIS Hours].FridayNote, [MIS Hours].SaturdayNote, [MIS Hours].SundayNote, [MIS Hours].Cost, [MIS Hours].Monday, [MIS Hours].Tuesday, [MIS Hours].Wed...
```
### Unrelated Designs
```sql
SELECT [>Designs].Key, [>Designs].ProductListKey AS TheKey, [>Designs].Alternate

FROM [>Designs] LEFT JOIN [>Product Lists] ON [>Designs].ProductListKey = [>Product Lists].Key

WHERE ((([>Product Lists].Key) Is Null))

ORDER BY [>Designs].ProductListKey, [>Designs].Alternate;
```
### Unrelated Materials
```sql
SELECT [>Materials].Key, [>Materials].ProductListKey AS TheKey

FROM [>Materials] LEFT JOIN [>Product Lists] ON [>Materials].ProductListKey=[>Product Lists].Key

WHERE ((([>Product Lists].Key) Is Null))

ORDER BY [>Materials].ProductListKey;
```
### WIP Design Phase Query
```sql
SELECT DISTINCTROW [>Jobs].ProductionPhase, [>Jobs].ID, Max([Sales Journal].TheDate) AS MaxOfTheDate, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount

FROM [Sales Journal] INNER JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key

WHERE ((([>Jobs].Estimate)=False) AND (([>Jobs].Closed)=False))

GROUP BY [>Jobs].ProductionPhase, [>Jobs].ID

HAVING ((([>Jobs].ProductionPhase)="Design"))

ORDER BY [>Jobs].ProductionPhase, [>Jobs].ID, Max([Sales Journal].TheDate);
```
### WIP Design Phase Total Query
```sql
SELECT Sum([WIP Design Phase Query].SumOfSaleAmount) AS SumOfSumOfSaleAmount

FROM [WIP Design Phase Query];
```
### WIP Installation Phase Query
```sql
SELECT DISTINCTROW [>Jobs].ProductionPhase, [>Jobs].ID, Max([Sales Journal].TheDate) AS MaxOfTheDate, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount

FROM [Sales Journal] INNER JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key

WHERE ((([>Jobs].Estimate)=False) AND (([>Jobs].Closed)=False))

GROUP BY [>Jobs].ProductionPhase, [>Jobs].ID

HAVING ((([>Jobs].ProductionPhase)="Installation"))

ORDER BY [>Jobs].ProductionPhase, [>Jobs].ID, Max([Sales Journal].TheDate);
```
### WIP Installation Phase Total Query
```sql
SELECT Sum([WIP Installation Phase Query].SumOfSaleAmount) AS SumOfSumOfSaleAmount

FROM [WIP Installation Phase Query];
```
### WIP Jobs
```sql
SELECT [>Jobs].ProductionPhase, [>Jobs].ID, [>Sales Amounts].SumOfSaleAmount

FROM [>Jobs] LEFT JOIN [>Sales Amounts] ON [>Jobs].Key=[>Sales Amounts].Job

WHERE ((([>Jobs].ProductionPhase)="Installation" Or ([>Jobs].ProductionPhase)="Design" Or ([>Jobs].ProductionPhase)="Shop" Or ([>Jobs].ProductionPhase)="Stored") AND (([>Sales Amounts].SumOfSaleAmount)<>0) AND (([>Jobs].Estimate)=False) AND (([>Jobs].Closed)=False))

ORDER BY [>Jobs].ProductionPhase, [>Jobs].ID;
```
### WIP Jobs WorkFlow
```sql
SELECT WorkFlow.Phase, [>Jobs].ID, WorkFlow.TaskID, WorkFlow.TaskBegin, WorkFlow.Task, WorkFlow.PhaseAmount, WorkFlow.TaskLevel

FROM [>Jobs] LEFT JOIN WorkFlow ON [>Jobs].Key=WorkFlow.Job

WHERE (((WorkFlow.Phase)="Installation" Or (WorkFlow.Phase)="Design" Or (WorkFlow.Phase)="Shop" Or (WorkFlow.Phase)="Stored") AND (([>Jobs].ProductionPhase)="Installation" Or ([>Jobs].ProductionPhase)="Design" Or ([>Jobs].ProductionPhase)="Shop" Or ([>Jobs].ProductionPhase)="Stored") AND (([>Jobs].Estimate)=F...
```
### WIP Shop Phase Query
```sql
SELECT DISTINCTROW [>Jobs].ProductionPhase, [>Jobs].ID, Max([Sales Journal].TheDate) AS MaxOfTheDate, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount

FROM [Sales Journal] INNER JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key

WHERE ((([>Jobs].Estimate)=False) AND (([>Jobs].Closed)=False))

GROUP BY [>Jobs].ProductionPhase, [>Jobs].ID

HAVING ((([>Jobs].ProductionPhase)="Shop"))

ORDER BY [>Jobs].ProductionPhase, [>Jobs].ID, Max([Sales Journal].TheDate);
```
### WIP Shop Phase Total Query
```sql
SELECT Sum([WIP Shop Phase Query].SumOfSaleAmount) AS SumOfSumOfSaleAmount

FROM [WIP Shop Phase Query];
```
### WIP Stored Phase Query
```sql
SELECT DISTINCTROW [>Jobs].ProductionPhase, [>Jobs].ID, Max([Sales Journal].TheDate) AS MaxOfTheDate, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount

FROM [Sales Journal] INNER JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key

WHERE ((([>Jobs].Estimate)=False) AND (([>Jobs].Closed)=False))

GROUP BY [>Jobs].ProductionPhase, [>Jobs].ID

HAVING ((([>Jobs].ProductionPhase)="Stored"))

ORDER BY [>Jobs].ProductionPhase, [>Jobs].ID, Max([Sales Journal].TheDate);
```
### WIP Stored Phase Total Query
```sql
SELECT Sum([WIP Stored Phase Query].SumOfSaleAmount) AS SumOfSumOfSaleAmount

FROM [WIP Stored Phase Query];
```
### WIP Total Query
```sql
SELECT [WIP Shop Phase Total Query].SumOfSumOfSaleAmount, [WIP Design Phase Total Query].SumOfSumOfSaleAmount, [WIP Stored Phase Total Query].SumOfSumOfSaleAmount, [WIP Installation Phase Total Query].SumOfSumOfSaleAmount

FROM [WIP Shop Phase Total Query], [WIP Design Phase Total Query], [WIP Stored Phase Total Query], [WIP Installation Phase Total Query];
```
### Weekly Dates
```sql
SELECT;
```
### email All
```sql
SELECT eMail.email AS Email, [>Resources].ID AS Company, [>Resources].State AS State, [>Resources].Comment

FROM eMail LEFT JOIN [>Resources] ON eMail.ResourceKey=[>Resources].Key

WHERE (((eMail.email)<>"") AND (([>Resources].Comment)<>"") AND ((eMail.UnSubscribe)=False))

ORDER BY [>Resources].Comment, [>Resources].ID;
```

## VBA Object Inventory
| Type | Count | Objects |
|------|-------|--------|
| Forms | 60 | CNC, ColumnSetup, ContractSubForm, CostSubForm, DeleteProductList, DesignSubForm, Designs, DrawingAid, DrawingLine, DrawingSetup, Drawings, EnterTime, EstimateSubForm, Fax, Guide, Help, HelpEdit, ImportProductList, Job, JobCostForm, JobCostItemForm, JobCostSummaryForm, JobCostSummaryFormNull, JobSubForm, Letter, Log, MainMenu, Material, Materials, Memo, MemoSubForm, Message, Note, NoteSearch, NoteSubForm, OptionRequirement, Options, Parser, PartsList, Password, Premium, Premium SubForm, PremiumAttachment, PremiumSQL, ProblemLog, ProductDrawings, ProductList, ProductListMaster, Products, ProposalSubForm, Rename, ResourcePassword, SelectDatabase, Spreadsheets, Startup, Startupold, Stop_Execution, VariableSubForm, Word Document, zzPremiumSQL |
| Reports | 111 | ADP, ADPHours, Accounts Receivables - Detail, CompletedJobs, CorrespondenceFax, Customer Survey, DesignExpenseSubForm Query subreport, Drawing, General Ledger Receivables Report, General Ledger Receivables Report Aged, Help Report, Job Product List, Job Profit Report, Jobs Report, ListNotes, ListOptions, Log Report, Material Cost Revision Report, Part List Rip Report, Part List by Component, Part List by Component X Sort, Part List by Item, Part List by Item Copy, Part List by Item X Sort, Part List by Material, Part List by Material Usage, Part List by Material X Sort, Part List by Material Z Usage, Parts List Hardware Report, Parts List Material Report, Parts List Multiples Report, Parts List Process Report, Premium SubReport, Premium SubReport Copy, Product Drawings, Product List, Product List Cost by Room, Product List Costs, Product List Cover Page, Product List Drawing Notes, Product List Notes, Product List Premium, Product Specs, Product Specs Material, Product Specs old, Receivables Report, ReportTemplate, Resources Labels, Resources Notes Report, Resources Plain Labels, Resources Report, Resources Small Labels, Sales Active Estimates, Sales Active Jobs, Sales Agreement Subform, Sales Approval Schedule, Sales Architect Design Cost Subform, Sales Architect Subform, Sales Contractor Subform, Sales Customer Subform, Sales Delivery Schedule, Sales Design Costs Report, Sales Design Invoice Report, Sales Design Invoice Report by Designer, Sales Design Log Report, Sales Design Weekly Report, Sales Engineering Schedule, Sales Estimates Report, Sales Estimates Trend Report, Sales Incomplete Estimates Report, Sales Interior Designer Subform, Sales Invoice Report, Sales Invoice Report old, Sales Invoice SubReport Additional, Sales Invoice SubReport Agreement, Sales Invoice SubReport Invoices, Sales Invoice SubReport Payments, Sales Invoice SubReport Refunds, Sales Invoice SubReport Statement Invoices, Sales Invoice SubReport Statement Payments, Sales Invoice SubReport Terms, Sales Job Hours Report, Sales Jobs No Schedule, Sales Not Audited, Sales Not Posted, Sales Payments, Sales Printout Report, Sales Production Schedule, Sales Report, Sales Sale Not Posted, Sales Schedule, Sales Schedule by Partner, Sales Schedule copy, Sales Statement Report, Sales Total Design Cost Report, Sales Total Report, Sales Underfunded, Sales Weekly Statement Report, Sales by Resource Report, SalesVOJC Report, SearchListNotes, SurveyCompletedJobs, SurveyCompletedJobsGraphic, SurveyWIP, Surveys, SurveysIncomplete, Time, Time Detailed, TimeErrors, Workflow Engineer Schedule, Workflow Schedule |
| Modules | 10 | AppPosition, AutoAttach, CNC, Common, Drawing, FormsCode, General Form Utilities, Parts, Records, ResizeAPP |
| Classes | 0 |  |
| Macros | 91 | AutoExec, AutoKeys, FormFile, FormGeneral, FormGoto, MenuArchiveProductList, MenuBars, MenuCostPartsList, MenuCostProductList, MenuEdit, MenuEditCorrespondence, MenuEditMinimum, MenuEditParts, MenuEditProductList, MenuEmailReports, MenuExport, MenuFaxReport, MenuFile, MenuFileCorrespondence, MenuFileDrawings, MenuFileEmailReports, MenuFileJobs, MenuFileMainMenu, MenuFilePartsList, MenuFileProductList, MenuFileProducts, MenuFileReports, MenuFileReportsExport, MenuFileReportsNoPrint, MenuFileResources, MenuFileTime, MenuGoto, MenuGotoMainMenu, MenuHelp, MenuListProductList, MenuMarketingResources, MenuParts, MenuPartsExport, MenuPartsProcesses, MenuPartsRipReport, MenuReportBonus, MenuReportCorrespondence, MenuReportCustomerSurvey, MenuReportDrawings, MenuReportHoursEntry, MenuReportJob, MenuReportJobs, MenuReportMaterial, MenuReportPartsList, MenuReportProductList, MenuReportProducts, MenuReportResources, MenuSales, MenuSalesAccounting, MenuSalesAccountingAll, MenuSalesAccountingPartner, MenuSalesAgreement, MenuSalesAgreementAll, MenuSalesAll, MenuSalesArchicect, MenuSalesArchicectAll, MenuSalesContractor, MenuSalesContractorAll, MenuSalesCustomer, MenuSalesCustomerAll, MenuSalesInteriorDesignersAll, MenuSalesPartners, MenuSalesProjectManagers, MenuSalesProposals, MenuSalesProposalsAll, MenuSalesProposalsPartner, MenuSalesSchedule, MenuSalesScheduleAll, MenuSalesSchedulePartner, MenuSalesScheduleProjectManager, MenuSalesWorkFlow, MenuSalesbyResource, MenuSearchProductList, MenuSettingsApp, MenuSettingsMainMenu, MenuShortcutProductList, MenuStop, MenuTools, MenuWindow, MenuWorkFlow, Miscellaneous, ReportPartsList, ReportProductList, ReportTime, Size, Visio |

