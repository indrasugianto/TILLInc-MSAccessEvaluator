# Schema Report: JournalsGeneralLedgerApp
---
## Tables
### CopyRight
| Column | Type | Size |
|--------|------|------|
| ID | COUNTER | 10 |
| CopyRight | DATETIME | 19 |
| Message | VARCHAR | 50 |
| Logo | LONGBINARY | 1073741823 |

**Row count:** 1

## Relationships
No relationships extracted.

## Queries
### #1988Q4+BonusDeptQuery
```sql
SELECT DatePart("yyyy",[checkdate]) AS Y, DatePart("q",[checkdate]) AS Q, [MIS Personnel].WitholdingAccount, Sum([Payroll Journal].Bonus) AS SumOfBonus

FROM [Payroll Journal], [MIS Personnel], [#19984QEmployees] AS [#19984QEmployees_1]

WHERE ((([Payroll Journal].CheckDate)>#10/1/1998# And ([Payroll Journal].CheckDate)<#1/7/2000#))

GROUP BY DatePart("yyyy",[checkdate]), DatePart("q",[checkdate]), [MIS Personnel].WitholdingAccount

HAVING (((Sum([Payroll Journal].Bonus))>0))

ORDER BY DatePart(...
```
### #19984Q+EmpBonusQuery
```sql
SELECT [#1999Employees].Employee AS Expr1, [#1999Employees].ADPName AS Expr2, Sum([Payroll Journal].Bonus) AS SumOfBonus, [#1998EmpBonusQ4Query].Q498Bonus AS Expr3, [#1999EmpBonusQ1Query].Q1Bonus AS Expr4, [#1999EmpBonusQ2Query].Q2Bonus AS Expr5, [#1999EmpBonusQ3Query].Q3Bonus AS Expr6, [#1999EmpBonusQ4Query].Q4Bonus AS Expr7

FROM [#1999Employees], [Payroll Journal], [#1999EmpBonusQ1Query], [#1999EmpBonusQ2Query], [#1999EmpBonusQ3Query], [#1999EmpBonusQ4Query], [#1998EmpBonusQ4Query]

WHERE (((...
```
### #19984Q+EmpBonusQuery1
```sql
SELECT [#1999Employees].Employee AS Expr1, [#1999Employees].ADPName AS Expr2, Sum([Payroll Journal].Bonus) AS SumOfBonus, [#1998EmpBonusQ4Query].Q498Bonus AS Expr3, [#1999EmpBonusQ1Query].Q1Bonus AS Expr4, [#1999EmpBonusQ2Query].Q2Bonus AS Expr5, [#1999EmpBonusQ3Query].Q3Bonus AS Expr6, [#1999EmpBonusQ4Query].Q4Bonus AS Expr7

FROM [#1999Employees], [Payroll Journal], [#1999EmpBonusQ1Query], [#1999EmpBonusQ2Query], [#1999EmpBonusQ3Query], [#1999EmpBonusQ4Query], [#1998EmpBonusQ4Query]

WHERE (((...
```
### #1998EmpBonusQ4Query
```sql
SELECT [#1999Employees].ADPName AS Expr1, [#1999Employees].ADPFile AS Expr2, Sum([Payroll Journal].Bonus) AS SumOfBonus, [sumofbonus] AS Q498Bonus

FROM [#1999Employees], [Payroll Journal]

WHERE ((([Payroll Journal].CheckDate)>=#10/1/1998# And ([Payroll Journal].CheckDate)<#1/7/1999#))

GROUP BY [#1999Employees].ADPName, [#1999Employees].ADPFile

HAVING (((Sum([Payroll Journal].Bonus))>0))

ORDER BY [#1999Employees].ADPName;
```
### 12-19-2009
```sql
SELECT [Purchase Journal].Paid, [Purchase Journal].TotalAmount, [Purchase Journal].DebitAmount, [Purchase Journal].InvoiceDate, [Cash Disbursements Journal].CheckDate, [Purchase Journal].CheckDate, [Cash Disbursements Journal].CheckNumber, [Purchase Journal].CheckNumber

FROM [Cash Disbursements Journal] INNER JOIN [Purchase Journal] ON [Cash Disbursements Journal].Key=[Purchase Journal].CheckKey

WHERE ((([Purchase Journal].CheckDate) Is Null))

ORDER BY [Purchase Journal].TotalAmount DESC;
```
### 401 Query
```sql
SELECT DISTINCTROW [Payroll Journal].CheckNumber, [Payroll Journal].Field3

FROM [Payroll Journal]

ORDER BY [Payroll Journal].CheckNumber;
```
### >401K ADP Period Query
```sql
SELECT [Payroll Journal].ADPFile, Max(Format([CheckDate],'mm/dd/yyyy')) AS CheckDateFormatted, Sum([Payroll Journal].Field3) AS SumOfField3, Sum([Payroll Journal].Commission) AS SumOfCommission, Sum([Payroll Journal].Roth) AS SumOfRoth, Sum([Payroll Journal].RothLoan) AS SumOfRothLoan

FROM [Payroll Journal]

WHERE ((([Payroll Journal].CheckDate)>=Forms!Payroll!FromDate And ([Payroll Journal].CheckDate)<=Forms!Payroll!ToDate))

GROUP BY [Payroll Journal].ADPFile

HAVING ((([Payroll Journal].ADPF...
```
### >401K ADP YTD Query
```sql
SELECT [Payroll Journal].ADPFile, Sum([Payroll Journal].Gross) AS SumOfGross, [MIS Personnel].ADPName

FROM [Payroll Journal] LEFT JOIN [MIS Personnel] ON [Payroll Journal].ADPFile=[MIS Personnel].ADPFile

WHERE (((Year([CheckDate]))=Year(Forms!Payroll!FromDate)) And (([Payroll Journal].CheckDate)<=Forms!Payroll!ToDate))

GROUP BY [Payroll Journal].ADPFile, [MIS Personnel].ADPName

HAVING ((([Payroll Journal].ADPFile)>10));
```
### >401K Hours YTD Query
```sql
SELECT [MIS Hours].Employee, First([MIS Personnel].ADPFile) AS FirstOfADPFile, Sum([MIS Hours].Hours) AS SumOfHours

FROM [MIS Hours] INNER JOIN [MIS Personnel] ON [MIS Hours].Employee=[MIS Personnel].Employee

WHERE (((Year([MIS Hours].Date))=Year(Forms!Payroll!FromDate)) And (([MIS Hours].Date)<=Forms!Payroll!ToDate))

GROUP BY [MIS Hours].Employee

ORDER BY [MIS Hours].Employee;
```
### >401K Query
```sql
SELECT NoDashes([MIS Personnel].SocialSecurity) AS A, Mid([MIS Personnel].ADPName,InStr([MIS Personnel].ADPName,',')+1,Len([MIS Personnel].ADPName)) AS B, Left([MIS Personnel].ADPName,InStr([MIS Personnel].ADPName,',')-1) AS C, Format([MIS Personnel].BIRTHDATE,'mm/dd/yyyy') AS D, Format([MIS Personnel].EmploymentDATE,'mm/dd/yyyy') AS E, Format([MIS Personnel].TerminationDate,'mmddyyyy') AS F, [>401K Hours YTD Query].SumOfHours AS G, [MIS Personnel].Sex AS H, [>401K ADP YTD Query].SumOfGross AS I...
```
### >401KGross YTD Query
```sql
SELECT [MIS Personnel].Employee, Last([Payroll Journal].CheckDate) AS LastOfCheckDate, First([MIS Personnel].ADPFile) AS FirstOfADPFile, Sum([Payroll Journal].Gross) AS SumOfGross

FROM [MIS Personnel] LEFT JOIN [Payroll Journal] ON [MIS Personnel].ADPFile=[Payroll Journal].ADPFile

WHERE (((Year([Payroll Journal].CheckDate))=Year(Forms!Payroll!FromDate) And (Year([Payroll Journal].CheckDate))<=Forms!Payroll!ToDate))

GROUP BY [MIS Personnel].Employee

HAVING (((First([MIS Personnel].ADPFile))>1...
```
### >ADP Date Query
```sql
SELECT DISTINCTROW ADP.CheckDate AS Expr1

FROM ADP

GROUP BY ADP.CheckDate

ORDER BY ADP.CheckDate DESC;
```
### >ADP Employee Query
```sql
SELECT DISTINCTROW [MIS Personnel].ADPName, [MIS Personnel].ADPNetAccount

FROM [MIS Personnel]

ORDER BY [MIS Personnel].ADPName;
```
### >ADP Query
```sql
SELECT DISTINCTROW ADP.*, [MIS Personnel].ADPName

FROM ADP, [MIS Personnel]

ORDER BY ADP.CheckDate DESC , ADP.CheckNumber DESC , [MIS Personnel].ADPName;
```
### >Account Number Query
```sql
SELECT DISTINCTROW [MIS Accounts].Number, [MIS Accounts].Account

FROM [MIS Accounts]

ORDER BY [MIS Accounts].Number;
```
### >Accounts Index Query
```sql
SELECT DISTINCTROW [MIS Accounts].*

FROM [MIS Accounts]

ORDER BY [MIS Accounts].BalanceSheetItemSort, [MIS Accounts].Number;
```
### >Accounts Query
```sql
SELECT DISTINCTROW [MIS Accounts].*, IIf(nnez([BalanceSheetItemSort])<100,DLookUp("SubSubHeading","General Ledger Balance Sheet","ReportSort =" & [BalanceSheetItemSort]),DLookUp("SubSubHeading","General Ledger Income Statement","ReportSort =" & [BalanceSheetItemSort])) AS Report

FROM [MIS Accounts]

ORDER BY [MIS Accounts].Number;
```
### >Activitiy Query
```sql
SELECT DISTINCTROW [>Settings].JobActivity

FROM [>Settings]

WHERE ((([>Settings].JobActivity) Is Not Null))

ORDER BY [>Settings].JobActivity;
```
### >Approval Query
```sql
SELECT DISTINCTROW [>Approval].ApprovedBy AS Expr1

FROM [>Approval]

ORDER BY [>Approval].ApprovedBy;
```
### >Attachments Query
```sql
SELECT DISTINCTROW [>Attachments].*

FROM [>Attachments]

ORDER BY [>Attachments].Path, [>Attachments].TableName

WITH OWNERACCESS OPTION;
```
### >Balance Sheet Accounts Form Heading Query
```sql
SELECT DISTINCTROW [>Settings].MacroToRun, [>Settings].MenuCategory, [>Settings].Key, IIf(Right([MenuCategory],1)=0,"Heading",IIf(InStr([menutext],"Asset")<>0,"Asset",IIf(InStr([menutext],"Liability")<>0,"Liability",IIf(InStr([menutext],"Income")<>0,"Income","Expense")))) AS Heading

FROM [>Settings]

WHERE (((InStr([MenuText],"BalanceSheetAsset")<>0 Or InStr([MenuText],"BalanceSheetLiability")<>0 Or InStr([MenuText],"ProfitLossExpense")<>0 Or InStr([MenuText],"ProfitLossIncome")<>0)=True))

ORD...
```
### >Balance Sheet Accounts Query
```sql
SELECT DISTINCTROW [>Settings].MenuText, [>Settings].MenuCategory, [MIS Accounts].*

FROM [MIS Accounts] LEFT JOIN [>Settings] ON [MIS Accounts].BalanceSheetCategorySort=[>Settings].Key

WHERE (((IIf(InStr(localvariable("ScratchPad"),"Balance")<>0 And [Number]<300,True,IIf(InStr(localvariable("ScratchPad"),"Income")<>0 And [number]>299,True,False)))=True))

ORDER BY [>Settings].MenuText, [>Settings].MenuCategory, IIf(InStr(localvariable("ScratchPad"),"Balance")<>0 And [Number]<300,True,IIf(InStr...
```
### >Balance Sheet Accounts Report All GL Query
```sql
SELECT [>Balance Sheet Accounts Query].Number, nnez([SumOfCreditAmount]) AS Credit, nnez([SumOfDebitAmount]) AS Debit, nnez([PreviousCreditAmount]) AS PreviousCredit, nnez([PreviousDebitAmount]) AS PreviousDebit

FROM ([>Balance Sheet Accounts Query] LEFT JOIN [>Balance Sheet Accounts Report GL Query] ON [>Balance Sheet Accounts Query].Number=[>Balance Sheet Accounts Report GL Query].AccountNumber) LEFT JOIN [>Balance Sheet Accounts Report Previous GL Query] ON [>Balance Sheet Accounts Query].Nu...
```
### >Balance Sheet Accounts Report GL Query
```sql
SELECT DISTINCTROW [General Ledger].AccountNumber, Sum([General Ledger].CreditAmount) AS SumOfCreditAmount, Sum([General Ledger].DebitAmount) AS SumOfDebitAmount

FROM [General Ledger]

WHERE ((([General Ledger].TransactionDate)>=Forms!GeneralLedger!FromDate And ([General Ledger].TransactionDate)<=forms!GeneralLedger!todate))

GROUP BY [General Ledger].AccountNumber;
```
### >Balance Sheet Accounts Report Previous GL Query
```sql
SELECT DISTINCTROW [General Ledger].AccountNumber AS PreviousAccountNumber, Sum([General Ledger].CreditAmount) AS PreviousCreditAmount, Sum([General Ledger].DebitAmount) AS PreviousDebitAmount

FROM [General Ledger]

WHERE (((Year([TransactionDate]))=Year(Forms!GeneralLedger!FromDate)-1))

GROUP BY [General Ledger].AccountNumber;
```
### >Balance Sheet Accounts Report Query
```sql
SELECT DISTINCTROW Left([order],1) AS Category, [>Balance Sheet All Accounts Report Query].Order, [>Balance Sheet All Accounts Report Query].Heading, [>Balance Sheet All Accounts Report Query].SubHeading, [>Balance Sheet All Accounts Report Query].Account, [>Balance Sheet All Accounts Report Query].Account AS Sort, [>Balance Sheet All Accounts Report Query].BeginningBalance, [>Balance Sheet All Accounts Report Query].PreviousBalance, [credit]-[debit] AS Net, [previouscredit]-[previousdebit] AS P...
```
### >Balance Sheet Accounts Report Query V2
```sql
SELECT DISTINCTROW [>Balance Sheet All Accounts Report Query].Order, [>Balance Sheet All Accounts Report Query].Heading, [>Balance Sheet All Accounts Report Query].Sort AS Expr1, [>Balance Sheet All Accounts Report Query].SubHeading, [>Balance Sheet All Accounts Report Query].Account, [>Balance Sheet All Accounts Report Query].BeginningBalance, [>Balance Sheet Accounts Report GL Query].Net AS Expr2, IIf([order]<100,Left([order],1),Mid([Order],2,1)) AS SubOrder, IIf([Order]<100,"Asset","Liability...
```
### >Balance Sheet All Accounts Report Query
```sql
SELECT DISTINCTROW [>Balance Sheet Heading Query].MenuCategory AS [Order], [>Balance Sheet Heading Query].MacroToRun AS Heading, [MIS Accounts].Account AS SubHeading, [MIS Accounts].Number AS Account, IIf(InStr(localvariable("ScratchPad"),"Prior")=0,[Balance],[FY5]) AS BeginningBalance, [MIS Accounts].FY5 AS PreviousBalance

FROM ([>Balance Sheet Heading Query] LEFT JOIN [MIS Accounts] ON [>Balance Sheet Heading Query].Key=[MIS Accounts].BalanceSheetCategorySort) LEFT JOIN [General Ledger] ON [M...
```
### >Balance Sheet Heading Query
```sql
SELECT DISTINCTROW [>Settings].MacroToRun, [>Settings].MenuCategory, [>Settings].Key, [>Settings].MenuText

FROM [>Settings]

WHERE (((InStr([MenuText],"ProfitLossIncome")<>0 And InStr(localvariable("ScratchPad"),"Income")<>0 Or InStr([MenuText],"ProfitLossExpense")<>0 And InStr(localvariable("ScratchPad"),"Income")<>0 Or InStr([MenuText],"BalanceSheetAsset")<>0 And InStr(localvariable("ScratchPad"),"Balance")<>0 Or InStr([MenuText],"BalanceSheetLiability")<>0 And InStr(localvariable("ScratchPad...
```
### >Balance Sheet KRH Accounts Report Query
```sql
SELECT DISTINCTROW [General Ledger Income Statement].Index, [General Ledger Income Statement].Heading, [General Ledger Income Statement].SubHeading, [General Ledger Income Statement].SubSubHeading, [General Ledger Income Statement].[Index Income], [General Ledger Income Statement].[Index Expense], [General Ledger Income Statement Account Order].Account, nnez([SumOfCreditAmount]) AS TheCredit, nnez([SumOfDebitAmount]) AS TheDebit, nnez([sumofcreditamount])-nnez([sumofdebitamount]) AS TheNet, setl...
```
### >Balance Sheet Query
```sql
SELECT DISTINCTROW [General Ledger].*, SQLResult("Select Account from [MIS Accounts] where number=" & [AccountNumber]) AS Account

FROM [General Ledger]

ORDER BY [General Ledger].TransactionDate, [General Ledger].SourceJournal, [General Ledger].AccountNumber;
```
### >Balance Sheet Transaction 2 Query
```sql
SELECT DISTINCTROW [>General Ledger Query].Key, [>General Ledger Query].AccountNumber, [>General Ledger Query].TransactionDate, [>General Ledger Query].SourceJournal, [>General Ledger Query].DebitAmount, [>General Ledger Query].CreditAmount

FROM [>General Ledger Query] LEFT JOIN [>Resources] ON [>General Ledger Query].SourceOperative=[>Resources].Key

WHERE ((([>General Ledger Query].AccountNumber)=Forms!BalanceSheet.SelectedAccount2) And (([>General Ledger Query].TransactionDate)>=Forms!Balanc...
```
### >Balance Sheet Transaction Query
```sql
SELECT DISTINCTROW [>General Ledger Query].Key, [>General Ledger Query].AccountNumber, [>General Ledger Query].TransactionDate, [>General Ledger Query].SourceJournal, [>Resources].ID, [>General Ledger Query].DebitAmount, [>General Ledger Query].CreditAmount

FROM [>General Ledger Query] LEFT JOIN [>Resources] ON [>General Ledger Query].SourceOperative=[>Resources].Key

WHERE ((([>General Ledger Query].AccountNumber)=Forms!BalanceSheet.SelectedAccount1) And (([>General Ledger Query].TransactionDa...
```
### >Bank Account Disbursements Query
```sql
SELECT DISTINCTROW [Cash Disbursements Journal].*, [>Resources].ID

FROM [Cash Disbursements Journal] LEFT JOIN [>Resources] ON [Cash Disbursements Journal].SupplierID=[>Resources].Key

ORDER BY [Cash Disbursements Journal].Closed DESC , [Cash Disbursements Journal].CheckDate DESC , [Cash Disbursements Journal].CheckNumber DESC , [>Resources].ID DESC;
```
### >Bank Account Personnel Query
```sql
SELECT DISTINCTROW [MIS Personnel].Employee, [MIS Personnel].Key

FROM [MIS Personnel]

ORDER BY [MIS Personnel].Employee;
```
### >Bank Account Receipts Query
```sql
SELECT DISTINCTROW [Receipts Journal].*, [>Resources].ID

FROM [Receipts Journal] LEFT JOIN [>Resources] ON [Receipts Journal].Payor=[>Resources].Key

ORDER BY [Receipts Journal].Closed DESC , [Receipts Journal].CheckDate DESC , [Receipts Journal].EntryDate DESC , [Receipts Journal].CheckNumber DESC , [>Resources].ID;
```
### >Bank Account Resources Query
```sql
SELECT DISTINCTROW [>Resources].ID, [>Resources].Category, [>Resources].Key

FROM [>Resources]

WHERE ((([>Resources].Category)=Forms!BankAccount.PayeeCategory))

ORDER BY [>Resources].Category, [>Resources].ID;
```
### >Cash Accounts Query
```sql
SELECT DISTINCTROW [>Cash Accounts].Number, [>Cash Accounts].Name, [>Cash Accounts].BeginningBalance AS Expr1

FROM [>Cash Accounts]

ORDER BY [>Cash Accounts].Number

WITH OWNERACCESS OPTION;
```
### >Cash Disbursements Check Date Query
```sql
SELECT DISTINCTROW [Cash Disbursements Journal].CheckDate

FROM [Cash Disbursements Journal]

GROUP BY [Cash Disbursements Journal].CheckDate

ORDER BY [Cash Disbursements Journal].CheckDate DESC;
```
### >Directory Path Query
```sql
SELECT DISTINCTROW [>Local Settings].DirectoryPath, [>Local Settings].Key

FROM [>Local Settings]

WHERE ((([>Local Settings].DirectoryPath) Is Not Null And ([>Local Settings].DirectoryPath)<>""))

ORDER BY [>Local Settings].DirectoryPath;
```
### >Disbursements
```sql
SELECT DISTINCTROW [Purchase Journal].*, [MIS Accounts].Account, IIf([Paid] And Forms!APChecksEntry!ViewPaidInvoices,True,IIf(Not [Paid] And Forms!APChecksEntry!ViewallInvoices,True,False)) AS PaidInvoices

FROM [Purchase Journal] LEFT JOIN [MIS Accounts] ON [Purchase Journal].AccountNo=[MIS Accounts].Number

WHERE (((IIf([Paid] And Forms!APChecksEntry!ViewPaidInvoices,True,IIf(Not [Paid] And Forms!APChecksEntry!ViewallInvoices,True,False)))=True) And (([Purchase Journal].PayablesAccount)=Forms!...
```
### >Disbursements Suppliers Query
```sql
SELECT DISTINCTROW [>Resources].ID, [>Resources].Key, [>Resources].Category

FROM [>Resources]

WHERE ((([>Resources].Category)=Forms!APChecksEntry.PayeeCategory))

ORDER BY [>Resources].Category, [>Resources].ID

WITH OWNERACCESS OPTION;
```
### >DisbursementsByCheckDate
```sql
SELECT DISTINCTROW [Purchase Journal].*, [MIS Accounts].Account

FROM [Purchase Journal] LEFT JOIN [MIS Accounts] ON [Purchase Journal].AccountNo=[MIS Accounts].Number

WHERE ((([Purchase Journal].Paid)<>False) And (([Purchase Journal].PayablesAccount)=Forms!APChecksEntry!PayableAccount))

ORDER BY [Purchase Journal].InvoiceDate DESC , [Purchase Journal].CheckNumber DESC , [Purchase Journal].InvoiceNo;
```
### >DisbursementsByDueDate
```sql
SELECT DISTINCTROW [Purchase Journal].*, [MIS Accounts].Account

FROM [Purchase Journal] LEFT JOIN [MIS Accounts] ON [Purchase Journal].AccountNo=[MIS Accounts].Number

WHERE ((([Purchase Journal].Paid)=Forms!APChecksEntry!ViewPaidInvoices) And (([Purchase Journal].PayablesAccount)=Forms!APChecksEntry!PayableAccount))

ORDER BY [Purchase Journal].Due, [Purchase Journal].InvoiceNo;
```
### >DisbursementsNotByCheckNumber
```sql
SELECT DISTINCTROW [Purchase Journal].*, [MIS Accounts].Account

FROM [Purchase Journal] LEFT JOIN [MIS Accounts] ON [Purchase Journal].AccountNo=[MIS Accounts].Number

WHERE (((IIf([Paid] And Forms!APChecksEntry!ViewPaidInvoices,True,IIf(Not [Paid] And Forms!APChecksEntry!ViewallInvoices,True,False)))=True) And (([Purchase Journal].PayablesAccount)=Forms!APChecksEntry!PayableAccount))

ORDER BY [Purchase Journal].CheckDate DESC , [Purchase Journal].CheckNumber DESC , [Purchase Journal].InvoiceN...
```
### >DisbursementsNotByCheckNumberNotByCheckDate
```sql
SELECT DISTINCTROW [Purchase Journal].*, [MIS Accounts].Account

FROM [Purchase Journal] LEFT JOIN [MIS Accounts] ON [Purchase Journal].AccountNo=[MIS Accounts].Number

WHERE (((IIf([Paid] And Forms!APChecksEntry!ViewPaidInvoices Or [Paid] And Forms!APChecksEntry!ViewallInvoices,True,IIf(Not [Paid] And Forms!APChecksEntry!ViewallInvoices,True,False)))=True) And (([Purchase Journal].PayablesAccount)=Forms!APChecksEntry!PayableAccount))

ORDER BY [Purchase Journal].InvoiceDate DESC , [Purchase Jou...
```
### >DisbursementsNotByDueDate
```sql
SELECT DISTINCTROW [Purchase Journal].*, [MIS Accounts].Account

FROM [Purchase Journal] LEFT JOIN [MIS Accounts] ON [Purchase Journal].AccountNo=[MIS Accounts].Number

WHERE ((([Purchase Journal].Paid)=Forms!APChecksEntry!ViewPaidInvoices) And (([Purchase Journal].PayablesAccount)=Forms!APChecksEntry!PayableAccount))

ORDER BY [Purchase Journal].InvoiceDate, [Purchase Journal].InvoiceNo;
```
### >Errors Query
```sql
SELECT DISTINCTROW [>Errors].Error, [>Errors].Form, [>Errors].Time

FROM [>Errors]

WHERE ((([>Errors].Error) Is Not Null))

ORDER BY [>Errors].Time;
```
### >GL 500 to 699 Expense
```sql
SELECT Sum([General Ledger].CreditAmount) AS SumOfCreditAmount, Sum([General Ledger].DebitAmount) AS SumOfDebitAmount

FROM [General Ledger]

WHERE ((([General Ledger].AccountNumber)>=500 And ([General Ledger].AccountNumber)<=699) And (([General Ledger].TransactionDate)>=Forms!GeneralLedger!FromDate And ([General Ledger].TransactionDate)<=Forms!GeneralLedger!ToDate));
```
### >GL Year Query
```sql
SELECT Year([TransactionDate]) AS Expr1

FROM [General Ledger]

GROUP BY Year([TransactionDate])

ORDER BY Year([TransactionDate]) DESC;
```
### >General Ledger Journals Query
```sql
SELECT DISTINCTROW [>General Ledger Query].SourceJournal

FROM [>General Ledger Query]

GROUP BY [>General Ledger Query].SourceJournal

ORDER BY [>General Ledger Query].SourceJournal;
```
### >General Ledger Query
```sql
SELECT DISTINCTROW [General Ledger].*, [MIS Accounts].Account, [MIS Accounts].Balance, [>Resources].ID

FROM ([General Ledger] INNER JOIN [MIS Accounts] ON [General Ledger].AccountNumber=[MIS Accounts].Number) LEFT JOIN [>Resources] ON [General Ledger].SourceOperative=[>Resources].Key

WHERE ((([General Ledger].TransactionDate)>=Forms!GeneralLedger.FromDate And ([General Ledger].TransactionDate)<=Forms!GeneralLedger.ToDate))

ORDER BY [General Ledger].AccountNumber, [General Ledger].SourceJourna...
```
### >General Ledger Query Accounts
```sql
SELECT DISTINCTROW [MIS Accounts].Account, [General Ledger].AccountNumber

FROM [General Ledger] RIGHT JOIN [MIS Accounts] ON [General Ledger].AccountNumber=[MIS Accounts].Number

WHERE ((([General Ledger].TransactionDate)>=Forms!GeneralLedger.FromDate And ([General Ledger].TransactionDate)<=Forms!GeneralLedger.ToDate Or [Balance]<>0))

GROUP BY [MIS Accounts].Account, [General Ledger].AccountNumber

ORDER BY [General Ledger].AccountNumber;
```
### >General Ledger Resources Query
```sql
SELECT DISTINCTROW [>Resources].ID, [>Resources].Category, [>Resources].Key

FROM [>General Ledger Query] INNER JOIN [>Resources] ON [>General Ledger Query].SourceOperative=[>Resources].Key

ORDER BY [>Resources].Category, [>Resources].ID;
```
### >General Ledger Source Key Query
```sql
SELECT DISTINCTROW [>General Ledger Query].SourceKey

FROM [>General Ledger Query]

GROUP BY [>General Ledger Query].SourceKey

ORDER BY [>General Ledger Query].SourceKey;
```
### >General Ledger Transactions Query
```sql
SELECT DISTINCTROW [General Ledger].SourceTransaction, [General Ledger].SourceTransaction, [General Ledger].TransactionDate

FROM [General Ledger]

WHERE (((IIf(forms!GeneralLedger!SelectJournal And [SourceJournal]=Forms!GeneralLedger!SelectedJournal,True,IIf(Not forms!GeneralLedger!SelectJournal,True,False)))=True))

GROUP BY [General Ledger].SourceTransaction, [General Ledger].SourceTransaction, [General Ledger].TransactionDate

HAVING ((([General Ledger].TransactionDate)>=forms!GeneralLedger....
```
### >General Query
```sql
SELECT DISTINCTROW [>Settings].NonRevenueActivity

FROM [>Settings]

WHERE ((([>Settings].NonRevenueActivity) Is Not Null))

ORDER BY [>Settings].NonRevenueActivity;
```
### >GeneralLedgerSelectedAccount
```sql
SELECT [>General Ledger Query Accounts].AccountNumber, [>General Ledger Query Accounts].Account

FROM [>General Ledger Query Accounts]

GROUP BY [>General Ledger Query Accounts].AccountNumber, [>General Ledger Query Accounts].Account

ORDER BY [>General Ledger Query Accounts].AccountNumber;
```
### >GeneralLedgerSelectedAccountChart
```sql
SELECT [General Ledger].TransactionDate, [General Ledger].AccountNumber, [General Ledger].SourceJournal, [MIS Accounts].Account, Sum([General Ledger].CreditAmount) AS SumOfCreditAmount, Sum([General Ledger].DebitAmount) AS SumOfDebitAmount

FROM [General Ledger] INNER JOIN [MIS Accounts] ON [General Ledger].AccountNumber=[MIS Accounts].Number

WHERE (((IIf(Forms!GeneralLedger!SelectJournal,IIf(Forms!GeneralLedger!SelectedJournal=[SourceJournal],True,False),True))=True))

GROUP BY [General Ledger...
```
### >Help Category Sort Query
```sql
SELECT DISTINCTROW [>Help].Label, [>Help].Form, [>Help].Category, [>Help].Key

FROM [>Help]

WHERE ((([>Help].Form)=Forms!Help.HelpForm))

ORDER BY [>Help].Label, [>Help].Category;
```
### >Help Query
```sql
SELECT DISTINCTROW [>Help].*

FROM [>Help]

WHERE ((([>Help].Key)=Forms!HelpEdit.CategorySort))

ORDER BY [>Help].Form, [>Help].Category, [>Help].Label;
```
### >Hours Chart Query
```sql
SELECT DISTINCTROW [MIS Hours].Date, Sum(IIf(Not IsNull([General]),0,IIf([ADPNetAccount]>=700,variable("office hrly cost estimate")*[Hours],variable("shop hrly cost estimate")*[Hours]))) AS CostPlus

FROM ([MIS Hours] LEFT JOIN [>Jobs] ON [MIS Hours].[Job ID]=[>Jobs].Key) LEFT JOIN [MIS Personnel] ON [MIS Hours].Employee=[MIS Personnel].Employee

GROUP BY [MIS Hours].Date

HAVING ((([MIS Hours].Date)>=LocalVariable("Form_Hours_DateSort") And ([MIS Hours].Date)<=LocalVariable("Form_Hours_ToDate")...
```
### >Hours Form Query
```sql
SELECT DISTINCTROW [MIS Hours].Date, [MIS Hours].Employee, [MIS Personnel].ADPNetAccount, [MIS Hours].Activity, [MIS Hours].General, [MIS Hours].[Job ID], [MIS Hours].Charge, [MIS Hours].Hours, [MIS Hours].ADPFile, [MIS Hours].Key, [MIS Personnel].DesignRate, [MIS Hours].Cost, [MIS Hours].Rate, [>Jobs].ID AS Job, IIf(IsNull([Activity]),[General],[Activity]) AS AorG, IIf(forms!Hours!DesignRate,[DesignRate]*[hours],IIf(Not IsNull([General]),0,IIf(Forms!Hours.ActualCost,IIf([ADPNetAccount]>=700,([M...
```
### >Hours Query
```sql
SELECT DISTINCTROW [MIS Hours].Date, [MIS Hours].Employee, [MIS Personnel].ADPNetAccount, [MIS Hours].Activity, [MIS Hours].General, [MIS Hours].[Job ID], [MIS Hours].Charge, [MIS Hours].Hours, [MIS Hours].ADPFile, [MIS Hours].Key, [MIS Hours].Cost, [MIS Hours].Rate, [>Jobs].ID AS Job, IIf(IsNull([Activity]),[General],[Activity]) AS AorG, IIf(Not IsNull([General]),0,IIf(Forms!Hours.ActualCost,IIf([ADPNetAccount]>=700,([MIS Hours].Rate+variable("Design OH"))*[Hours],([MIS Hours].Rate+variable("S&...
```
### >Hours Rework Activity Job Query
```sql
SELECT DISTINCTROW [>Jobs].ID, [MIS Hours].Activity, Sum(IIf([ADPNetAccount]>=700,variable("office hrly cost estimate")*[Hours],variable("shop hrly cost estimate")*[Hours])) AS CostPlus, [MIS Hours].[Job ID], Sum(IIf([ADPNetAccount]>=700,variable("office hrly cost estimate")*[Hours],variable("shop hrly cost estimate")*[Hours])) AS HourlyCost, Sum([MIS Hours].Hours) AS SumOfHours

FROM ([MIS Hours] LEFT JOIN [>Jobs] ON [MIS Hours].[Job ID]=[>Jobs].Key) LEFT JOIN [MIS Personnel] ON [MIS Hours].ADP...
```
### >Hours Rework Activity Query
```sql
SELECT DISTINCTROW [MIS Hours].Activity, Sum(IIf(Not IsNull([General]),0,IIf([ADPNetAccount]>=700,variable("office hrly cost estimate")*[Hours],variable("shop hrly cost estimate")*[Hours]))) AS CostPlus, Sum(IIf([ADPNetAccount]>=700,variable("office hrly cost estimate")*[Hours],variable("shop hrly cost estimate")*[Hours])) AS HourlyCost

FROM ([MIS Hours] LEFT JOIN [>Jobs] ON [MIS Hours].[Job ID]=[>Jobs].Key) LEFT JOIN [MIS Personnel] ON [MIS Hours].ADPFile=[MIS Personnel].ADPFile

WHERE (((InSt...
```
### >Hours Rework Activity Top Ten Job Query
```sql
SELECT DISTINCTROW [>Jobs].ID, [MIS Hours].Activity, Sum(IIf([ADPNetAccount]>=700,variable("office hrly cost estimate")*[Hours],variable("shop hrly cost estimate")*[Hours])) AS CostPlus, [MIS Hours].[Job ID], Sum(IIf([ADPNetAccount]>=700,variable("office hrly cost estimate")*[Hours],variable("shop hrly cost estimate")*[Hours])) AS HourlyCost, Sum([MIS Hours].Hours) AS SumOfHours

FROM [>Hours Rework Job Top Ten Chart Query], ([MIS Hours] RIGHT JOIN [>Jobs] ON [MIS Hours].[Job ID] = [>Jobs].Key) ...
```
### >Hours Rework Activity Top Ten Query
```sql
SELECT DISTINCTROW [MIS Hours].Activity, Sum(IIf(Not IsNull([General]),0,IIf([ADPNetAccount]>=700,variable("office hrly cost estimate")*[Hours],variable("shop hrly cost estimate")*[Hours]))) AS CostPlus, Sum(IIf([ADPNetAccount]>=700,variable("office hrly cost estimate")*[Hours],variable("shop hrly cost estimate")*[Hours])) AS HourlyCost

FROM [>Hours Rework Job Top Ten Chart Query], ([MIS Hours] RIGHT JOIN [>Jobs] ON [MIS Hours].[Job ID] = [>Jobs].Key) LEFT JOIN [MIS Personnel] ON [MIS Hours].AD...
```
### >Hours Rework Job Chart Query
```sql
SELECT Charts.Text1 AS Expr1, Charts.Value1 AS Expr2

FROM Charts

WHERE (((Charts.Counter)<>0))

ORDER BY Charts.Counter;
```
### >Hours Rework Job Query
```sql
SELECT DISTINCTROW [>Jobs].ID, Sum(IIf(Not IsNull([General]),0,IIf([ADPNetAccount]>=700,variable("office hrly cost estimate")*[Hours],variable("shop hrly cost estimate")*[Hours]))) AS CostPlus, [>Hours by Date].[Job ID], Sum(IIf([ADPNetAccount]>=700,variable("office hrly cost estimate")*[Hours],variable("shop hrly cost estimate")*[Hours])) AS HourlyCost

FROM ([>Hours by Date] LEFT JOIN [MIS Personnel] ON [>Hours by Date].ADPFile=[MIS Personnel].ADPFile) LEFT JOIN [>Jobs] ON [>Hours by Date].[Jo...
```
### >Hours Rework Job Top Ten Chart Query
```sql
SELECT Charts.Text1 AS Expr1, Charts.Value1 AS Expr2

FROM Charts

WHERE (((Charts.Counter)<=10))

ORDER BY Charts.Counter;
```
### >Hours Rework Query
```sql
SELECT DISTINCTROW [MIS Hours].Date, [MIS Hours].Employee, [MIS Personnel].ADPNetAccount, [MIS Hours].Activity, [MIS Hours].General, [MIS Hours].[Job ID], [MIS Hours].Charge, [MIS Hours].Hours, [MIS Hours].ADPFile, [MIS Hours].Key, [MIS Hours].Cost, [MIS Hours].Rate, [>Jobs].ID AS Job, IIf(IsNull([Activity]),[General],[Activity]) AS AorG, IIf(Not IsNull([General]),0,IIf([ADPNetAccount]>=700,variable("office hrly cost estimate")*[Hours],variable("shop hrly cost estimate")*[Hours])) AS CostPlus, I...
```
### >Hours Rework Total Query
```sql
SELECT DISTINCTROW Sum(IIf(Not IsNull([General]),0,IIf([ADPNetAccount]>=700,variable("office hrly cost estimate")*[Hours],variable("shop hrly cost estimate")*[Hours]))) AS CostPlus, Sum(IIf([ADPNetAccount]>=700,variable("office hrly cost estimate")*[Hours],variable("shop hrly cost estimate")*[Hours])) AS HourlyCost

FROM ([MIS Hours] LEFT JOIN [>Jobs] ON [MIS Hours].[Job ID]=[>Jobs].Key) LEFT JOIN [MIS Personnel] ON [MIS Hours].ADPFile=[MIS Personnel].ADPFile

WHERE (((InStr(1,[Activity],"Rework...
```
### >Hours Rework Yearly Activity Query
```sql
SELECT DISTINCTROW Mid([Activity],4,Len([Activity])-10) & " " & Year([Date]) AS Label, Sum(IIf(Not IsNull([General]),0,IIf([ADPNetAccount]>=700,variable("office hrly cost estimate")*[Hours],variable("shop hrly cost estimate")*[Hours]))) AS CostPlus

FROM ([MIS Hours] LEFT JOIN [>Jobs] ON [MIS Hours].[Job ID]=[>Jobs].Key) LEFT JOIN [MIS Personnel] ON [MIS Hours].ADPFile=[MIS Personnel].ADPFile

WHERE (((InStr(1,[Activity],"Rework",0))<>0) And (([MIS Hours].Date)>=Forms!Hours!DateSort And ([MIS Ho...
```
### >Hours Rework Yearly Total Query
```sql
SELECT DISTINCTROW Year([Date]) AS [Year], Sum(IIf(Not IsNull([General]),0,IIf([ADPNetAccount]>=700,variable("office hrly cost estimate")*[Hours],variable("shop hrly cost estimate")*[Hours]))) AS CostPlus

FROM ([MIS Hours] LEFT JOIN [>Jobs] ON [MIS Hours].[Job ID]=[>Jobs].Key) LEFT JOIN [MIS Personnel] ON [MIS Hours].ADPFile=[MIS Personnel].ADPFile

WHERE (((InStr(1,[Activity],"Rework",0))<>0) And (([MIS Hours].Date)>=Forms!Hours!DateSort And ([MIS Hours].Date)<=forms!Hours!ToDate))

GROUP BY Y...
```
### >Hours Trend Chart Query
```sql
SELECT DISTINCTROW [MIS Hours].Date, [MIS Hours].Employee, [MIS Personnel].ADPNetAccount, [MIS Hours].Activity, [MIS Hours].General, [MIS Hours].[Job ID], [MIS Hours].Charge, [MIS Hours].Hours, [MIS Hours].ADPFile, [MIS Hours].Key, [MIS Hours].Cost, [MIS Hours].Rate, [>Jobs].ID AS Job, IIf(IsNull([Activity]),[General],[Activity]) AS AorG, IIf(Not IsNull([General]),0,IIf([ADPNetAccount]>=700,variable("office hrly cost estimate")*[Hours],variable("shop hrly cost estimate")*[Hours])) AS CostPlus, I...
```
### >Hours Trend Rework Chart Query
```sql
SELECT DISTINCTROW [MIS Hours].Date, Sum(IIf(Not IsNull([General]),0,IIf([ADPNetAccount]>=700,variable("office hrly cost estimate")*[Hours],variable("shop hrly cost estimate")*[Hours]))) AS CostPlus

FROM ([MIS Hours] LEFT JOIN [>Jobs] ON [MIS Hours].[Job ID]=[>Jobs].Key) LEFT JOIN [MIS Personnel] ON [MIS Hours].Employee=[MIS Personnel].Employee

WHERE (((InStr(1,[Activity],"Rework",0))<>0))

GROUP BY [MIS Hours].Date

HAVING ((([MIS Hours].Date)>=Format(Forms!Hours!Todate,"mm/dd/" & Year(Forms!...
```
### >Hours by Date
```sql
SELECT DISTINCTROW [MIS Hours].*

FROM [MIS Hours]

WHERE ((([MIS Hours].Date)>=Localvariable("Form_Hours_DateSort") And ([MIS Hours].Date)<=Localvariable("Form_Hours_ToDate")));
```
### >Hours by Job Query
```sql
SELECT DISTINCTROW [>Jobs].ID, [MIS Hours].[Job ID], [MIS Hours].Date, [MIS Hours].Employee, [MIS Hours].Activity, [MIS Hours].General, [MIS Hours].Hours, [MIS Hours].Key

FROM [MIS Hours] INNER JOIN [>Jobs] ON [MIS Hours].[Job ID]=[>Jobs].Key

ORDER BY [>Jobs].ID, [MIS Hours].Date DESC , [MIS Hours].Employee, [MIS Hours].Activity, [MIS Hours].General;
```
### >Income Statement  FY Query
```sql
SELECT DISTINCTROW [General Ledger Income Statement FY].key, [General Ledger Income Statement FY].FY

FROM [General Ledger Income Statement FY];
```
### >IncomeStatement Accounts Report Query
```sql
SELECT DISTINCTROW Left([order],1) AS Category, [>Balance Sheet All Accounts Report Query].Order, [>Balance Sheet All Accounts Report Query].Heading, [>Balance Sheet All Accounts Report Query].SubHeading, [>Balance Sheet All Accounts Report Query].Account, [>Balance Sheet All Accounts Report Query].Account AS Sort, [>Balance Sheet All Accounts Report Query].BeginningBalance, [>Balance Sheet All Accounts Report Query].PreviousBalance, [credit]-[debit] AS Net, [previouscredit]-[previousdebit] AS P...
```
### >Invoices Query
```sql
SELECT DISTINCTROW [Purchase Journal].SupplierID, [Purchase Journal].InvoiceDate, [Purchase Journal].InvoiceNo, [Purchase Journal].TotalAmount

FROM [Purchase Journal]

WHERE ((([Purchase Journal].SupplierID)=Forms!PurchaseJournalEntry.Supplier))

ORDER BY [Purchase Journal].InvoiceDate;
```
### >Job Names Query
```sql
SELECT DISTINCTROW [>Jobs].Key, [>Jobs].ID, [>Resources].ID

FROM [>Jobs] LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key

WHERE ((([>Jobs].Closed)=False) AND (([>Jobs].Estimate)=False))

ORDER BY [>Jobs].ID

WITH OWNERACCESS OPTION;
```
### >Jobs All Query
```sql
SELECT DISTINCTROW [>Jobs].Key, [>Jobs].ID, [>Jobs].Closed, [>Jobs].Estimate

FROM [>Jobs]

WHERE ((([>Jobs].ID) Is Not Null))

ORDER BY [>Jobs].ID;
```
### >Jobs Form Query
```sql
SELECT DISTINCTROW [>Jobs].*, [>Resources].ID

FROM [>Jobs] LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key

WHERE ((([>Jobs].Key)=Forms!Jobs.JobName))

ORDER BY [>Jobs].ID;
```
### >Jobs Job Query
```sql
SELECT DISTINCTROW [>Jobs].Key, [>Jobs].ID, [>Jobs].Closed

FROM [>General Ledger Query] INNER JOIN [>Jobs] ON [>General Ledger Query].Job=[>Jobs].Key

WHERE ((([>Jobs].ID) Is Not Null) AND (([>Jobs].Estimate)=False))

ORDER BY [>Jobs].ID;
```
### >Jobs Query
```sql
SELECT DISTINCTROW [>Jobs].Key, [>Jobs].ID, [>Jobs].Closed

FROM [>Jobs]

WHERE ((([>Jobs].ID) Is Not Null) AND (([>Jobs].Estimate)=False))

ORDER BY [>Jobs].Closed DESC , [>Jobs].ID;
```
### >Loan Journal Query
```sql
SELECT DISTINCTROW [Loan Journal].*, [Loan Journal].Posted AS Expr1

FROM [Loan Journal]

WHERE ((([Loan Journal].Posted)=No));
```
### >MIS Hours Query
```sql
SELECT DISTINCTROW [MIS Hours].*

FROM [MIS Hours]

ORDER BY [MIS Hours].Date DESC , [MIS Hours].Activity, [MIS Hours].General;
```
### >Main Menu Query
```sql
SELECT DISTINCTROW [>Settings].Key, [>Settings].Logo, [>Settings].ReportHeading

FROM [>Settings]

WHERE ((([>Settings].Key)=1))

ORDER BY [>Settings].Key;
```
### >ManagedByQuery
```sql
SELECT DISTINCTROW Summary.Sch2 AS Expr1

FROM Summary

GROUP BY Summary.Sch2

ORDER BY Summary.Sch2;
```
### >Payable Accounts Query
```sql
SELECT DISTINCTROW [MIS Accounts].Number, [MIS Accounts].Account

FROM [MIS Accounts]

WHERE (((InStr([Account],"Accounts Payable"))<>"0"))

ORDER BY [MIS Accounts].Number

WITH OWNERACCESS OPTION;
```
### >Payor Jobs Query
```sql
SELECT DISTINCTROW [>Jobs].Key, [>Jobs].ID

FROM [>Jobs]

WHERE ((([>Jobs].Customer)=Forms!Receipts.Payor) And (([>Jobs].Estimate)=False) And (([>Jobs].Closed)=False))

ORDER BY [>Jobs].ID;
```
### >Payroll ADPNetAccount Query
```sql
SELECT DISTINCTROW [MIS Personnel].ADPNetAccount, [MIS Accounts].Account

FROM [MIS Personnel] LEFT JOIN [MIS Accounts] ON [MIS Personnel].ADPNetAccount=[MIS Accounts].Number

GROUP BY [MIS Personnel].ADPNetAccount, [MIS Accounts].Account

HAVING ((([MIS Personnel].ADPNetAccount)>0));
```
### >Payroll Benefit AFLAC
```sql
SELECT [>Payroll Query].ADPFile, Sum([General Ledger].CreditAmount) AS AFLACAmount

FROM [>Payroll Query] LEFT JOIN [General Ledger] ON [>Payroll Query].Key=[General Ledger].SourceKey

WHERE (((IIf(InStr([SourceTransaction],"Optional")<>0 Or InStr([SourceTransaction],"Dental")<>0,True,False))=True))

GROUP BY [>Payroll Query].ADPFile;
```
### >Payroll Benefit FSA
```sql
SELECT [>Payroll Query].ADPFile, [General Ledger].AccountNumber, Sum([General Ledger].CreditAmount) AS FSAAmount

FROM [>Payroll Query] LEFT JOIN [General Ledger] ON [>Payroll Query].Key=[General Ledger].SourceKey

WHERE (((IIf(InStr([SourceTransaction],"FSA")<>0,True,False))=True))

GROUP BY [>Payroll Query].ADPFile, [General Ledger].AccountNumber;
```
### >Payroll Benefit Medical
```sql
SELECT [>Payroll Query].ADPFile, [General Ledger].AccountNumber, Sum([General Ledger].CreditAmount) AS MedicalAmount

FROM ([>Payroll Query] LEFT JOIN [General Ledger] ON [>Payroll Query].Key=[General Ledger].SourceKey) LEFT JOIN [MIS Personnel] ON [>Payroll Query].ADPFile=[MIS Personnel].ADPFile

WHERE (((IIf([medicalAccount]=[AccountNumber],True,False))=True) AND ((IIf(InStr([SourceTransaction],"Medical")<>0 And InStr([SourceTransaction],"FSA")=0,True,False))=True))

GROUP BY [>Payroll Query]....
```
### >Payroll Birth Date Query
```sql
SELECT DISTINCTROW [MIS Personnel].ADPName, [MIS Personnel].BirthDate AS BirthDate, [MIS Personnel].ADPFile, [MIS Personnel].Closed, [MIS Personnel].TerminationDate, Format([BirthDate],"mm") AS [Month], Format([BirthDate],"dd") AS [Day], Format([BirthDate],"yyyy") AS [Year], Format(DateDiff("d",[BirthDate],Now())/365,"#.0") AS Years, Format([BirthDate],"mmmm") AS TheMonth

FROM [MIS Personnel]

WHERE ((([MIS Personnel].ADPFile)>5) AND (([MIS Personnel].Closed)=False) AND (([MIS Personnel].Termin...
```
### >Payroll Bonus Query
```sql
SELECT DISTINCTROW [MIS Personnel].ADPName, [Payroll Journal].CheckNumber, [Payroll Journal].CheckDate, [Payroll Journal].Bonus, [Payroll Journal].ADPFile, [Payroll Journal].Gross

FROM [Payroll Journal] LEFT JOIN [MIS Personnel] ON [Payroll Journal].ADPFile=[MIS Personnel].ADPFile

WHERE ((([MIS Personnel].ADPName) Is Not Null) And (([Payroll Journal].CheckDate)>=Forms!Payroll.FromDate And ([Payroll Journal].CheckDate)<=Forms!Payroll.ToDate))

ORDER BY [MIS Personnel].ADPName, [Payroll Journal]...
```
### >Payroll Date Query
```sql
SELECT DISTINCTROW [Payroll Journal].CheckDate

FROM [Payroll Journal]

GROUP BY [Payroll Journal].CheckDate

ORDER BY [Payroll Journal].CheckDate DESC;
```
### >Payroll Employee Query
```sql
SELECT DISTINCTROW [MIS Personnel].ADPName AS Employee, [MIS Personnel].ADPNetAccount AS Account, [MIS Personnel].ADPFile AS File, [MIS Personnel].TerminationDate AS Terminated

FROM [MIS Personnel]

WHERE ((([MIS Personnel].ADPFile)>3))

ORDER BY [MIS Personnel].Closed DESC , [MIS Personnel].ADPName;
```
### >Payroll Employee Sort Query
```sql
SELECT DISTINCTROW [Payroll Journal].*, [MIS Personnel].ADPName

FROM [Payroll Journal] LEFT JOIN [MIS Personnel] ON [Payroll Journal].ADPFile=[MIS Personnel].ADPFile

WHERE ((([MIS Personnel].ADPName)=Forms!Payroll.SelectedPayee) And (([Payroll Journal].CheckDate)>=Forms!Payroll!FromDate And ([Payroll Journal].CheckDate)<=Forms!Payroll!ToDate))

ORDER BY [Payroll Journal].Closed DESC , [Payroll Journal].CheckDate DESC , [Payroll Journal].CheckNumber DESC , [MIS Personnel].ADPName DESC;
```
### >Payroll Employer Tax
```sql
SELECT [>Payroll Query].ADPFile, [General Ledger].AccountNumber, Sum([General Ledger].DebitAmount) AS Employertax

FROM ([>Payroll Query] LEFT JOIN [General Ledger] ON [>Payroll Query].Key=[General Ledger].SourceKey) LEFT JOIN [MIS Personnel] ON [>Payroll Query].ADPFile=[MIS Personnel].ADPFile

WHERE (((IIf([employeraccount]=[AccountNumber],True,False))=True) AND ((IIf(InStr([SourceTransaction],"tax")<>0,True,False))=True))

GROUP BY [>Payroll Query].ADPFile, [General Ledger].AccountNumber;
```
### >Payroll Field Query
```sql
SELECT DISTINCTROW [Payroll Journal].OverTime, [Payroll Journal].Vacation, [Payroll Journal].Holiday, [Payroll Journal].RetroactiveVacation, [Payroll Journal].RetroactiveHoliday, [Payroll Journal].Bonus, [Payroll Journal].Retroactive, [Payroll Journal].Other

FROM [Payroll Journal];
```
### >Payroll GL Query
```sql
SELECT DISTINCTROW [Payroll Journal].*, [MIS Personnel].WitholdingAccount, [MIS Personnel].ADPName, [MIS Personnel].ADPNetAccount, [MIS Personnel].Text2, [MIS Personnel].TerminationDate, [MIS Personnel].BonusPlan, [MIS Personnel].Closed, [Payroll Journal].Closed, [MIS Personnel].EmploymentDate, [MIS Personnel].Rate

FROM [Payroll Journal], [MIS Personnel]

WHERE (((IIf([CheckDate]>=Forms!GeneralLedger.FromDate And [CheckDate]<=Forms!GeneralLedger.ToDate,True,False))=True) And (([Payroll Journal]...
```
### >Payroll Hire Date Query
```sql
SELECT DISTINCTROW [MIS Personnel].ADPName, [MIS Personnel].EmploymentDate, [MIS Personnel].TerminationDate, [MIS Personnel].Closed, [MIS Personnel].Rate, [MIS Personnel].CompensationChange, [MIS Personnel].ADPFile, Format([EmploymentDate],"mm") AS [Month], Format([EmploymentDate],"dd") AS [Day], Format([EmploymentDate],"yyyy") AS [Year], Format(DateDiff("d",[EmploymentDate],Now())/365,"#.0") AS Years, Format([EmploymentDate],"mmmm") AS TheMonth, IIf(Year([employmentDate])<Year(Now()),Format(Dat...
```
### >Payroll Hired Date Query
```sql
SELECT DISTINCTROW [MIS Personnel].ADPName, [MIS Personnel].EmploymentDate, [MIS Personnel].Text2, [MIS Personnel].TerminationDate, [MIS Personnel].Closed, IIf(IsNull([TerminationDate]),[Rate],0) AS TheRate, [MIS Personnel].CompensationChange, [MIS Personnel].ADPFile, Format([TerminationDate],"mmmm") AS [Month], Format([EmploymentDate],"dd") AS [Day], Format([EmploymentDate],"yyyy") AS [Year], Format(DateDiff("d",[EmploymentDate],[TerminationDate])/365,"#.0") AS Years, Format([EmploymentDate],"m...
```
### >Payroll Hired and Fired Date Query
```sql
SELECT DISTINCTROW IIf(Not IsNull([terminationdate]) And [employmentdate]>=Forms!Payroll!FromDate,"Hired and Terminated",IIf(Not IsNull([terminationdate]),"Terminated","Hired")) AS HiredorFired, [MIS Personnel].ADPName, [MIS Personnel].EmploymentDate, [MIS Personnel].Text2, [MIS Personnel].TerminationDate, [MIS Personnel].Closed, IIf([TerminationDate] Is Null,[Rate],IIf([employmentdate]>=forms!Payroll!fromdate And [terminationdate]<forms!Payroll!todate,0,[rate]*-1)) AS TheRate, [MIS Personnel].A...
```
### >Payroll Query
```sql
SELECT [Payroll Journal].*, nnez([Field3])+nnez([Roth]) AS Retirement

FROM [Payroll Journal]

WHERE (((IIf([CheckDate]>=Forms!Payroll.FromDate And [CheckDate]<=Forms!Payroll.ToDate,True,False))=True) And (([Payroll Journal].Void)=False))

ORDER BY [Payroll Journal].CheckDate DESC , [Payroll Journal].Closed DESC , [Payroll Journal].CheckNumber DESC , [Payroll Journal].Employee DESC;
```
### >Payroll Query copy
```sql
SELECT [Payroll Journal].*, [MIS Personnel].WitholdingAccount, [MIS Personnel].Text2, [MIS Personnel].TerminationDate, nnez([Field3])+nnez([Roth]) AS Retirement, [MIS Personnel].BonusPlan, [MIS Personnel].Closed, [MIS Personnel].EmploymentDate, [MIS Personnel].Rate, [MIS Personnel].ADPName

FROM [Payroll Journal] LEFT JOIN [MIS Personnel] ON [Payroll Journal].ADPFile=[MIS Personnel].ADPFile

WHERE ((([MIS Personnel].ADPName)=IIf(Forms!Payroll!SelectPayee,Forms!Payroll!SelectedPayee,[ADPName])) A...
```
### >Payroll Report GL Query
```sql
SELECT DISTINCTROW [MIS Personnel].ADPName, [MIS Personnel].Employee, [Payroll Journal].CheckDate, [Payroll Journal].Field3, [Payroll Journal].Commission, [Field3]+[commission] AS Expr1

FROM ([Payroll Journal] LEFT JOIN MISHoursADPFileEmployee ON [Payroll Journal].ADPFile=MISHoursADPFileEmployee.ADPFile) LEFT JOIN [MIS Personnel] ON MISHoursADPFileEmployee.Employee=[MIS Personnel].Employee

WHERE ((([Field3]+[commission])<>0) And ((IIf([CheckDate]>=Forms!GeneralLedger.FromDate And [CheckDate]<=...
```
### >Payroll Report Query
```sql
SELECT DISTINCTROW [MIS Personnel].ADPName, [MIS Personnel].Employee, [Payroll Journal].CheckDate, [Payroll Journal].Field3, [Payroll Journal].Commission, [Field3]+[commission] AS Expr1

FROM ([Payroll Journal] LEFT JOIN MISHoursADPFileEmployee ON [Payroll Journal].ADPFile=MISHoursADPFileEmployee.ADPFile) LEFT JOIN [MIS Personnel] ON MISHoursADPFileEmployee.Employee=[MIS Personnel].Employee

WHERE ((([Field3]+[commission])<>0) And ((IIf([CheckDate]>=Forms!Payroll.FromDate And [CheckDate]<=Forms!...
```
### >Payroll Report Roth Query
```sql
SELECT DISTINCTROW [MIS Personnel].ADPName, [MIS Personnel].Employee, [Payroll Journal].CheckDate, [Payroll Journal].Roth, [Payroll Journal].RothLoan, [Roth]+[RothLoan] AS Expr1

FROM ([Payroll Journal] LEFT JOIN MISHoursADPFileEmployee ON [Payroll Journal].ADPFile = MISHoursADPFileEmployee.ADPFile) LEFT JOIN [MIS Personnel] ON MISHoursADPFileEmployee.Employee = [MIS Personnel].Employee

WHERE ((([Roth]+[RothLoan])<>0) AND ((IIf([CheckDate]>=[Forms]![GeneralLedger].[FromDate] And [CheckDate]<=[F...
```
### >Payroll Roth Report Query
```sql
SELECT DISTINCTROW [MIS Personnel].ADPName, [MIS Personnel].Employee, [Payroll Journal].CheckDate, [Payroll Journal].Field3, [Payroll Journal].Commission, [Payroll Journal].Roth, [Payroll Journal].RothLoan, [Roth]+[RothLoan] AS Expr1

FROM ([Payroll Journal] LEFT JOIN MISHoursADPFileEmployee ON [Payroll Journal].ADPFile=MISHoursADPFileEmployee.ADPFile) LEFT JOIN [MIS Personnel] ON MISHoursADPFileEmployee.Employee=[MIS Personnel].Employee

WHERE ((([Roth]+[RothLoan])<>0) And ((IIf([CheckDate]>=Fo...
```
### >Payroll Termination Date Query
```sql
SELECT DISTINCTROW [MIS Personnel].ADPName, [MIS Personnel].EmploymentDate, [MIS Personnel].Text2, [MIS Personnel].TerminationDate, [MIS Personnel].Closed, [MIS Personnel].Rate, [MIS Personnel].CompensationChange, [MIS Personnel].ADPFile, Format([TerminationDate],"mmmm") AS [Month], Format([EmploymentDate],"dd") AS [Day], Format([TerminationDate],"yyyy") AS [Year], Format(DateDiff("d",[EmploymentDate],[TerminationDate])/365,"#.0") AS Years, Format([EmploymentDate],"mmmm") AS TheMonth, IIf(Year([...
```
### >Personnel Query
```sql
SELECT DISTINCTROW [MIS Personnel].Employee, [MIS Personnel].Key, [MIS Personnel].Rate, [MIS Personnel].ADPFile, [MIS Personnel].ADPName, [MIS Personnel].ADPNetAccount, [MIS Personnel].WitholdingAccount, [MIS Personnel].MedicalAccount, [MIS Personnel].EmployerAccount, [MIS Personnel].MiscAccount

FROM [MIS Personnel]

ORDER BY [MIS Personnel].Employee

WITH OWNERACCESS OPTION;
```
### >Print Checks Query
```sql
SELECT DISTINCTROW [Purchase Journal].CheckNumber, [Purchase Journal].Key, [Purchase Journal].Due, [Purchase Journal].InvoiceDate, [>Resources].ID, [Purchase Journal].InvoiceNo, [Purchase Journal].Paid, [Purchase Journal].Pay, [Purchase Journal].SupplierID, [Purchase Journal].AccountNo, [Purchase Journal].TotalAmount, [Purchase Journal].DebitAmount, [Purchase Journal].Terms, [Purchase Journal].OK, [>Resources].CompanyName, [>Resources].Address, [>Resources].State, [>Resources].Zip, [>Resources]....
```
### >Purchase Journal Entry Date
```sql
SELECT DISTINCTROW [Purchase Journal].EntryDate

FROM [Purchase Journal]

GROUP BY [Purchase Journal].EntryDate

ORDER BY [Purchase Journal].EntryDate DESC;
```
### >Purchase Journal Loans Query
```sql
SELECT DISTINCTROW [Purchase Journal].*

FROM [Purchase Journal]

WHERE ((([Purchase Journal].Posted)=No) And (([Purchase Journal].SupplierID)=Forms!PurchaseJournalEntryLoans!Supplier))

ORDER BY [Purchase Journal].Posted DESC , [Purchase Journal].InvoiceDate, [Purchase Journal].AccountNo;
```
### >Purchase Journal Query
```sql
SELECT DISTINCTROW [Purchase Journal].*, [Purchase Journal].Posted

FROM [Purchase Journal]

WHERE ((([Purchase Journal].Posted)=No));
```
### >Purchase Journal View Query
```sql
SELECT DISTINCTROW [Purchase Journal].*, [MIS Accounts].Account

FROM [Purchase Journal] LEFT JOIN [MIS Accounts] ON [Purchase Journal].AccountNo=[MIS Accounts].Number

ORDER BY [Purchase Journal].Due, [Purchase Journal].CheckNumber, [Purchase Journal].InvoiceDate, [Purchase Journal].SupplierID, [Purchase Journal].InvoiceNo;
```
### >Purchase Journal View ToPay Loans Query
```sql
SELECT DISTINCTROW [Purchase Journal].*, [MIS Accounts].Account

FROM [Purchase Journal] LEFT JOIN [MIS Accounts] ON [Purchase Journal].AccountNo=[MIS Accounts].Number

WHERE ((([Purchase Journal].Paid)=False) AND (([Purchase Journal].PayablesAccount)=202))

ORDER BY [Purchase Journal].Due, [Purchase Journal].InvoiceNo;
```
### >Purchase Journal View ToPay Query
```sql
SELECT DISTINCTROW [Purchase Journal].*, [MIS Accounts].Account

FROM [Purchase Journal] LEFT JOIN [MIS Accounts] ON [Purchase Journal].AccountNo=[MIS Accounts].Number

WHERE ((([Purchase Journal].Paid)=False) AND (([Purchase Journal].PayablesAccount)=201))

ORDER BY [Purchase Journal].Due, [Purchase Journal].InvoiceNo;
```
### >Purchase Journal View Unpaid Query
```sql
SELECT DISTINCTROW [Purchase Journal].Due, [>Resources].ID, [Purchase Journal].InvoiceDate, [Purchase Journal].InvoiceNo, [Purchase Journal].Paid, [Purchase Journal].Pay, [Purchase Journal].PO, [Purchase Journal].AccountNo, [Purchase Journal].TotalAmount, [Purchase Journal].DebitAmount, [Purchase Journal].Terms, [Purchase Journal].OK

FROM [Purchase Journal] LEFT JOIN [>Resources] ON [Purchase Journal].SupplierID=[>Resources].Key

WHERE ((([Purchase Journal].Paid)=False))

ORDER BY [Purchase Jou...
```
### >Purchases COD Suppliers Query
```sql
SELECT DISTINCTROW [>Resources].ID, [>Resources].Key

FROM [>Resources]

WHERE ((([>Resources].Category)=Forms!PurchaseJournalEntryCOD.PayeeCategory))

ORDER BY [>Resources].ID

WITH OWNERACCESS OPTION;
```
### >Purchases Loans Suppliers Query
```sql
SELECT DISTINCTROW [>Resources].ID, [>Resources].Key

FROM [>Resources]

WHERE ((([>Resources].Category)=Forms!PurchaseJournalEntryLoans.PayeeCategory))

ORDER BY [>Resources].ID

WITH OWNERACCESS OPTION;
```
### >Purchases Suppliers Query
```sql
SELECT DISTINCTROW [>Resources].ID, [>Resources].Key

FROM [>Resources]

WHERE ((([>Resources].Category)=Forms!PurchaseJournalEntry.PayeeCategory))

ORDER BY [>Resources].ID

WITH OWNERACCESS OPTION;
```
### >Receipts Check Date Query
```sql
SELECT DISTINCTROW [Receipts Journal].CheckDate

FROM [Receipts Journal]

GROUP BY [Receipts Journal].CheckDate

ORDER BY [Receipts Journal].CheckDate DESC;
```
### >Receipts Journal Query
```sql
SELECT DISTINCTROW [Receipts Journal].*, [>Jobs].ID, [>Resources].ID

FROM ([Receipts Journal] LEFT JOIN [>Jobs] ON [Receipts Journal].Job=[>Jobs].Key) LEFT JOIN [>Resources] ON [Receipts Journal].Payor=[>Resources].Key

WHERE ((([Receipts Journal].Payor)=Forms!Receipts.Payor))

ORDER BY [Receipts Journal].CheckDate DESC , [Receipts Journal].EntryDate DESC , [Receipts Journal].CheckNumber DESC;
```
### >Receipts Payor Query
```sql
SELECT DISTINCTROW [>Resources].ID, [>Resources].Category, [>Resources].Key

FROM [>Resources]

WHERE ((([>Resources].Category)=Forms!Receipts.PayorCategory))

ORDER BY [>Resources].ID

WITH OWNERACCESS OPTION;
```
### >Receivable Accounts Query
```sql
SELECT DISTINCTROW [MIS Accounts].Number, [MIS Accounts].Account

FROM [MIS Accounts]

WHERE (((InStr([Account],"Accounts Receivable"))<>"0"))

ORDER BY [MIS Accounts].Number

WITH OWNERACCESS OPTION;
```
### >Report Heading Query
```sql
SELECT DISTINCTROW [>Settings].Key, [>Settings].New

FROM [>Settings]

WHERE ((([>Settings].Key)=2));
```
### >Resource Categories Query
```sql
SELECT DISTINCTROW [>Resources].Category

FROM [>Resources]

GROUP BY [>Resources].Category

HAVING ((([>Resources].Category)<>"Library"))

ORDER BY [>Resources].Category

WITH OWNERACCESS OPTION;
```
### >Resources All Query
```sql
SELECT DISTINCTROW [>Resources].*

FROM [>Resources]

WHERE ((([>Resources].Category)<>"Library"))

ORDER BY [>Resources].Category, [>Resources].ID;
```
### >Resources Query
```sql
SELECT DISTINCTROW [>Resources].ID, [>Resources].Category, [>Resources].Key

FROM [>Resources]

ORDER BY [>Resources].Category, [>Resources].ID;
```
### >Roth Query
```sql
SELECT NoDashes([MIS Personnel].SocialSecurity) AS A, Mid([MIS Personnel].ADPName,InStr([MIS Personnel].ADPName,',')+1,Len([MIS Personnel].ADPName)) AS B, Left([MIS Personnel].ADPName,InStr([MIS Personnel].ADPName,',')-1) AS C, Format([MIS Personnel].BIRTHDATE,'mm/dd/yyyy') AS D, Format([MIS Personnel].EmploymentDATE,'mm/dd/yyyy') AS E, Format([MIS Personnel].TerminationDate,'mmddyyyy') AS F, [>401K Hours YTD Query].SumOfHours AS G, [MIS Personnel].Sex AS H, [>401K ADP YTD Query].SumOfGross AS I...
```
### >Sales Incomplete Jobs Query
```sql
SELECT [>Jobs].Key

FROM [>Jobs] LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job

WHERE (((InStr([Sales Journal]!Category,"Install"))=0))

GROUP BY [>Jobs].Key

HAVING (((Max([Sales Journal].TheDate))>=#1/1/2000#))

ORDER BY Max([Sales Journal].TheDate);
```
### >Sales Incomplete Query
```sql
SELECT [>Jobs].Closed, [>Jobs].ID, [>Jobs].Key, [>Jobs].Estimate, Max([Sales Journal].TheDate) AS MaxOfTheDate, [Sales Journal].Journal, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount

FROM [>Jobs] LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job

WHERE ((([Sales Journal].TheDate) Is Null) AND (([Sales Journal].SaleAmount)<>0))

GROUP BY [>Jobs].Closed, [>Jobs].ID, [>Jobs].Key, [>Jobs].Estimate, [Sales Journal].Journal

HAVING ((([>Jobs].Estimate)=False) AND (([Sales Journal].Jou...
```
### >Sales Not Posted Query
```sql
SELECT DISTINCTROW [Sales Journal].*, [>Jobs].ID, [MIS Personnel].Employee, [>Resources].ID AS Resource, [>Jobs].ManagedBy, [>Jobs].SpecifiedBy

FROM (([Sales Journal] LEFT JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key) LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key) LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key

WHERE ((([Sales Journal].Due) Is Not Null) AND (([Sales Journal].Posted)=False) AND (([Sales Journal].InvoiceAmount)<>0) AND ((IIf(InStr([Description...
```
### >Select Database Query
```sql
SELECT DISTINCTROW [>Local Settings].DirectoryPath, [>Local Settings].LocalSettingNumber1

FROM [>Local Settings]

WHERE ((([>Local Settings].DirectoryPath)=Forms!SelectDatabase.PathTo));
```
### >Settings Main Menu Query
```sql
SELECT DISTINCTROW [>CopyRight].*

FROM [>CopyRight];
```
### >Settings Query
```sql
SELECT DISTINCTROW [>Settings].*

FROM [>Settings];
```
### >Source Journal Query
```sql
SELECT DISTINCTROW [>Settings].MenuText

FROM [>Settings]

WHERE ((([>Settings].MenuText)="Disbursements" Or ([>Settings].MenuText)="Receipts"))

ORDER BY [>Settings].MenuText;
```
### >Suppliers Query
```sql
SELECT DISTINCTROW [>Resources].ID, [>Resources].Key, [>Resources].Category

FROM [>Resources]

WHERE ((([>Resources].Category)<>"library"))

ORDER BY [>Resources].Category, [>Resources].ID

WITH OWNERACCESS OPTION;
```
### >Time Summary Query
```sql
SELECT DISTINCTROW [>Hours Query].[Job ID], [>Hours Query].Employee, [>Hours Query].Date, IIf(IsNull([Activity]),[General],[Activity]) AS AorG, Sum([>Hours Query].Hours) AS SumOfHours, [>Hours Query].Activity, [>Hours Query].General, Sum([>Hours Query].Cost) AS SumOfCost, IIf(IsNull([Activity]),"General Hours","Job Hours") AS GorJ

FROM [>Hours Query]

GROUP BY [>Hours Query].[Job ID], [>Hours Query].Employee, [>Hours Query].Date, IIf(IsNull([Activity]),[General],[Activity]), [>Hours Query].Acti...
```
### ADPDetail
```sql
SELECT Sum(ADP.Federal) AS SumOfFederal

FROM ADP

WHERE (((ADP.ADPFile)=2932) And ((ADP.CheckDate)>#1/1/1999# And (ADP.CheckDate)<#1/1/2000#));
```
### AFLAC
```sql
SELECT [MIS Personnel].ADPName, ADP.CheckDate AS Expr1, ADP.CheckNumber AS Expr2, ADP.Insurance AS Expr3, ADP.Dental AS Expr4

FROM ADP, [MIS Personnel]

WHERE (((ADP.CheckDate)>#1/1/2001# And (ADP.CheckDate)<#12/31/2001#))

ORDER BY [MIS Personnel].ADPName, ADP.CheckDate;
```
### AccountsEmployerTaxQuery
```sql
SELECT [MIS Accounts].Number, [MIS Accounts].Account

FROM [MIS Accounts]

WHERE (((InStr([Account],"Employer Tax"))<>"0"))

ORDER BY [MIS Accounts].Number;
```
### AccountsMedicalInsuranceQuery
```sql
SELECT [MIS Accounts].Number, [MIS Accounts].Account

FROM [MIS Accounts]

WHERE (((InStr([Account],"Medical Insurance"))<>"0"))

ORDER BY [MIS Accounts].Number;
```
### AccountsMiscellaneousTaxQuery
```sql
SELECT [MIS Accounts].Number, [MIS Accounts].Account

FROM [MIS Accounts]

WHERE (((InStr([Account],"Tax Expense"))<>"0"))

ORDER BY [MIS Accounts].Number;
```
### AccountsPayrollQuery
```sql
SELECT [MIS Accounts].Number, [MIS Accounts].Account

FROM [MIS Accounts]

WHERE (((InStr([Account],"Payroll"))<>"0"))

ORDER BY [MIS Accounts].Number;
```
### AccountsRetirementQuery
```sql
SELECT [MIS Accounts].Number, [MIS Accounts].Account

FROM [MIS Accounts]

WHERE (((InStr([Account],"Retirement"))<>"0"))

ORDER BY [MIS Accounts].Number;
```
### BalanceSheetAssetLiabilityChart
```sql
SELECT IIf(InStr([localsettingtext5],"Total Current Liability"),"Current Liability","Current Asset") AS Label1, [>Local Settings].LocalSettingText6, [>Local Settings].LocalSettingText5

FROM [>Local Settings]

WHERE ((([>Local Settings].LocalSettingText5)="Balance_Total Current Liability" Or ([>Local Settings].LocalSettingText5)="Balance_Total Current Asset"))

ORDER BY IIf(InStr([localsettingtext5],"Total Current Liability"),"Current Liability","Current Asset") DESC;
```
### BalanceSheetEquityLiabilityChart
```sql
SELECT IIf(InStr([localsettingtext5],"Total Liability"),"Total Liability","Total Equity") AS Label1, [>Local Settings].LocalSettingText6, [>Local Settings].LocalSettingText5

FROM [>Local Settings]

WHERE ((([>Local Settings].LocalSettingText5)="Balance_Total Liability" Or ([>Local Settings].LocalSettingText5)="Balance_Total Stockholder Equity"));
```
### CSQ Report Query
```sql
SELECT DISTINCTROW [>Payroll Query].ADPName AS Expr1, [>Payroll Query].ADPFile, [>Payroll Query].ADPNetAccount AS Expr2, Max([>Payroll Query].EmploymentDate) AS MaxOfEmploymentDate, Max([>Payroll Query].TerminationDate) AS MaxOfTerminationDate, [>Payroll Query].BonusPlan AS Expr3, Sum([>Payroll Query].Regular) AS SumOfRegular, Sum([>Payroll Query].Retroactive) AS SumOfRetroactive, Sum([>Payroll Query].Vacation) AS SumOfVacation, Sum([>Payroll Query].Holiday) AS SumOfHoliday, Sum([>Payroll Query]...
```
### Compensation Chart Query
```sql
SELECT [Pay]+nnez([Overtime])+[KRHContribution] AS Total, Format([sumofGross]-NNEZ([sumofBonus]),"$#,#") AS [Your Pay], Format([KRHContribution],"$#,#") AS Benefits, Format([KRHContribution],"$#,#") AS [KRH Contribution], Format([Sumofsocialsecurity]+[sumofmedicare]+nnez([medicalAmount])+NNEZ([retirement]+nnez([FSA])+NNEZ([AFLAC])),"$#,#") AS [Your Contribution]

FROM [Compensation Report Query];
```
### Compensation Report Query
```sql
SELECT DISTINCTROW Sum([>Payroll Query].Gross) AS SumOfGross, Sum([>Payroll Query].Bonus) AS SumOfBonus, Sum([>Payroll Query].Vacation) AS SumOfVacation, Sum([>Payroll Query].RetroactiveVacation) AS SumOfRetroactiveVacation, [>Payroll Employer Tax].Employertax, Sum([>Payroll Query].Holiday) AS SumOfHoliday, Sum([>Payroll Query].Medicare) AS SumOfMedicare, Sum([>Payroll Query].RetroactiveHoliday) AS SumOfRetroactiveHoliday, [>Payroll Benefit Medical].MedicalAmount, [>Payroll Benefit AFLAC].AFLACA...
```
### Credits Report Query
```sql
SELECT DISTINCTROW [>Resources].Category, [>Resources].ID, [Purchase Journal].InvoiceDate, [Purchase Journal].Paid, [Purchase Journal].Key, [Purchase Journal].DebitAmount, [>Jobs].ID, [Purchase Journal].CheckDate, [Purchase Journal].PayablesAccount, [Purchase Journal].SupplierID, [Purchase Journal].InvoiceNo, [Purchase Journal].Void, [Purchase Journal].Posted, [Purchase Journal].CheckKey, [Purchase Journal].CheckNumber

FROM ([Purchase Journal] LEFT JOIN [>Resources] ON [Purchase Journal].Suppli...
```
### Delete Payroll Query
```sql
SELECT [Payroll Journal].*

FROM [Payroll Journal]

WHERE ((([Payroll Journal].CheckDate)=#8/4/2016#));
```
### Deposits Report Query
```sql
SELECT DISTINCTROW [>Jobs].ID, [General Ledger].AccountNumber, [General Ledger].TransactionDate, [General Ledger].DebitAmount, [General Ledger].CreditAmount, [General Ledger].SourceOperative, [>Jobs].Closed, [>Resources].ID, [General Ledger].Job

FROM ([General Ledger] LEFT JOIN [>Jobs] ON [General Ledger].Job=[>Jobs].Key) LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key

WHERE ((([General Ledger].AccountNumber)=205) AND (([>Jobs].Closed)=False));
```
### Employee Roster
```sql
SELECT DISTINCTROW IIf([ADPNetAccount]>700,1,IIf([ADPNetaccount]>600,3,2)) AS Sort, [MIS Personnel].ADPName, [MIS Personnel].Text2 AS [Position], [MIS Personnel].Rate, [MIS Personnel].EmploymentDate, [Payroll Journal].PersonnelKey AS Expr1, [MIS Personnel].ADPFile, IIf([ADPNetAccount]>700,"Office",IIf([ADPNetaccount]>600,"Install","Shop")) AS Department, 1 AS [Count]

FROM [MIS Personnel], [Payroll Journal]

WHERE ((([MIS Personnel].EmploymentDate)<=forms!Payroll!Todate) And ((IIf([TerminationDa...
```
### Export Customer Credits
```sql
SELECT "/C" AS [Transaction Type], [>Resources].SageID AS [Customer ID], 1 AS [Reference #], Format([TransactionDate],"MM/DD/YY") AS [Credit Date], Format(-[DebitAmount],"#.00") AS [Credit Amount], "" AS Description, "" AS [Open Credit #], Left([>Jobs.ID],40) AS [Open Credit Description]

FROM ([>General Ledger Query] LEFT JOIN [>Jobs] ON [>General Ledger Query].Job=[>Jobs].Key) LEFT JOIN [>Resources] ON [>General Ledger Query].SourceOperative=[>Resources].Key

WHERE ((([>General Ledger Query].A...
```
### Export Customer Invoices
```sql
SELECT "/I" AS [Transaction Type], [>Resources].SageID AS [Customer ID], "" AS [Invoice #], Format([TransactionDate],"MM/DD/YY") AS [Invoice Date], Format([DebitAmount],"#.00") AS [Invoice Amount], Left(Left([>Jobs.ID],9) & ":" & [SourceTransaction],20) AS Description, Format([TransactionDate],"mm/dd/yy") AS [Due Date], "" AS [Discount Amount], "" AS [Discount Date], "" AS [Sales Rep #], "205" AS [Sales Account #], Format(0,"#.00") AS [Freight Amount], Format(0,"#.00") AS [1st Sales Tax Amount],...
```
### Export Customer Payments
```sql
SELECT "/P" AS [Transaction Type], [>Resources].SageID AS [Customer ID], "" AS [Check #], Format([TransactionDate],"MM/DD/YY") AS [Payment Date], Format([CreditAmount],"#.00") AS [Payment Amount], Left([>Jobs.ID],12) AS Description, "" AS [Cash Account #], "" AS [Credit Card Company Name], "" AS [Credit Card Holder Name], "" AS [Credit Card Holder Address 1], "" AS [Credit Card Holder Address2], "" AS [Credit Card Holder City], "" AS [Credit Card Holder State], "" AS [Credit Card Holder Zip], ""...
```
### Export Customer Receivable Invoices
```sql
SELECT "/I" AS [Transaction Type], [>Resources].SageID AS [Customer ID], "" AS [Invoice #], Format([TransactionDate],"MM/DD/YY") AS [Invoice Date], Format([DebitAmount],"#.00") AS [Invoice Amount], Left(Left([>Jobs.ID],9) & ":" & [SourceTransaction],20) AS Description, Format([TransactionDate],"mm/dd/yy") AS [Due Date], "" AS [Discount Amount], "" AS [Discount Date], "" AS [Sales Rep #], "" AS [Sales Account #], Format(0,"#.00") AS [Freight Amount], Format(0,"#.00") AS [1st Sales Tax Amount], ""...
```
### Export Customer Receivable Payments
```sql
SELECT "/P" AS [Transaction Type], [>Resources].SageID AS [Customer ID], "" AS [Check #], Format([TransactionDate],"MM/DD/YY") AS [Payment Date], Format([CreditAmount],"#.00") AS [Payment Amount], Left([>Jobs.ID],12) AS Description, "" AS [Cash Account #], "" AS [Credit Card Company Name], "" AS [Credit Card Holder Name], "" AS [Credit Card Holder Address 1], "" AS [Credit Card Holder Address2], "" AS [Credit Card Holder City], "" AS [Credit Card Holder State], "" AS [Credit Card Holder Zip], ""...
```
### Export Customers
```sql
SELECT "/A" AS [Transaction Type], [>Resources].SageID AS [Customer ID], First(Left([>Resources.ID],40)) AS [Customer Name], First(Left(ResourceAddress1([>Resources.Key]),40)) AS [Address Line 1], First(Left(ResourceAddress2([>Resources.Key]),40)) AS [Address Line 2], First(Left(ResourceTown([>Resources.Key]),40)) AS City, [>Resources].State, [>Resources].Zip, First(ResourcePhone1([>Resources].Key)) AS [Finance Contact Telephone Number], "" AS [Finance Contact Name], First(ResourceEmail1([>Resou...
```
### Export Other Invoices
```sql
SELECT "/I" AS [Transaction Type], [>Resources].SageID AS [Customer ID], "" AS [Invoice #], Format([TransactionDate],"MM/DD/YY") AS [Invoice Date], Format([CreditAmount],"#.00") AS [Invoice Amount], Left(Left([>Jobs.ID],9) & ":" & [SourceTransaction],20) AS Description, Format([TransactionDate],"mm/dd/yy") AS [Due Date], "" AS [Discount Amount], "" AS [Discount Date], "" AS [Sales Rep #], [>General Ledger Query].AccountNumber AS [Sales Account #], Format(0,"#.00") AS [Freight Amount], Format(0,"...
```
### Export Other Payments
```sql
SELECT "/P" AS [Transaction Type], [>Resources].SageID AS [Customer ID], "" AS [Check #], Format([TransactionDate],"MM/DD/YY") AS [Payment Date], Format([DebitAmount],"#.00") AS [Payment Amount], Left([>Jobs.ID],12) AS Description, "" AS [Cash Account #], "" AS [Credit Card Company Name], "" AS [Credit Card Holder Name], "" AS [Credit Card Holder Address 1], "" AS [Credit Card Holder Address2], "" AS [Credit Card Holder City], "" AS [Credit Card Holder State], "" AS [Credit Card Holder Zip], "" ...
```
### Export Others
```sql
SELECT "/A" AS [Transaction Type], [>Resources].SageID AS [Customer ID], First(Left([>Resources.ID],40)) AS [Customer Name], First(Left(ResourceAddress1([>Resources.Key]),40)) AS [Address Line 1], First(Left(ResourceAddress2([>Resources.Key]),40)) AS [Address Line 2], First(Left(ResourceTown([>Resources.Key]),40)) AS City, [>Resources].State, [>Resources].Zip, First(ResourcePhone1([>Resources].Key)) AS [Finance Contact Telephone Number], "" AS [Finance Contact Name], First(ResourceEmail1([>Resou...
```
### Export Vendor Adjustments
```sql
SELECT "/C" AS [Transaction Type], [>Resources].SageID AS [Vendor ID], Left([>Resources.ID],20) AS [Invoice #], Format([TransactionDate],"MM/DD/YY") AS [Adjustment Date], Format(-[CreditAmount],"#.00") AS [Adjustment Amount], [>General Ledger Query].SourceTransaction AS Reference, [Purchase Journal].AccountNo AS [1st Distribution Account], Format(-[CreditAmount],"#.00") AS [1st Distribution Amount]

FROM ([>General Ledger Query] LEFT JOIN [Purchase Journal] ON [>General Ledger Query].SourceKey=[...
```
### Export Vendor Invoices
```sql
SELECT "/I" AS [Transaction Type], [>Resources].SageID AS [Vendor ID], Left([SourceTransaction],20) AS [Invoice #], Format([TransactionDate],"MM/DD/YY") AS [Invoice Date], Format([CreditAmount],"#.00") AS [Invoice Amount], Left([SourceTransaction],20) AS Reference, "" AS [Purchase Order Number], Format([TransactionDate]+30,"mm/dd/yy") AS [Terms or Due Date], "" AS [Discount Amount], "" AS [Discount Date], Format([AccountNo]*10,"#0.00") AS [1st Distribution Account], Format([CreditAmount],"#.00")...
```
### Export Vendor Payables
```sql
SELECT "/I" AS [Transaction Type], [>Resources].SageID AS [Vendor ID], Left([SourceTransaction],20) AS [Invoice #], Format([TransactionDate],"MM/DD/YY") AS [Invoice Date], Format([CreditAmount],"#.00") AS [Invoice Amount], Left([SourceTransaction],20) AS Reference, "" AS [Purchase Order Number], Format([TransactionDate]+30,"mm/dd/yy") AS [Terms or Due Date], "" AS [Discount Amount], "" AS [Discount Date], Format([Purchase Journal.AccountNo]*10,"#0.00") AS [1st Distribution Account], Format([Cred...
```
### Export Vendor Payments
```sql
SELECT "/P" AS [Transaction Type], [>Resources].SageID AS [Customer ID], [>General Ledger Query].SourceTransaction AS [Check #], Format([TransactionDate],"MM/DD/YY") AS [Payment Date], Format([>General Ledger Query.DebitAmount],"#.00") AS [Payment Amount], Left([SourceJournal],12) AS Description, "" AS [Cash Account #], "" AS [Credit Card Company Name], "" AS [Credit Card Holder Name], "" AS [Credit Card Holder Address 1], "" AS [Credit Card Holder Address2], "" AS [Credit Card Holder City], "" ...
```
### Export Vendors
```sql
SELECT First("/A") AS [Transaction Type], [>Resources].SageID AS [Vendor ID], First(Left([>Resources].ID,40)) AS [Vendor Name], First(Left(ResourceAddress1([>Resources.Key]),40)) AS [Address Line 1], First(Left(ResourceAddress2([>Resources.Key]),40)) AS [Address Line 2], First(Left(ResourceTown([>Resources.Key]),40)) AS City, First([>Resources].State) AS FirstOfState, First([>Resources].Zip) AS FirstOfZip, First(ResourcePhone1([>Resources].Key)) AS [Finance Contact Telephone Number], First("") A...
```
### GL Account Chart Query
```sql
SELECT DISTINCTROW [General Ledger].TransactionDate, [General Ledger].AccountNumber, Sum([General Ledger].CreditAmount) AS SumOfCreditAmount, Sum([General Ledger].DebitAmount) AS SumOfDebitAmount, IIf(Forms!GeneralLedger!SelectPayee,IIf(Forms!GeneralLedger!SelectedPayee=[SourceOperative],True,False),True) AS Expr1, Min([MIS Accounts].Balance) AS MinOfBalance, IIf(Forms!GeneralLedger!SelectJournal,IIf(Forms!GeneralLedger!SelectedJournal=[SourceJournal],True,False),True) AS Expr2

FROM ([General L...
```
### GL Archive Balance Sheet Report Query
```sql
SELECT DISTINCTROW [MIS Accounts].Number, [MIS Accounts].Account, [MIS Accounts].FY5 AS Balance

FROM [MIS Accounts]

WHERE ((([MIS Accounts].Number)<300))

ORDER BY [MIS Accounts].Number, [MIS Accounts].Account;
```
### GL Balance Sheet Accounts Query
```sql
SELECT DISTINCTROW [General Ledger Balance Sheet].Index, [General Ledger Balance Sheet].Heading, [General Ledger Balance Sheet].SubHeading, [General Ledger Balance Sheet].SubSubHeading, [General Ledger Balance Sheet].[Index Income], [General Ledger Balance Sheet].[Index Expense], [General Ledger Balance Sheet Account Order].FY9, [General Ledger Balance Sheet Account Order].Balance, [General Ledger Balance Sheet Account Order].Account, nnez([SumOfCreditAmount]) AS TheCredit, nnez([SumOfDebitAmoun...
```
### GL Balance Sheet Report Query
```sql
SELECT DISTINCTROW [MIS Accounts].Number, [MIS Accounts].Account, [MIS Accounts].Balance

FROM [MIS Accounts]

WHERE ((([MIS Accounts].Number)<300))

ORDER BY [MIS Accounts].Number, [MIS Accounts].Account;
```
### GL Expense Dated Query
```sql
SELECT DISTINCTROW [>General Ledger Query].AccountNumber, Sum([>General Ledger Query].DebitAmount) AS SumOfDebitAmount, Sum([>General Ledger Query].CreditAmount) AS SumOfCreditAmount

FROM [>General Ledger Query]

WHERE ((([>General Ledger Query].TransactionDate)>=Forms!GeneralLedger!FromDate And ([>General Ledger Query].TransactionDate)<=Forms!GeneralLedger!Todate))

GROUP BY [>General Ledger Query].AccountNumber

HAVING ((([>General Ledger Query].AccountNumber)>=300))

ORDER BY [>General Ledge...
```
### GL Expense Prior Year Dated Query
```sql
SELECT DISTINCTROW [>General Ledger Query].AccountNumber, Sum([>General Ledger Query].DebitAmount) AS SumOfDebitAmount, Sum([>General Ledger Query].CreditAmount) AS SumOfCreditAmount, PriorYear(Forms!GeneralLedger!FromDate) AS FromDate, PriorYear(Forms!GeneralLedger!ToDate) AS ToDate

FROM [>General Ledger Query]

WHERE ((([>General Ledger Query].TransactionDate)>=PriorYear(Forms!GeneralLedger!FromDate) And ([>General Ledger Query].TransactionDate)<=PriorYear(Forms!GeneralLedger!ToDate)))

GROUP...
```
### GL Income Statement Accounts Query
```sql
SELECT DISTINCTROW [General Ledger Income Statement].ReportSort, [General Ledger Income Statement].Index, [General Ledger Income Statement].Heading, [General Ledger Income Statement].SubHeading, [General Ledger Income Statement].Highlight, [General Ledger Income Statement].SubSubHeading, [General Ledger Income Statement].[Index Income], [General Ledger Income Statement].[Index Expense], [General Ledger Income Statement].Detail, [General Ledger Income Statement].Budget, [General Ledger Income Sta...
```
### GL Interim Balance Sheet Report Query
```sql
SELECT DISTINCTROW [MIS Accounts].Number, [MIS Accounts].Account, [MIS Accounts].FY3 AS Balance

FROM [MIS Accounts]

WHERE ((([MIS Accounts].Number)<300))

ORDER BY [MIS Accounts].Number, [MIS Accounts].Account;
```
### GL Sales Dated Query
```sql
SELECT DISTINCTROW Sum([>General Ledger Query].DebitAmount) AS SumOfDebitAmount, Sum([>General Ledger Query].CreditAmount) AS SumOfCreditAmount, -[sumofDebitAmount]+[Sumofcreditamount] AS GrossSales

FROM [>General Ledger Query]

WHERE ((([>General Ledger Query].AccountNumber)>=300 And ([>General Ledger Query].AccountNumber)<400) And (([>General Ledger Query].TransactionDate)>=Forms!GeneralLedger!FromDate And ([>General Ledger Query].TransactionDate)<=Forms!GeneralLedger!Todate));
```
### GLAccountDetailQuery
```sql
SELECT DISTINCTROW [General Ledger].AccountNumber, [General Ledger].SourceJournal, [General Ledger].TransactionDate, [MIS Accounts].Balance, [>Resources].ID, [MIS Accounts].Account, [General Ledger].DebitAmount, [General Ledger].CreditAmount, [General Ledger].SourceTransaction

FROM ([General Ledger] INNER JOIN [MIS Accounts] ON [General Ledger].AccountNumber=[MIS Accounts].Number) LEFT JOIN [>Resources] ON [General Ledger].SourceOperative=[>Resources].Key

WHERE ((([General Ledger].TransactionD...
```
### GLAccountsQuery
```sql
SELECT DISTINCTROW [MIS Accounts].Number, First([MIS Accounts].Account) AS FirstOfAccount

FROM [MIS Accounts] LEFT JOIN [General Ledger] ON [MIS Accounts].Number=[General Ledger].AccountNumber

WHERE (((IIf(Year([TransactionDate])>=Year(Date())-3 Or [Balance]<>0,True,False))=True))

GROUP BY [MIS Accounts].Number

ORDER BY [MIS Accounts].Number;
```
### GLBalanceSheetTemplateQuery
```sql
SELECT DISTINCTROW [General Ledger Balance Sheet].Index, [General Ledger Balance Sheet].ReportSort, [General Ledger Balance Sheet].Heading, [General Ledger Balance Sheet].SubHeading, [General Ledger Balance Sheet].Detail, [General Ledger Balance Sheet].SubSubHeading, [General Ledger Balance Sheet].[Index Income], [General Ledger Balance Sheet].LockAccount, [General Ledger Balance Sheet].[Index Expense], [General Ledger Balance Sheet].Key, SqlResult("Select Account from [MIS Accounts] where Balan...
```
### GLDetailQuery
```sql
SELECT DISTINCTROW [>Resources].Category, [>Resources].ID, [General Ledger].AccountNumber, [General Ledger].SourceJournal, [General Ledger].TransactionDate, [MIS Accounts].Account, [>Resources].Key, [MIS Accounts].Balance, [General Ledger].DebitAmount, [General Ledger].CreditAmount, [General Ledger].SourceOperative, [General Ledger].SourceTransaction

FROM ([General Ledger] INNER JOIN [>Resources] ON [General Ledger].SourceOperative = [>Resources].Key) LEFT JOIN [MIS Accounts] ON [General Ledger...
```
### GLExpense Report Query
```sql
SELECT DISTINCTROW [MIS Accounts].Sort2 AS Expr1, [MIS Accounts].Number, [MIS Accounts].Sort1 AS Expr2, [MIS Accounts].Heading1, [GL Expense Dated Query].SumOfDebitAmount, [GL Expense Dated Query].SumOfCreditAmount, [MIS Accounts].Account, [MIS Accounts].Balance, [MIS Accounts].Heading2 AS Expr3, [GL Expense Prior Year Dated Query].SumOfDebitAmount AS SumofPriorDebitAmount, [GL Expense Prior Year Dated Query].SumOfCreditAmount AS SumofPriorCreditAmount

FROM ([MIS Accounts] LEFT JOIN [GL Expense...
```
### GLExpense Report Query V2
```sql
SELECT DISTINCTROW [MIS Accounts].Sort2 AS Expr1, [MIS Accounts].Number, [MIS Accounts].Sort1 AS Expr2, [MIS Accounts].Heading1, [GL Expense Dated Query].SumOfDebitAmount, [GL Expense Dated Query].SumOfCreditAmount, [MIS Accounts].Account, [MIS Accounts].Balance, [MIS Accounts].Heading2 AS Expr3

FROM [MIS Accounts] LEFT JOIN [GL Expense Dated Query] ON [MIS Accounts].Number=[GL Expense Dated Query].AccountNumber

WHERE ((([MIS Accounts].Number)>=300))

ORDER BY [MIS Accounts].Sort2, [MIS Accoun...
```
### GLIncomeQuery
```sql
SELECT DISTINCTROW GLIncomeQueryBasis.AccountType, GLIncomeQueryBasis.Number, GLIncomeQueryBasis.Account, Sum(GLIncomeQueryBasis.DebitAmount) AS SumOfDebitAmount, Sum(GLIncomeQueryBasis.CreditAmount) AS SumOfCreditAmount

FROM GLIncomeQueryBasis

WHERE (((GLIncomeQueryBasis.Expr1)=True))

GROUP BY GLIncomeQueryBasis.AccountType, GLIncomeQueryBasis.Number, GLIncomeQueryBasis.Account

ORDER BY GLIncomeQueryBasis.Number;
```
### GLIncomeQueryBasis
```sql
SELECT DISTINCTROW [MIS Accounts].Number, [MIS Accounts].Account, [MIS Accounts].AccountType, [>General Ledger Query].DebitAmount, [>General Ledger Query].CreditAmount, [>General Ledger Query].TransactionDate, NotNull([AccountType]) Or [TransactionDate]>=Forms!GeneralLedger.FromDate And [TransactionDate]<=Forms!GeneralLedger.ToDate AS Expr1

FROM [MIS Accounts] LEFT JOIN [>General Ledger Query] ON [MIS Accounts].Number=[>General Ledger Query].AccountNumber

WHERE ((([MIS Accounts].Number)>=300))...
```
### GLIncomeStatementQuery
```sql
SELECT [General Ledger Income Statement].Index, [General Ledger Income Statement].Heading, [General Ledger Income Statement].SubHeading, [General Ledger Income Statement].SubSubHeading, [General Ledger Income Statement].[Account Range from], [General Ledger Income Statement].[Account Range to], [General Ledger Income Statement].[Index Income], [General Ledger Income Statement].[Index Expense], AccountBalance([Account Range From],[Account Range To]) AS AccountBalance

FROM [General Ledger Income ...
```
### GLIncomeTemplatePBudgetQuery
```sql
SELECT DISTINCTROW [General Ledger Income Statement].Index, [General Ledger Income Statement].Detail, [General Ledger Income Statement].ReportSort, [General Ledger Income Statement].Heading, [General Ledger Income Statement].LockAccount, [General Ledger Income Statement].Highlight, [General Ledger Income Statement].SubHeading, [General Ledger Income Statement].SubSubHeading, [General Ledger Income Statement].[Index Income], [General Ledger Income Statement].LockAccount, [General Ledger Income St...
```
### GLIncomeTemplateQuery
```sql
SELECT DISTINCTROW [General Ledger Income Statement].Index, [General Ledger Income Statement].Detail, [General Ledger Income Statement].ReportSort, [General Ledger Income Statement].Heading, [General Ledger Income Statement].LockAccount, [General Ledger Income Statement].Highlight, [General Ledger Income Statement].SubHeading, [General Ledger Income Statement].SubSubHeading, [General Ledger Income Statement].[Index Income], [General Ledger Income Statement].LockAccount, [General Ledger Income St...
```
### GLJobDetailQuery
```sql
SELECT DISTINCTROW [>General Ledger Query].AccountNumber, [>General Ledger Query].TransactionDate, [>General Ledger Query].SourceJournal, [>General Ledger Query].Job, [>Resources].ID, [MIS Accounts].Account, [>General Ledger Query].DebitAmount, [>General Ledger Query].CreditAmount, [>General Ledger Query].SourceOperative

FROM ([>General Ledger Query] INNER JOIN [>Resources] ON [>General Ledger Query].SourceOperative=[>Resources].Key) LEFT JOIN [MIS Accounts] ON [>General Ledger Query].AccountNu...
```
### GLJournalDetailQuery
```sql
SELECT DISTINCTROW [General Ledger].AccountNumber, [General Ledger].TransactionDate, [General Ledger].SourceJournal, [>Resources].ID, [MIS Accounts].Account, [General Ledger].DebitAmount, [General Ledger].CreditAmount, [General Ledger].SourceOperative

FROM ([General Ledger] INNER JOIN [>Resources] ON [General Ledger].SourceOperative=[>Resources].Key) LEFT JOIN [MIS Accounts] ON [General Ledger].AccountNumber=[MIS Accounts].Number

WHERE ((([General Ledger].TransactionDate)>=Forms!GeneralLedger....
```
### GLReceiptsQuery
```sql
SELECT DISTINCTROW [>Jobs].Closed, [>Jobs].ID, Sum([Receipts Journal].Amount) AS SumOfAmount

FROM [>Jobs] INNER JOIN [Receipts Journal] ON [>Jobs].Key=[Receipts Journal].Job

GROUP BY [>Jobs].Closed, [>Jobs].ID

HAVING ((([>Jobs].Closed)=False))

ORDER BY [>Jobs].ID;
```
### GLReceivableQuery
```sql
SELECT DISTINCTROW GLSalesQuery.[>Jobs].ID, GLSalesQuery.LastOfDue, GLSalesQuery.SumOfInvoiceAmount, GLReceiptsQuery.SumOfAmount, GLSalesQuery.[>Resources].ID

FROM GLSalesQuery INNER JOIN GLReceiptsQuery ON GLSalesQuery.[>Jobs].ID=GLReceiptsQuery.ID

ORDER BY GLSalesQuery.[>Jobs].ID;
```
### GLReceivablesQuery
```sql
SELECT DISTINCTROW [MIS Accounts].Number, Last([>General Ledger Query].TransactionDate) AS LastOfTransactionDate, Sum([>General Ledger Query].DebitAmount) AS SumOfDebitAmount, [>Jobs].ID, [MIS Accounts].Account, Sum([>General Ledger Query].CreditAmount) AS SumOfCreditAmount

FROM (([MIS Accounts] RIGHT JOIN [>General Ledger Query] ON [MIS Accounts].Number=[>General Ledger Query].AccountNumber) LEFT JOIN [Sales Journal] ON [>General Ledger Query].SourceKey=[Sales Journal].Key) LEFT JOIN [>Jobs] O...
```
### GLSalesQuery
```sql
SELECT DISTINCTROW [>Jobs].Closed, [>Jobs].ID, Last([Sales Journal].Due) AS LastOfDue, Sum([Sales Journal].InvoiceAmount) AS SumOfInvoiceAmount, [>Resources].ID

FROM ([Sales Journal] RIGHT JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key) LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key

WHERE ((([Sales Journal].Due) Is Not Null))

GROUP BY [>Jobs].Closed, [>Jobs].ID, [>Resources].ID

HAVING ((([>Jobs].Closed)=False))

ORDER BY [>Jobs].ID;
```
### GLSummaryQuery
```sql
SELECT DISTINCTROW [>Resources].Category, [>Resources].ID, [>General Ledger Query].AccountNumber, [>General Ledger Query].SourceJournal, First([>General Ledger Query].TransactionDate) AS FirstOfTransactionDate, [>General Ledger Query].Account, Sum([>General Ledger Query].DebitAmount) AS SumOfDebitAmount, Sum([>General Ledger Query].CreditAmount) AS SumOfCreditAmount, [>General Ledger Query].SourceOperative

FROM [>General Ledger Query] INNER JOIN [>Resources] ON [>General Ledger Query].SourceOpe...
```
### GLTrialBalanceQuery
```sql
SELECT DISTINCTROW [MIS Accounts].Number, [MIS Accounts].Account, [MIS Accounts].Balance, Sum([>General Ledger Query].DebitAmount) AS SumOfDebitAmount, Sum([>General Ledger Query].CreditAmount) AS SumOfCreditAmount, [>Resources].ID

FROM ([MIS Accounts] LEFT JOIN [>General Ledger Query] ON [MIS Accounts].Number=[>General Ledger Query].AccountNumber) LEFT JOIN [>Resources] ON [>General Ledger Query].SourceOperative=[>Resources].Key

WHERE ((([>General Ledger Query].TransactionDate)>=Forms!General...
```
### General Ledger Balance Sheet Account Order
```sql
SELECT [MIS Accounts].BalanceSheetItemSort, [General Ledger].AccountNumber, Sum([General Ledger].CreditAmount) AS SumOfCreditAmount, Sum([General Ledger].DebitAmount) AS SumOfDebitAmount, [MIS Accounts].Account, [MIS Accounts].MDKHeading, [MIS Accounts].Balance, [MIS Accounts].FY9

FROM [MIS Accounts] INNER JOIN [General Ledger] ON [MIS Accounts].Number=[General Ledger].AccountNumber

WHERE ((([General Ledger].TransactionDate)>=forms!generalledger!fromdate And ([General Ledger].TransactionDate)<...
```
### General Ledger Balance Sheet Account Reference
```sql
SELECT [General Ledger Balance Sheet].ReportSort, [General Ledger Balance Sheet].SubSubHeading, [General Ledger Balance Sheet].[Index Income], [General Ledger Balance Sheet].[Index Expense], IIf([ReportSort]<40,"Asset",IIf([ReportSort]<50,"Liability","Equity")) AS SortType

FROM [General Ledger Balance Sheet]

WHERE ((([General Ledger Balance Sheet].ReportSort)<>0))

ORDER BY [General Ledger Balance Sheet].ReportSort;
```
### General Ledger Balance Sheet Sort
```sql
SELECT [General Ledger Balance Sheet].Index, [General Ledger Balance Sheet].ReportSort, [General Ledger Balance Sheet].Heading, [General Ledger Balance Sheet].SubHeading, [General Ledger Balance Sheet].SubSubHeading, [General Ledger Balance Sheet].[Index Income], [General Ledger Balance Sheet].[Index Expense], [General Ledger Balance Sheet].LockAccount, [General Ledger Balance Sheet].Detail, IIf([Index]<40,"Assets","Liabilities") AS AssetorLiability

FROM [General Ledger Balance Sheet]

ORDER BY...
```
### General Ledger Income Statement Account Order
```sql
SELECT [MIS Accounts].BalanceSheetItemSort, [General Ledger].AccountNumber, Sum([General Ledger].CreditAmount) AS SumOfCreditAmount, Sum([General Ledger].DebitAmount) AS SumOfDebitAmount, [MIS Accounts].Account

FROM [MIS Accounts] INNER JOIN [General Ledger] ON [MIS Accounts].Number=[General Ledger].AccountNumber

WHERE ((([General Ledger].TransactionDate)>=forms!generalledger!fromdate And ([General Ledger].TransactionDate)<=forms!generalledger!todate))

GROUP BY [MIS Accounts].BalanceSheetItem...
```
### General Ledger Income Statement Account Reference
```sql
SELECT [General Ledger Income Statement].ReportSort, [General Ledger Income Statement].SubSubHeading, [General Ledger Income Statement].[Index Income], [General Ledger Income Statement].[Index Expense], IIf([ReportSort]<20,"Income","Expense") AS SortType

FROM [General Ledger Income Statement]

WHERE ((([General Ledger Income Statement].ReportSort)<>0))

ORDER BY [General Ledger Income Statement].ReportSort;
```
### Hours Employee Query
```sql
SELECT [MIS Hours].Employee

FROM [MIS Hours] INNER JOIN [MIS Personnel] ON [MIS Hours].Employee=[MIS Personnel].Employee

GROUP BY [MIS Hours].Employee, [MIS Personnel].ADPFile, [MIS Personnel].Closed

HAVING ((([MIS Personnel].Closed)=forms!Hours!ViewArchived))

ORDER BY [MIS Hours].Employee;
```
### Hours Week Query
```sql
SELECT [MIS Hours].Date

FROM [MIS Hours]

GROUP BY [MIS Hours].Date

ORDER BY [MIS Hours].Date DESC;
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
### Job Audit Report Job Query
```sql
SELECT DISTINCTROW [>Sales Incomplete Query].ID, [>Sales Incomplete Query].MaxOfTheDate, [>Sales Incomplete Query].SumOfSaleAmount, [MIS Personnel].Employee

FROM ([>Sales Incomplete Query] LEFT JOIN [>Jobs] ON [>Sales Incomplete Query].Key=[>Jobs].Key) LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key

GROUP BY [>Sales Incomplete Query].ID, [>Sales Incomplete Query].MaxOfTheDate, [>Sales Incomplete Query].SumOfSaleAmount, [MIS Personnel].Employee;
```
### Job Cabinet Hours
```sql
SELECT [>Jobs].ID, [>Jobs].Key, Sum([MIS Hours].Hours) AS SumOfHours, Sum([MIS Hours].Cost) AS SumOfCost, [SumofHours]*Variable("ShopOH")+[SumofCost] AS TotalCost

FROM [>Jobs] LEFT JOIN [MIS Hours] ON [>Jobs].Key=[MIS Hours].[Job ID]

WHERE (((InStr([MIS Hours].Charge,"Cabinet")<>0)=True) And (([>Jobs].Estimate)=False))

GROUP BY [>Jobs].ID, [>Jobs].Key

HAVING (((Last([MIS Hours].Date))>#12/31/1999#))

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
### Job Production
```sql
SELECT [MIS Personnel].Employee, [>Jobs].ID, [>Jobs].ProductionPhase, [Job Cabinet and Counter Sales].LastOfTheDate, [Job Agreement Sales].SumOfSaleAmount, [Job Cabinet and Counter Sales].SumOfSaleAmount, [Job Stone Sales].SumOfSaleAmount, [Job Install Sales].SumOfSaleAmount, [Job Other Sales].SumOfSaleAmount, [Job Project Hours].SumOfHours, [Job Project Hours].SumOfCost, [Job Cabinet Hours].SumOfHours, [Job Cabinet Hours].SumOfCost, [Job Install Hours].SumOfHours, [Job Install Hours].SumOfCost,...
```
### Job Profit Report Job Query
```sql
SELECT DISTINCTROW [>Jobs].ID, [>Jobs].Info1, Last([Sales Journal].TheDate) AS LastOfTheDate1, Min([MIS Personnel].Employee) AS MinOfEmployee, [>Jobs].Completed, [Job Agreement Sales].SumOfSaleAmount, [Job Cabinet and Counter Sales].SumOfSaleAmount, [Job Install Sales].SumOfSaleAmount, [Job Project Hours].TotalCost, [Job Cabinet Hours].TotalCost, [Job Install Hours].TotalCost, IIf(NNEZ([Job Cabinet and Counter Sales].SumofSaleAmount)+NNEZ([Job Install Sales].SumofSaleAmount)-NNEZ([Job Project Ho...
```
### Job Project Hours
```sql
SELECT [>Jobs].ID, [>Jobs].Key, Sum([MIS Hours].Hours) AS SumOfHours, Sum([MIS Hours].Cost) AS SumOfCost, [SumofHours]*Variable("OfficeOH")+[SumofCost] AS TotalCost

FROM [>Jobs] LEFT JOIN [MIS Hours] ON [>Jobs].Key=[MIS Hours].[Job ID]

WHERE (((InStr([MIS Hours].Charge,"Project")<>0)=True) And (([>Jobs].Estimate)=False))

GROUP BY [>Jobs].ID, [>Jobs].Key

HAVING (((Last([MIS Hours].Date))>#12/31/1999#))

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
### MIS All Accounts Query
```sql
SELECT DISTINCTROW [MIS Accounts].Number, [MIS Accounts].Account

FROM [MIS Accounts]

ORDER BY [MIS Accounts].Number;
```
### MIS Hours Date
```sql
SELECT [MIS Hours].Date AS TheDate

FROM [MIS Hours]

GROUP BY [MIS Hours].Date

ORDER BY [MIS Hours].Date DESC;
```
### MISAccountsQuery
```sql
SELECT DISTINCTROW [MIS Accounts].Account, [MIS Accounts].Number

FROM [MIS Accounts]

WHERE ((([MIS Accounts].Number)>=140))

ORDER BY [MIS Accounts].Number;
```
### MISAccountsQueryByNumber
```sql
SELECT DISTINCTROW [MIS Accounts].Number, [MIS Accounts].Account

FROM [MIS Accounts]

WHERE ((([MIS Accounts].Number)=121 Or ([MIS Accounts].Number)>=140))

ORDER BY [MIS Accounts].Number;
```
### MISHoursADPFileEmployee
```sql
SELECT [MIS Hours].ADPFile, [MIS Personnel].Employee

FROM [MIS Hours] INNER JOIN [MIS Personnel] ON [MIS Hours].Employee=[MIS Personnel].Employee

GROUP BY [MIS Hours].ADPFile, [MIS Personnel].Employee

HAVING ((([MIS Hours].ADPFile)<>0))

ORDER BY [MIS Hours].ADPFile;
```
### Payables Chart
```sql
SELECT [Purchase Payee Report Query].TransactionDate, [CreditAmount]-[DebitAmount] AS Payable

FROM [Purchase Payee Report Query];
```
### Payables Report Query
```sql
SELECT DISTINCTROW [>Resources].Category, [>Resources].ID, [Purchase Journal].EntryDate, [Purchase Journal].Paid, [Purchase Journal].Key, [Purchase Journal].DebitAmount, [Purchase Journal].CheckDate, [Purchase Journal].PayablesAccount, [Purchase Journal].SupplierID, [Purchase Journal].InvoiceNo, [Purchase Journal].Void, [Purchase Journal].Posted, [Purchase Journal].CheckKey, [Purchase Journal].CheckNumber

FROM [Purchase Journal] LEFT JOIN [>Resources] ON [Purchase Journal].SupplierID=[>Resource...
```
### Payables Report by Due Date Query
```sql
SELECT DISTINCTROW [>Resources].Category, [>Resources].ID, [Purchase Journal].Due, [Purchase Journal].Paid, [Purchase Journal].Key, [Purchase Journal].DebitAmount, [Purchase Journal].CheckDate, [Purchase Journal].PayablesAccount, [Purchase Journal].SupplierID, [Purchase Journal].InvoiceNo, [Purchase Journal].Void, [Purchase Journal].Posted, [Purchase Journal].CheckKey, [Purchase Journal].CheckNumber

FROM [Purchase Journal] LEFT JOIN [>Resources] ON [Purchase Journal].SupplierID=[>Resources].Key...
```
### Payables Report by Week Query
```sql
SELECT DISTINCTROW IIf([due] Is Null,Null,theweekbegin([Due])) AS DueDate, [>Resources].Category, [>Resources].ID, [Purchase Journal].InvoiceDate, [Purchase Journal].Paid, [Purchase Journal].Key, [Purchase Journal].DebitAmount, [Purchase Journal].CheckDate, [Purchase Journal].PayablesAccount, [Purchase Journal].SupplierID, [Purchase Journal].InvoiceNo, [Purchase Journal].Void, [Purchase Journal].Posted, [Purchase Journal].CheckKey, [Purchase Journal].CheckNumber

FROM [Purchase Journal] LEFT JOI...
```
### Payables_Chart
```sql
SELECT [Purchase Payee Report Query].TransactionDate, [CreditAmount]-[DebitAmount] AS Payable

FROM [Purchase Payee Report Query];
```
### Payables_at_From_Date
```sql
SELECT Sum([Purchase Journal].DebitAmount) AS SumOfDebitAmount

FROM [Purchase Journal]

WHERE ((([Purchase Journal].Posted)=True) And (([Purchase Journal].CheckDate)>=forms!APChecksEntry!FromDate Or ([Purchase Journal].CheckDate) Is Null) And (([Purchase Journal].InvoiceDate)<forms!APChecksEntry!FromDate) And ((IIf(Forms!APChecksEntry!SelectPayee,IIf(Forms!APChecksEntry!SelectedPayee=[SupplierID],True,False),True))=True) And ((IIf(forms!APChecksEntry!PayableAccount=[PayablesAccount],True,False)...
```
### Payroll Chart Overtime Query
```sql
SELECT DISTINCTROW [>Payroll Query].CheckDate, Sum([>Payroll Query].OverTime) AS SumOfOverTime

FROM [>Payroll Query] LEFT JOIN [MIS Personnel] ON [>Payroll Query].ADPFile=[MIS Personnel].ADPFile

WHERE ((([>Payroll Query].Void)=False) And (([>Payroll Query].ADPFile)>2) And (([>Payroll Query].ADPNetAccount)=IIf(Forms!Payroll!SelectADPNet,Forms!Payroll!ADPNetAccount,[>Payroll Query].ADPNetAccount)))

GROUP BY [>Payroll Query].CheckDate;
```
### Payroll Chart Query
```sql
SELECT DISTINCTROW [>Payroll Query].CheckDate, Sum([Gross]-[overtime]-[Bonus]) AS [Base Pay], Sum([>Payroll Query].OverTime) AS OT, Sum([>Payroll Query].Bonus) AS [Annual Bonus]

FROM [>Payroll Query] LEFT JOIN [MIS Personnel] ON [>Payroll Query].ADPFile=[MIS Personnel].ADPFile

WHERE ((([>Payroll Query].Void)=False) And (([>Payroll Query].ADPFile)>2) And (([MIS Personnel].ADPNetAccount)=IIf(Forms!Payroll!SelectADPNet,Forms!Payroll!ADPNetAccount,[ADPNetAccount])) And ((IIf(LocalVariable("Scratch...
```
### Payroll Chart Sales Total Query
```sql
SELECT DISTINCTROW [>Payroll Query].CheckDate, Sum([Gross]-[Bonus]) AS [Payroll Total], Max([Sales Total Payroll Report Query].SumOfSale) AS Sales

FROM ([>Payroll Query] LEFT JOIN [MIS Personnel] ON [>Payroll Query].ADPFile=[MIS Personnel].ADPFile) LEFT JOIN [Sales Total Payroll Report Query] ON [>Payroll Query].CheckDate=[Sales Total Payroll Report Query].SaleDate

WHERE ((([>Payroll Query].Void)=False) And (([>Payroll Query].ADPNetAccount)=IIf(Forms!Payroll!SelectADPNet,Forms!Payroll!ADPNetAc...
```
### Payroll Chart Total Query
```sql
SELECT DISTINCTROW [>Payroll Query].CheckDate, Sum(IIf(Left([ADPNetAccount],1)=5,[Gross]-[Bonus],0)) AS [Shop Total], Sum(IIf(Left([ADPNetAccount],1)=6,[Gross]-[Bonus],0)) AS [Install Total], Sum(IIf(Left([ADPNetAccount],1)=7,[Gross]-[Bonus],0)) AS [Office Total]

FROM [>Payroll Query] LEFT JOIN [MIS Personnel] ON [>Payroll Query].ADPFile=[MIS Personnel].ADPFile

WHERE ((([>Payroll Query].Void)=False) And (([MIS Personnel].ADPNetAccount)=IIf(Forms!Payroll!SelectADPNet,Forms!Payroll!ADPNetAccount...
```
### Payroll Direct Deposit Report Query
```sql
SELECT DISTINCTROW [Payroll Journal].*

FROM [Payroll Journal]

WHERE ((([Payroll Journal].CheckNumber)=0) AND (([Payroll Journal].Void)=False) AND (([Payroll Journal].ADPFile)<=9))

ORDER BY [Payroll Journal].CheckDate, [Payroll Journal].CheckNumber;
```
### Payroll Field Report Query
```sql
SELECT DISTINCTROW [Payroll Journal].CheckDate, [Payroll Journal].CheckNumber, MISHoursADPFileEmployee.Employee

FROM [Payroll Journal] LEFT JOIN MISHoursADPFileEmployee ON [Payroll Journal].ADPFile=MISHoursADPFileEmployee.ADPFile

WHERE ((([Payroll Journal].CheckDate)>=forms!Payroll!fromDate And ([Payroll Journal].CheckDate)<=forms!payroll!todate))

ORDER BY [Payroll Journal].CheckDate DESC , [Payroll Journal].CheckNumber DESC;
```
### Payroll Hours Owed Vacation
```sql
SELECT [Date]+10 AS PayCheck, [MIS Hours].General AS OV, [MIS Hours].Hours, [MIS Hours].ADPFile, [MIS Hours].Employee

FROM [MIS Hours]

WHERE ((([MIS Hours].General)="OV Owed Vacation") AND (([MIS Hours].Date)>=#1/1/2000#));
```
### Payroll Hours Vacation
```sql
SELECT [Date]+10 AS PayCheck, [MIS Hours].General AS V, [MIS Hours].Hours, [MIS Hours].ADPFile, [MIS Hours].Employee

FROM [MIS Hours]

WHERE ((([MIS Hours].General)="V Vacation") AND (([MIS Hours].Date)>=#1/1/2000#));
```
### Payroll Medical Deductions Report Query
```sql
SELECT DISTINCTROW ADP.CheckDate AS Expr1, Sum(ADP.Medical) AS SumOfMedical, Sum(ADP.Insurance) AS SumOfInsurance, Sum(ADP.Dental) AS SumOfDental

FROM ADP

GROUP BY ADP.CheckDate

ORDER BY ADP.CheckDate;
```
### Payroll Medical Deductions Report Query V2
```sql
SELECT DISTINCTROW [General Ledger].TransactionDate AS CheckDate, [General Ledger].AccountNumber, [General Ledger].SourceTransaction, Sum(IIf(InStr([SourceTransaction],"FSA")<>0,[CreditAmount],0)) AS sumofFSA, Sum(IIf(InStr([SourceTransaction],"Optional")<>0,[CreditAmount],0)) AS sumofInsurance, Sum(IIf(InStr([SourceTransaction],"Dental")<>0,[CreditAmount],0)) AS SumofDental, Sum(IIf(InStr([SourceTransaction],"Medical")<>0,[CreditAmount],0)) AS SumofMedical

FROM [General Ledger] LEFT JOIN [>Res...
```
### Payroll Prepay Report Query
```sql
SELECT DISTINCTROW [Payroll Journal].CheckDate, [Gross]-[federal]-[state]-[Payroll Journal].socialsecurity-[medicare]-[field1]-[field2]-[field3] AS Expr1, MISHoursADPFileEmployee.Employee, MISHoursADPFileEmployee.ADPFile

FROM [Payroll Journal] LEFT JOIN MISHoursADPFileEmployee ON [Payroll Journal].ADPFile=MISHoursADPFileEmployee.ADPFile

WHERE ((([Payroll Journal].CheckNumber)=0) AND (([Payroll Journal].Void)=False) AND (([Payroll Journal].ADPFile)>2))

ORDER BY [Payroll Journal].CheckDate, [Pa...
```
### Payroll Report Employee Query
```sql
SELECT DISTINCTROW [>Payroll Employee Sort Query].*

FROM [>Payroll Employee Sort Query]

WHERE ((([>Payroll Employee Sort Query].Void)=False) AND (([>Payroll Employee Sort Query].ADPFile)>2));
```
### Payroll Report GL Query
```sql
SELECT DISTINCTROW [>Payroll GL Query].*, IIf(nnez([checknumber])=0 And [>Payroll GL Query].adpfile>5,[Gross]-[Federal]-[State]-[>Payroll GL Query].SocialSecurity-[Medicare]-[field1]-[field2]-[field3]-[field4]-[field5],0) AS PrePay, [MIS Personnel].WitholdingAccount, IIf([>Payroll GL Query].adpfile=0,[net],0) AS ADPTax, IIf([>Payroll GL Query].adpfile=1,[net],0) AS ADPDirect, IIf([>Payroll GL Query].adpfile=2,[net],0) AS ADPGarnish, IIf([>Payroll GL Query].adpfile>5,[net],0) AS NetNet

FROM [>Pa...
```
### Payroll Report Query
```sql
SELECT DISTINCTROW [>Payroll Query].*, [MIS Personnel].WitholdingAccount

FROM [>Payroll Query] LEFT JOIN [MIS Personnel] ON [>Payroll Query].ADPFile=[MIS Personnel].ADPFile

WHERE ((([>Payroll Query].Void)=False) And (([>Payroll Query].ADPFile)>5) And (([MIS Personnel].ADPNetAccount)=IIf(Forms!Payroll!SelectADPNet,Forms!Payroll!ADPNetAccount,[ADPNetAccount])));
```
### Payroll Report Total Query
```sql
SELECT DISTINCTROW Sum([Gross]-[bonus]) AS [Total Payroll], Sum([>Payroll Query].Bonus) AS [Total Bonus]

FROM [>Payroll Query] LEFT JOIN [MIS Personnel] ON [>Payroll Query].ADPFile=[MIS Personnel].ADPFile

WHERE ((([>Payroll Query].Void)=False) And (([>Payroll Query].ADPFile)>2) And (([>Payroll Query].ADPNetAccount)=IIf(Forms!Payroll!SelectADPNet,Forms!Payroll!ADPNetAccount,[>Payroll Query].ADPNetAccount)));
```
### Payroll Shop Total Query
```sql
SELECT DISTINCTROW [>Payroll Query].CheckDate, Sum([Gross]-[Bonus]) AS Total, Sum([>Payroll Query].OverTime) AS OT, Sum([>Payroll Query].Bonus) AS [Annual Bonus]

FROM [>Payroll Query] LEFT JOIN [MIS Personnel] ON [>Payroll Query].ADPFile=[MIS Personnel].ADPFile

WHERE ((([>Payroll Query].Void)=False) And (([>Payroll Query].ADPFile)>2) And (([>Payroll Query].ADPNetAccount)=IIf(Forms!Payroll!SelectADPNet,Forms!Payroll!ADPNetAccount,[>Payroll Query].ADPNetAccount)) And ((IIf(Left([mis personnel].A...
```
### Payroll Vacation Report Query
```sql
SELECT DISTINCTROW [>Payroll Query].*, [MIS Personnel].WitholdingAccount, [vacationbalance]<>0 Or [AccruedVacation]<>0 Or [retroactivevacation]<>0 Or [vacation]<>0 AS Expr1, DateDiff("d",Format([CheckDate],"mm/dd"),Format([mis personnel].Employmentdate,"mm/dd")) AS Anniversary, [Payroll Hours Vacation].Hours AS V, [Payroll Hours Owed Vacation].Hours AS OV

FROM (([>Payroll Query] LEFT JOIN [MIS Personnel] ON [>Payroll Query].ADPFile=[MIS Personnel].ADPFile) LEFT JOIN [Payroll Hours Vacation] ON ...
```
### PayrollHoursQuery
```sql
SELECT [MIS Hours].Date AS MISHoursDate, [MIS Hours].ADPFile AS FileNo, Sum([MIS Hours].Hours) AS SumOfHours, [Date]+10 AS PayrollDate

FROM [MIS Hours]

GROUP BY [MIS Hours].Date, [MIS Hours].ADPFile, [Date]+10

ORDER BY [MIS Hours].Date DESC;
```
### PersonnelEmployeeJobQuery
```sql
SELECT [MIS Personnel].Text2

FROM [MIS Personnel]

GROUP BY [MIS Personnel].Text2, [MIS Personnel].Text2

HAVING ((([MIS Personnel].Text2)<>""));
```
### PersonnelInsuranceCoQuery
```sql
SELECT [MIS Personnel].HealthInsurancePlan

FROM [MIS Personnel]

GROUP BY [MIS Personnel].HealthInsurancePlan

ORDER BY [MIS Personnel].HealthInsurancePlan;
```
### PersonnelQuery
```sql
SELECT [MIS Personnel].*, [MIS Personnel].Closed

FROM [MIS Personnel]

WHERE ((([MIS Personnel].Closed)=False) AND (([MIS Personnel].Employee) Is Not Null))

ORDER BY [MIS Personnel].Employee;
```
### PersonnelQueryClosed
```sql
SELECT [MIS Personnel].*, [MIS Personnel].Closed

FROM [MIS Personnel]

WHERE ((([MIS Personnel].Closed)=True) AND (([MIS Personnel].Employee) Is Not Null) AND (([MIS Personnel].ADPFile)>5))

ORDER BY [MIS Personnel].Employee;
```
### PersonnelResourceQuery
```sql
SELECT [>Resources].ID, [>Resources].Key, [>Resources].Category

FROM [>Resources]

WHERE (((InStr([Category],"Employee"))<>"0"))

ORDER BY [>Resources].ID;
```
### PersonnelVacationAccrualQuery
```sql
SELECT [>Settings].MacroToRun, [>Settings].MenuCategory

FROM [>Settings]

GROUP BY [>Settings].MacroToRun, [>Settings].MenuCategory, [>Settings].MenuText

HAVING ((([>Settings].MenuText)="VacationAccrual"))

ORDER BY [>Settings].MenuCategory;
```
### Prior Year Query
```sql
SELECT "Prior Year: " & [FY9]-1 AS PriorYear

FROM [MIS Accounts]

WHERE ((([MIS Accounts].Number)=101));
```
### Profit Report Query
```sql
SELECT DISTINCTROW [>Payroll Query].ADPName AS Expr1, [>Payroll Query].ADPFile, [>Payroll Query].ADPNetAccount AS Expr2, Max([>Payroll Query].EmploymentDate) AS MaxOfEmploymentDate, Max([>Payroll Query].TerminationDate) AS MaxOfTerminationDate, Sum([>Payroll Query].Regular) AS SumOfRegular, Sum([>Payroll Query].Retroactive) AS SumOfRetroactive, [>Payroll Query].BonusPlan AS Expr3, Sum([>Payroll Query].Vacation) AS SumOfVacation, Sum([>Payroll Query].Holiday) AS SumOfHoliday, Sum([>Payroll Query]...
```
### Purchase COD Vendor Report Query
```sql
SELECT DISTINCTROW [>Resources].Category, [>Resources].ID, [Purchase Journal].InvoiceDate, [Purchase Journal].DebitAmount, [Purchase Journal].PayablesAccount, [Purchase Journal].InvoiceNo, IIf([Paid],"Paid","Open") AS Status

FROM [Purchase Journal] LEFT JOIN [>Resources] ON [Purchase Journal].SupplierID=[>Resources].Key

WHERE ((([>Resources].Key)=Forms!purchasejournalentryCOD!supplier) And (([Purchase Journal].Void)=False) And (([Purchase Journal].Posted)=True))

ORDER BY [Purchase Journal].In...
```
### Purchase Payee Report Query
```sql
SELECT DISTINCTROW [General Ledger].SourceJournal, [General Ledger].TransactionDate, [General Ledger].AccountNumber, Sum([General Ledger].CreditAmount) AS SumOfCreditAmount, Sum([General Ledger].DebitAmount) AS SumOfDebitAmount, IIf(Forms!APChecksEntry!SelectPayee,IIf(Forms!APChecksEntry!SelectedPayee=[SourceOperative],True,False),True) AS Expr1

FROM [General Ledger] LEFT JOIN [>Resources] ON [General Ledger].SourceOperative=[>Resources].Key

WHERE (((IIf(forms!APChecksEntry!PayableAccount=[Acc...
```
### Purchase Report Query
```sql
SELECT DISTINCTROW [>Resources].Category, [>Resources].ID, [Purchase Journal].InvoiceDate, [Purchase Journal].Paid, [Purchase Journal].Key, [Purchase Journal].DebitAmount, [>Jobs].ID, [Purchase Journal].CheckDate, [Purchase Journal].PayablesAccount, [Purchase Journal].SupplierID, [Purchase Journal].InvoiceNo, [Purchase Journal].Void, [Purchase Journal].Posted, [Purchase Journal].CheckKey, [Purchase Journal].CheckNumber

FROM ([Purchase Journal] LEFT JOIN [>Resources] ON [Purchase Journal].Suppli...
```
### Purchase Vendor Report Query
```sql
SELECT DISTINCTROW [>Resources].Category, [>Resources].ID, [Purchase Journal].InvoiceDate, [Purchase Journal].DebitAmount, [Purchase Journal].PayablesAccount, [Purchase Journal].InvoiceNo, IIf([Paid],"Paid","Open") AS Status

FROM [Purchase Journal] LEFT JOIN [>Resources] ON [Purchase Journal].SupplierID=[>Resources].Key

WHERE ((([>Resources].Key)=Forms!purchasejournalentry!supplier) And (([Purchase Journal].Void)=False) And (([Purchase Journal].Posted)=True))

ORDER BY [Purchase Journal].Invoi...
```
### Purchase by Amount Report Query
```sql
SELECT DISTINCTROW [Purchase Journal].SupplierID, [>Resources].ID, [>Resources].Category, Sum([Purchase Journal].DebitAmount) AS SumOfDebitAmount, [Purchase Journal].PayablesAccount, [Purchase Journal].Void, [Purchase Journal].Posted

FROM ([Purchase Journal] LEFT JOIN [>Resources] ON [Purchase Journal].SupplierID=[>Resources].Key) LEFT JOIN [>Jobs] ON [Purchase Journal].Job=[>Jobs].Key

WHERE ((([Purchase Journal].InvoiceDate)>=Forms!APChecksEntry.FromDate And ([Purchase Journal].InvoiceDate)<=...
```
### Query1
```sql
SELECT Year([CheckDate]) AS Expr1, Sum([Payroll Journal].Vacation) AS SumOfVacation, Sum([Payroll Journal].RetroactiveVacation) AS SumOfRetroactiveVacation

FROM [Payroll Journal]

GROUP BY Year([CheckDate]);
```
### Query2
```sql
SELECT [Payroll Journal].CheckDate, [Gross]-NNEZ([Field1])-NNEZ([Field2])-NNEZ([Field3])-NNEZ([Federal])-NNEZ([State])-NNEZ([Payroll Journal].SocialSecurity)-NNEZ([Medicare]) AS Expr1, [MIS Personnel].Employee, Sum([Payroll Journal].Federal) AS SumOfFederal, Sum([Payroll Journal].State) AS SumOfState, Sum([Payroll Journal].Medicare) AS SumOfMedicare, Sum([Payroll Journal].Field1) AS SumOfField1, Sum([Payroll Journal].Field2) AS SumOfField2, Sum([Payroll Journal].Field3) AS SumOfField3, Sum([Payr...
```
### Query3
```sql
SELECT [Purchase Journal].CheckDate, [Purchase Journal].CheckNumber, [Purchase Journal].CheckKey, [Purchase Journal].Due, [Purchase Journal].DebitAmount, [Purchase Journal].Paid, [>Resources].ID, [Purchase Journal].EntryDate

FROM [Purchase Journal] LEFT JOIN [>Resources] ON [Purchase Journal].SupplierID=[>Resources].Key

WHERE ((([Purchase Journal].DebitAmount)<0) AND (([Purchase Journal].Paid)=True))

ORDER BY [Purchase Journal].CheckDate, [Purchase Journal].CheckNumber;
```
### Query4
```sql
SELECT [Receipts Journal].*

FROM [Receipts Journal]

WHERE ((([Receipts Journal].CheckDate)=#12/31/2012#));
```
### Query5
```sql
SELECT [MIS Accounts].Number, [MIS Accounts].BalanceSheetItemSort, [MIS Accounts].Balance, [MIS Accounts].FY5

FROM [MIS Accounts]

WHERE ((([MIS Accounts].Number)<300))

ORDER BY [MIS Accounts].Number;
```
### Query6
```sql
SELECT [General Ledger].*, [General Ledger].SourceOperative, [General Ledger].TransactionDate

FROM [General Ledger]

WHERE ((([General Ledger].SourceOperative)=1479254058))

ORDER BY [General Ledger].TransactionDate DESC;
```
### Query7
```sql
SELECT [Purchase Journal].*, [Purchase Journal].Key, [>Resources].ID

FROM [Purchase Journal] INNER JOIN [>Resources] ON [Purchase Journal].SupplierID = [>Resources].Key

WHERE ((([Purchase Journal].Key)=13388));
```
### Receipts Report Query
```sql
SELECT DISTINCTROW [>Jobs].ID, [General Ledger].AccountNumber, [General Ledger].SourceJournal, [General Ledger].TransactionDate, [General Ledger].DebitAmount, [General Ledger].CreditAmount, [General Ledger].SourceOperative, [>Jobs].Closed, [>Resources].ID, [General Ledger].Job

FROM ([General Ledger] LEFT JOIN [>Jobs] ON [General Ledger].Job=[>Jobs].Key) LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key

WHERE ((([General Ledger].AccountNumber)=121) AND (([General Ledger].Job) Is Not N...
```
### Receivables Cash Report Query
```sql
SELECT DISTINCTROW [>Jobs].ID, [General Ledger].AccountNumber, [General Ledger].TransactionDate, [General Ledger].DebitAmount, [General Ledger].CreditAmount, [>Jobs].Closed, [>Jobs].Key, [General Ledger].SourceOperative, [>Resources].ID, [General Ledger].SourceJournal

FROM ([General Ledger] LEFT JOIN [>Jobs] ON [General Ledger].Job=[>Jobs].Key) LEFT JOIN [>Resources] ON [>Jobs].Agreement=[>Resources].Key

WHERE ((([General Ledger].AccountNumber)=121) AND (([>Jobs].Closed)=False) AND (([General ...
```
### Receivables GL Report Aged Prep Query
```sql
SELECT DISTINCTROW [Receivables Report Query].[>Jobs].ID, [Receivables Report Query].TransactionDate, [Receivables Report Query].DebitAmount, [Receivables Report Query].CreditAmount, [Receivables Report Query].[>Resources].ID, [Receivables Report Query].AccountNumber

FROM [Receivables Report Query]

WHERE ((([Receivables Report Query].TransactionDate)<=forms!generalledger.todate) And (([Receivables Report Query].AccountNumber)=121))

ORDER BY [Receivables Report Query].[>Jobs].ID;
```
### Receivables GL Report Aged Query
```sql
SELECT DISTINCTROW Max([Receivables GL Report Aged Prep Query].TransactionDate) AS MaxOfTransactionDate, [Receivables GL Report Aged Prep Query].[>Jobs].ID, Sum([Receivables GL Report Aged Prep Query].DebitAmount) AS SumOfDebitAmount, Sum([Receivables GL Report Aged Prep Query].CreditAmount) AS SumOfCreditAmount, [Receivables GL Report Aged Prep Query].[>Resources].ID, Sum([debitamount])-Sum([creditamount]) AS Expr1

FROM [Receivables GL Report Aged Prep Query]

GROUP BY [Receivables GL Report A...
```
### Receivables Job Names
```sql
SELECT [Receivables Owed Query].ID, [Receivables Owed Query].SumOfDebitAmount, [Receivables Owed Query].SumOfCreditAmount, [Receivables Owed Query].Job

FROM [Receivables Owed Query]

WHERE (((([sumofdebitamount]\1<>[sumofcreditamount]\1))=True));
```
### Receivables Owed Query
```sql
SELECT DISTINCTROW [>Resources].ID, [General Ledger].Job, [General Ledger].AccountNumber, Sum([General Ledger].DebitAmount) AS SumOfDebitAmount, Sum([General Ledger].CreditAmount) AS SumOfCreditAmount, [>Jobs].Closed

FROM (([General Ledger] LEFT JOIN [>Jobs] ON [General Ledger].Job=[>Jobs].Key) LEFT JOIN [>Resources] ON [>Jobs].Agreement=[>Resources].Key) LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key

WHERE ((([General Ledger].TransactionDate)<=Forms!GeneralLedger!ToDate))
...
```
### Receivables Partner Report Query
```sql
SELECT DISTINCTROW [MIS Personnel].Employee, [>Jobs].ID, [General Ledger].AccountNumber, [General Ledger].TransactionDate, [General Ledger].DebitAmount, [General Ledger].CreditAmount, [>Jobs].Closed, [MIS Personnel].Text2 AS Partner, [>Jobs].Key, [General Ledger].SourceOperative, [>Resources].ID

FROM (([General Ledger] RIGHT JOIN [>Jobs] ON [General Ledger].Job=[>Jobs].Key) LEFT JOIN [>Resources] ON [>Jobs].Agreement=[>Resources].Key) RIGHT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personn...
```
### Receivables Query
```sql
SELECT DISTINCTROW [General Ledger].TransactionDate, Sum([General Ledger].DebitAmount) AS SumOfDebitAmount, Sum([General Ledger].CreditAmount) AS SumOfCreditAmount, [sumofdebitamount]-[sumofcreditamount] AS Receivables

FROM [General Ledger] LEFT JOIN [>Jobs] ON [General Ledger].Job=[>Jobs].Key

WHERE ((([General Ledger].AccountNumber)=121))

GROUP BY [General Ledger].TransactionDate, [>Jobs].Closed

HAVING ((([>Jobs].Closed)=False))

ORDER BY [General Ledger].TransactionDate DESC;
```
### Receivables Report Aged Final Query
```sql
SELECT DISTINCTROW [Receivables GL Report Aged Query].MaxOfTransactionDate, [Receivables GL Report Aged Query].[>Jobs].ID, [Receivables GL Report Aged Query].SumOfDebitAmount, [Receivables GL Report Aged Query].SumOfCreditAmount, [Receivables GL Report Aged Query].[>Resources].ID, IIf(DateDiff("d",[maxoftransactiondate],Forms!GeneralLedger.ToDate)<=30,1,IIf(DateDiff("d",[maxoftransactiondate],Forms!GeneralLedger.ToDate)<=90,2,3)) AS Aged

FROM [Receivables GL Report Aged Query]

ORDER BY [Receiv...
```
### Receivables Report Aged Prep Query
```sql
SELECT DISTINCTROW [Receivables Report Query].[>Jobs].ID, [Receivables Report Query].TransactionDate, [Receivables Report Query].DebitAmount, [Receivables Report Query].CreditAmount, [Receivables Report Query].[>Resources].ID, [Receivables Report Query].AccountNumber

FROM [Receivables Report Query]

WHERE ((([Receivables Report Query].AccountNumber)=121))

ORDER BY [Receivables Report Query].[>Jobs].ID;
```
### Receivables Report Aged Query
```sql
SELECT DISTINCTROW Max([Receivables Report Aged Prep Query].TransactionDate) AS MaxOfTransactionDate, [Receivables Report Aged Prep Query].[>Jobs].ID, Sum([Receivables Report Aged Prep Query].DebitAmount) AS SumOfDebitAmount, Sum([Receivables Report Aged Prep Query].CreditAmount) AS SumOfCreditAmount, [Receivables Report Aged Prep Query].[>Resources].ID, Sum([debitamount])-Sum([creditamount]) AS Expr1

FROM [Receivables Report Aged Prep Query]

GROUP BY [Receivables Report Aged Prep Query].[>Job...
```
### Receivables Report Bank Account Aged Final Query
```sql
SELECT DISTINCTROW [Receivables Report Aged Query].MaxOfTransactionDate, [Receivables Report Last Invoice].LastInvoice, [Receivables Report Aged Query].[>Jobs].ID AS TheJob, [Receivables Report Aged Query].SumOfDebitAmount, [Receivables Report Aged Query].SumOfCreditAmount, [Receivables Report Aged Query].[>Resources].ID, IIf(DateDiff("d",[MaxofTransactiondate],Date())<=30,1,IIf(DateDiff("d",[Maxoftransactiondate],Date())<=90,2,3)) AS Aged

FROM [Receivables Report Aged Query] LEFT JOIN [Receiva...
```
### Receivables Report Last Invoice
```sql
SELECT [>Jobs].ID AS JobName, [Due] & " " & [Description] AS LastInvoice, [>Jobs].Key AS JobKey

FROM [Sales Journal Max of Key] LEFT JOIN ([Sales Journal] LEFT JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key) ON [Sales Journal Max of Key].MaxOfKey=[Sales Journal].Key

WHERE ((([>Jobs].Closed)=False))

GROUP BY [>Jobs].ID, [Due] & " " & [Description], [>Jobs].Key

HAVING ((([Due] & " " & [Description]) Is Not Null));
```
### Receivables Report Query
```sql
SELECT DISTINCTROW [>Jobs].ID, [General Ledger].AccountNumber, [General Ledger].TransactionDate, [General Ledger].DebitAmount, [General Ledger].CreditAmount, [>Jobs].Closed, [>Jobs].Key, [General Ledger].SourceOperative, [>Resources].ID, [General Ledger].Job

FROM ([General Ledger] RIGHT JOIN [>Jobs] ON [General Ledger].Job=[>Jobs].Key) LEFT JOIN [>Resources] ON [>Jobs].Agreement=[>Resources].Key

WHERE ((([General Ledger].AccountNumber)=121) AND (([>Jobs].Closed)=False))

ORDER BY [>Jobs].ID, [...
```
### Receivables Report Query 2
```sql
SELECT DISTINCTROW [Receivables Report Query].ID AS Expr1, [Receivables Report Query].AccountNumber, Last([Receivables Report Query].TransactionDate) AS LastOfTransactionDate, First([Receivables Report Query].TheName) AS FirstOfTheName, Sum([Receivables Report Query].DebitAmount) AS SumOfDebitAmount, Sum([Receivables Report Query].CreditAmount) AS SumOfCreditAmount, [Receivables Report Query].Key

FROM [Receivables Report Query]

GROUP BY [Receivables Report Query].ID, [Receivables Report Query]...
```
### Receivables by day
```sql
SELECT [General Ledger].TransactionDate, Sum([General Ledger].DebitAmount) AS SumOfDebitAmount, Sum([General Ledger].CreditAmount) AS SumOfCreditAmount, Sum([debitamount]-[creditamount]) AS Receivables, [General Ledger].CreditAmount

FROM [General Ledger] RIGHT JOIN [>Jobs] ON [General Ledger].Job=[>Jobs].Key

WHERE ((([General Ledger].AccountNumber)=121) AND (([>Jobs].Closed)=False))

GROUP BY [General Ledger].TransactionDate, [General Ledger].CreditAmount

ORDER BY [General Ledger].Transaction...
```
### Receivables by week
```sql
SELECT [MIS Hours Date].TheDate, Sum([Receivables by day].Receivables) AS SumOfReceivables

FROM [Receivables by day], [MIS Hours Date]

WHERE (((IIf([transactiondate]<=[TheDate],True,False))=True))

GROUP BY [MIS Hours Date].TheDate

HAVING ((([MIS Hours Date].TheDate)>=Forms!GeneralLedger.fromdate And ([MIS Hours Date].TheDate)<=forms!generalledger.todate))

ORDER BY [MIS Hours Date].TheDate DESC;
```
### Receivables cash daily
```sql
SELECT [Receivables date].TheDate, Sum([Receivables by day].CreditAmount) AS SumOfCreditAmount1

FROM [Receivables date] LEFT JOIN [Receivables by day] ON [Receivables date].TheDate=[Receivables by day].TransactionDate

WHERE (((IIf([transactiondate]<=[TheDate] And [creditamount]<>0,True,False))=True))

GROUP BY [Receivables date].TheDate

HAVING ((([Receivables date].TheDate)>=Forms!GeneralLedger.fromdate And ([Receivables date].TheDate)<=forms!generalledger.todate))

ORDER BY [Receivables date...
```
### Receivables daily
```sql
SELECT [Receivables date].TheDate, Sum([Receivables by day].Receivables) AS SumOfReceivables

FROM [Receivables by day], [Receivables date]

WHERE (((IIf([transactiondate]<=[TheDate],True,False))=True))

GROUP BY [Receivables date].TheDate

HAVING ((([Receivables date].TheDate)>=Forms!GeneralLedger.fromdate And ([Receivables date].TheDate)<=forms!generalledger.todate))

ORDER BY [Receivables date].TheDate DESC;
```
### Receivables date
```sql
SELECT [General Ledger].TransactionDate AS TheDate

FROM [General Ledger] RIGHT JOIN [>Jobs] ON [General Ledger].Job=[>Jobs].Key

WHERE ((([General Ledger].AccountNumber)=121) AND (([>Jobs].Closed)=False))

GROUP BY [General Ledger].TransactionDate

ORDER BY [General Ledger].TransactionDate DESC;
```
### Reconciliation Check Report Query
```sql
SELECT DISTINCTROW [Cash Disbursements Journal].*, [>Resources].ID

FROM [Cash Disbursements Journal] LEFT JOIN [>Resources] ON [Cash Disbursements Journal].SupplierID=[>Resources].Key

WHERE (((IIf([CheckDate]<=forms!GeneralLedger!ToDate And [Closed]=False Or [CheckDate]<=Forms!GeneralLedger!ToDate And [Closed]=True And [EntryDate]>=DatePlus30(Forms!GeneralLedger!ToDate),True,False))=True) And (([Cash Disbursements Journal].Void)=False) And (([Cash Disbursements Journal].DebitAmount)<>0));
```
### Reconciliation Payroll Report Query
```sql
SELECT DISTINCTROW [Payroll Journal].*, [MIS Personnel].ADPName

FROM [Payroll Journal] LEFT JOIN [MIS Personnel] ON [Payroll Journal].ADPFile=[MIS Personnel].ADPFile

WHERE ((([Payroll Journal].Closed)=False) AND (([Payroll Journal].Void)=False) AND (([Payroll Journal].Net)<>0));
```
### Reconciliation Receipt Report Query
```sql
SELECT DISTINCTROW [Receipts Journal].*, [>Resources].ID

FROM [Receipts Journal] LEFT JOIN [>Resources] ON [Receipts Journal].Payor=[>Resources].Key

WHERE ((([CheckDate]<=forms!GeneralLedger!ToDate And [Closed]=False Or [CheckDate]>=forms!GeneralLedgerFromdate And [CheckDate]<=Forms!GeneralLedger!ToDate And [Closed]=True And [EntryDate]>=DatePlus30(Forms!GeneralLedger!ToDate))=True) And (([Receipts Journal].Void)=False));
```
### Reconciliation Receipts Report Query
```sql
SELECT DISTINCTROW [Receipts Journal].*, [>Resources].ID

FROM [Receipts Journal] INNER JOIN [>Resources] ON [Receipts Journal].Payor=[>Resources].Key

WHERE ((([Receipts Journal].Void)=False) AND (([Receipts Journal].Amount)<>0));
```
### Reconciliation Report Query
```sql
SELECT DISTINCTROW [Cash Disbursements Journal].*, [>Resources].ID

FROM [Cash Disbursements Journal] LEFT JOIN [>Resources] ON [Cash Disbursements Journal].SupplierID=[>Resources].Key

WHERE ((([Cash Disbursements Journal].Void)=False) AND (([Cash Disbursements Journal].DebitAmount)<>0));
```
### Refunds Report Query
```sql
SELECT DISTINCTROW [>Jobs].ID, [General Ledger].AccountNumber, [General Ledger].TransactionDate, [General Ledger].DebitAmount, [General Ledger].CreditAmount, [General Ledger].SourceOperative, [>Jobs].Closed, [>Resources].ID

FROM ([General Ledger] LEFT JOIN [>Jobs] ON [General Ledger].Job=[>Jobs].Key) LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key

WHERE ((([General Ledger].AccountNumber)=121) AND (([>Jobs].Closed)=False) AND ((InStr([SourceTransaction],"Refund"))<>0));
```
### Registration Lookup Query
```sql
SELECT Registry.OfficialName AS Expr1, Registry.Key AS Expr2

FROM Registry

ORDER BY Registry.OfficialName;
```
### ResourceID
```sql
SELECT [>ResourcesID].Key, [>ResourcesID].ID

FROM [>ResourcesID];
```
### Sales Journal Max of Due
```sql
SELECT [Sales Journal].Job, Max([Sales Journal].Due) AS MaxOfDue

FROM [Sales Journal]

GROUP BY [Sales Journal].Job

ORDER BY [Sales Journal].Job;
```
### Sales Journal Max of Key
```sql
SELECT [Sales Journal].Job, Max([Sales Journal].Key) AS MaxOfKey, Count([Sales Journal Max of Due].MaxOfDue) AS CountOfMaxOfDue

FROM [Sales Journal Max of Due] LEFT JOIN [Sales Journal] ON ([Sales Journal Max of Due].MaxOfDue=[Sales Journal].Due) AND ([Sales Journal Max of Due].Job=[Sales Journal].Job)

GROUP BY [Sales Journal].Job;
```
### Sales Payroll Report Query
```sql
SELECT DISTINCTROW FirstThursday([TransactionDate]) AS SaleDate, Sum([General Ledger].CreditAmount) AS Sale, [General Ledger].TransactionDate

FROM [General Ledger] LEFT JOIN [>Jobs] ON [General Ledger].Job=[>Jobs].Key

GROUP BY [General Ledger].TransactionDate, [General Ledger].AccountNumber

HAVING ((([General Ledger].TransactionDate)>=Forms!Payroll.FromDate And ([General Ledger].TransactionDate)<=Forms!Payroll.ToDate) And (([General Ledger].AccountNumber)=305))

ORDER BY [General Ledger].Tran...
```
### Sales Report Query
```sql
SELECT DISTINCTROW [>Jobs].ID, [General Ledger].AccountNumber, [General Ledger].TransactionDate, [General Ledger].DebitAmount, [General Ledger].CreditAmount, [General Ledger].SourceOperative, [>Jobs].Closed, [>Resources].ID

FROM ([General Ledger] LEFT JOIN [>Jobs] ON [General Ledger].Job=[>Jobs].Key) LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key

WHERE ((([General Ledger].AccountNumber)=305));
```
### Sales Total Payroll Report Query
```sql
SELECT DISTINCTROW [Sales Payroll Report Query].SaleDate, Sum([Sales Payroll Report Query].Sale) AS SumOfSale

FROM [Sales Payroll Report Query]

GROUP BY [Sales Payroll Report Query].SaleDate;
```
### Selected Account Report Query
```sql
SELECT DISTINCTROW [General Ledger].AccountNumber, [>Resources].ID, [General Ledger].TransactionDate, [General Ledger].DebitAmount, [General Ledger].CreditAmount, [General Ledger].SourceOperative, [General Ledger].SourceJournal, [General Ledger].SourceTransaction

FROM [General Ledger] LEFT JOIN [>Resources] ON [General Ledger].SourceOperative=[>Resources].Key

WHERE ((([General Ledger].AccountNumber)=Forms!GeneralLedger.SelectedAccount));
```
### Test
```sql
SELECT DISTINCTROW [>Jobs].ID, Sum(IIf(Not IsNull([General]),0,IIf([ADPNetAccount]>=700,variable("office hrly cost estimate")*[Hours],variable("shop hrly cost estimate")*[Hours]))) AS CostPlus, [MIS Hours].[Job ID], Sum(IIf([ADPNetAccount]>=700,variable("office hrly cost estimate")*[Hours],variable("shop hrly cost estimate")*[Hours])) AS HourlyCost

FROM ([MIS Hours] LEFT JOIN [>Jobs] ON [MIS Hours].[Job ID]=[>Jobs].Key) LEFT JOIN [MIS Personnel] ON [MIS Hours].ADPFile=[MIS Personnel].ADPFile

W...
```
### VerifyBalanceSheetAccounts
```sql
SELECT [General Ledger].AccountNumber, [MIS Accounts].BalanceSheetItemSort, Sum([General Ledger].CreditAmount) AS SumOfCreditAmount, Sum([General Ledger].DebitAmount) AS SumOfDebitAmount, [General Ledger Balance Sheet].Detail, [MIS Accounts].Balance, IIf([sumofcreditamount]<>[sumofdebitamount]<>0 And nnez([Detail])=0,False,True) AS AccountTest

FROM ([General Ledger] LEFT JOIN [MIS Accounts] ON [General Ledger].AccountNumber = [MIS Accounts].Number) LEFT JOIN [General Ledger Balance Sheet] ON [M...
```
### VerifyIncomeStatementAccounts
```sql
SELECT [General Ledger].AccountNumber, [MIS Accounts].BalanceSheetItemSort, Sum([General Ledger].CreditAmount) AS SumOfCreditAmount, Sum([General Ledger].DebitAmount) AS SumOfDebitAmount, [General Ledger Income Statement].Detail, IIf([sumofcreditamount]<>[sumofdebitamount]<>0 And nnez([Detail])=0,False,True) AS AccountTest

FROM ([General Ledger] LEFT JOIN [MIS Accounts] ON [General Ledger].AccountNumber = [MIS Accounts].Number) LEFT JOIN [General Ledger Income Statement] ON [MIS Accounts].Balan...
```
### Voided Checks
```sql
SELECT [>Resources].ID, [Cash Disbursements Journal].*

FROM [Cash Disbursements Journal] INNER JOIN [>Resources] ON [Cash Disbursements Journal].SupplierID=[>Resources].Key

WHERE ((([Cash Disbursements Journal].Void)=True))

ORDER BY [Cash Disbursements Journal].CheckDate DESC;
```
### WIP Design Report Total Query
```sql
SELECT DISTINCTROW [WIP Report Job Query].ID, [WIP Report Cabinet Sales Query].SumOfSaleAmount, [WIP Report Cabinet Invoice Query].SumOfSaleAmount, [WIP Report Install Sales Query].SumOfSaleAmount, [WIP Report Install Invoice Query].SumOfSaleAmount, [WIP Report Cabinet Sales Query].SumOfSaleAmount AS SoldCabinets, [WIP Report Install Sales Query].SumOfSaleAmount AS SoldInstallation, [WIP Report Cabinet Invoice Query].SumOfSaleAmount-NNEZ([WIP Report Cabinet Sales Query].sumofsaleamount) AS Unsol...
```
### WIP Report Cabinet Invoice Query
```sql
SELECT [WIP Report Cabinet Job Query].ID, [WIP Report Cabinet Job Query].Key, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount

FROM [WIP Report Cabinet Job Query] INNER JOIN [Sales Journal] ON [WIP Report Cabinet Job Query].Key=[Sales Journal].Job

WHERE (((InStr([Sales Journal].Category,"Cabinet")<>0)=True))

GROUP BY [WIP Report Cabinet Job Query].ID, [WIP Report Cabinet Job Query].Key

ORDER BY [WIP Report Cabinet Job Query].ID;
```
### WIP Report Cabinet Job Query
```sql
SELECT DISTINCTROW [>Jobs].ID, [>Jobs].Key, [>Jobs].Customer

FROM [Sales Journal] INNER JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key

WHERE ((([Sales Journal].TheDate) Is Null Or ([Sales Journal].TheDate)>Forms!GeneralLedger!ToDate) And ((InStr([Sales Journal]!Category,"Cabinet")<>0)=True) And (([>Jobs].Estimate)=False) And (([>Jobs].Closed)=False))

GROUP BY [>Jobs].ID, [>Jobs].Key, [>Jobs].Customer

ORDER BY [>Jobs].ID;
```
### WIP Report Cabinet Sales Query
```sql
SELECT DISTINCTROW [WIP Report Cabinet Job Query].ID, [WIP Report Cabinet Job Query].Key, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount

FROM [WIP Report Cabinet Job Query] INNER JOIN [Sales Journal] ON [WIP Report Cabinet Job Query].Key=[Sales Journal].Job

WHERE ((([Sales Journal].TheDate)<=Forms!GeneralLedger!ToDate) And ((InStr([Sales Journal]!Category,"Cabinet")<>0)=True))

GROUP BY [WIP Report Cabinet Job Query].ID, [WIP Report Cabinet Job Query].Key

ORDER BY [WIP Report Cabinet Job ...
```
### WIP Report Design Query
```sql
SELECT DISTINCTROW [WIP Report Cabinet Job Query].ID, Sum([MIS Hours].Hours) AS SumOfHours, Sum([MIS Hours].Cost) AS SumOfCost

FROM [WIP Report Cabinet Job Query] INNER JOIN [MIS Hours] ON [WIP Report Cabinet Job Query].Key=[MIS Hours].[Job ID]

WHERE ((([MIS Hours].Charge)="Project") And (([MIS Hours].Date)<=Forms!GeneralLedger!ToDate))

GROUP BY [WIP Report Cabinet Job Query].ID

HAVING (((Sum([MIS Hours].Cost))>100))

ORDER BY [WIP Report Cabinet Job Query].ID;
```
### WIP Report Install Invoice Query
```sql
SELECT [WIP Report Install Job Query].ID, [WIP Report Install Job Query].Key, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount

FROM [WIP Report Install Job Query] INNER JOIN [Sales Journal] ON [WIP Report Install Job Query].Key=[Sales Journal].Job

WHERE (((InStr([Sales Journal].Category,"Install")<>0)=True))

GROUP BY [WIP Report Install Job Query].ID, [WIP Report Install Job Query].Key

ORDER BY [WIP Report Install Job Query].ID;
```
### WIP Report Install Job Query
```sql
SELECT DISTINCTROW [>Jobs].ID, [>Jobs].Key, [>Jobs].Customer

FROM [Sales Journal] INNER JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key

WHERE ((([Sales Journal].TheDate) Is Null Or ([Sales Journal].TheDate)>Forms!GeneralLedger!ToDate) And ((InStr([Sales Journal]!Category,"Install")<>0)=True) And (([>Jobs].Estimate)=False) And (([>Jobs].Closed)=False))

GROUP BY [>Jobs].ID, [>Jobs].Key, [>Jobs].Customer

ORDER BY [>Jobs].ID;
```
### WIP Report Install Query
```sql
SELECT DISTINCTROW [WIP Report Install Job Query].ID, Sum([MIS Hours].Hours) AS SumOfHours, Sum([MIS Hours].Cost) AS SumOfCost, Min([MIS Hours].Date) AS MinOfDate, Max([MIS Hours].Date) AS MaxOfDate

FROM [WIP Report Install Job Query] INNER JOIN [MIS Hours] ON [WIP Report Install Job Query].Key=[MIS Hours].[Job ID]

WHERE ((([MIS Hours].Date)<=Forms!GeneralLedger!ToDate) And ((InStr([Charge],"Install")<>0)=True))

GROUP BY [WIP Report Install Job Query].ID

HAVING (((Sum([MIS Hours].Cost))>100)...
```
### WIP Report Install Sales Query
```sql
SELECT DISTINCTROW [WIP Report Install Job Query].ID, [WIP Report Install Job Query].Key, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount

FROM [WIP Report Install Job Query] INNER JOIN [Sales Journal] ON [WIP Report Install Job Query].Key=[Sales Journal].Job

WHERE ((([Sales Journal].TheDate)<=Forms!GeneralLedger!ToDate) And ((InStr([Sales Journal]!Category,"Install")<>0)=True))

GROUP BY [WIP Report Install Job Query].ID, [WIP Report Install Job Query].Key

ORDER BY [WIP Report Install Job ...
```
### WIP Report Invoice Query
```sql
SELECT [WIP Report Job Query].ID, [WIP Report Job Query].Key, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount

FROM [WIP Report Job Query] INNER JOIN [Sales Journal] ON [WIP Report Job Query].Key=[Sales Journal].Job

WHERE (((InStr([Sales Journal].Category,"Cabinet")<>0 Or InStr([Sales Journal].Category,"Install")<>0)=True) And ((InStr([Sales Journal].Category,"Additional")=0)=True))

GROUP BY [WIP Report Job Query].ID, [WIP Report Job Query].Key

ORDER BY [WIP Report Job Query].ID;
```
### WIP Report Job Query
```sql
SELECT DISTINCTROW [>Jobs].ID, [>Jobs].Key, [>Jobs].Customer

FROM [Sales Journal] INNER JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key

WHERE ((([Sales Journal].TheDate) Is Null Or ([Sales Journal].TheDate)>Forms!GeneralLedger!ToDate) And ((InStr([Sales Journal]!Category,"Cabinet")<>0 Or InStr([Sales Journal]!Category,"Install")<>0)=True) And ((InStr([Sales Journal]!Category,"Additional")=0)=True) And (([>Jobs].Estimate)=False) And (([>Jobs].Closed)=False))

GROUP BY [>Jobs].ID, [>Jobs].Key, [...
```
### WIP Report Query
```sql
SELECT DISTINCTROW [WIP Report Cabinet Job Query].ID, Sum([MIS Hours].Hours) AS SumOfHours, Sum([MIS Hours].Cost) AS SumOfCost, Min([MIS Hours].Date) AS MinOfDate, Max([MIS Hours].Date) AS MaxOfDate

FROM [WIP Report Cabinet Job Query] INNER JOIN [MIS Hours] ON [WIP Report Cabinet Job Query].Key=[MIS Hours].[Job ID]

WHERE ((([MIS Hours].Date)<=Forms!GeneralLedger!ToDate) And ((InStr([Charge],"Cabinet")<>0)=True))

GROUP BY [WIP Report Cabinet Job Query].ID

HAVING (((Sum([MIS Hours].Cost))>100)...
```
### WIP Report Sales Query
```sql
SELECT DISTINCTROW [WIP Report Cabinet Job Query].ID, [WIP Report Cabinet Job Query].Key, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount, Min([Sales Journal].TheDate) AS MinOfTheDate, Max([Sales Journal].TheDate) AS MaxOfTheDate

FROM [WIP Report Cabinet Job Query] INNER JOIN [Sales Journal] ON [WIP Report Cabinet Job Query].Key=[Sales Journal].Job

WHERE ((([Sales Journal].TheDate)<=Forms!GeneralLedger!ToDate) And ((InStr([Sales Journal]!Category,"Cabinet")<>0 And InStr([Sales Journal]!Cate...
```
### WIP Report Total Query
```sql
SELECT DISTINCTROW [WIP Report Job Query].ID, [WIP Report Cabinet Sales Query].SumOfSaleAmount, [WIP Report Cabinet Invoice Query].SumOfSaleAmount, [WIP Report Install Sales Query].SumOfSaleAmount, [WIP Report Install Invoice Query].SumOfSaleAmount, [WIP Report Cabinet Sales Query].SumOfSaleAmount AS SoldCabinets, [WIP Report Install Sales Query].SumOfSaleAmount AS SoldInstallation, [WIP Report Cabinet Invoice Query].SumOfSaleAmount-NNEZ([WIP Report Cabinet Sales Query].sumofsaleamount) AS Unsol...
```
### YEProof101Cash
```sql
SELECT [Balance]+Sum(nnez(-[Creditamount])+nnez([DebitAmount])) AS 101Cash, [MIS Accounts].Balance, 1 AS Sort, Sum(nnez(-[Creditamount])+nnez([DebitAmount])) AS NetActivity, [General Ledger].SourceJournal

FROM [General Ledger] RIGHT JOIN [MIS Accounts] ON [General Ledger].AccountNumber=[MIS Accounts].Number

WHERE ((([General Ledger].AccountNumber)=101) And (([General Ledger].TransactionDate)>=forms!Generalledger!fromdate And ([General Ledger].TransactionDate)<=forms!generalledger!todate))

GRO...
```
### YEProof121Current
```sql
SELECT Sum([Creditamount]-[DebitAmount]) AS 121Current, 1 AS Sort

FROM [General Ledger] LEFT JOIN [>Jobs] ON [General Ledger].Job=[>Jobs].Key

WHERE ((([General Ledger].AccountNumber)=121) And (([General Ledger].TransactionDate)>=forms!Generalledger!fromdate And ([General Ledger].TransactionDate)<=forms!generalledger!todate))

GROUP BY [>Jobs].Closed

HAVING ((([>Jobs].Closed)=False));
```
### YEProof121Receipts
```sql
SELECT Sum([Creditamount]-[DebitAmount])*-1 AS 121Receipts, 1 AS Sort

FROM [General Ledger] LEFT JOIN [>Jobs] ON [General Ledger].Job=[>Jobs].Key

WHERE ((([General Ledger].SourceJournal)="receipt") And (([General Ledger].AccountNumber)=121) And (([General Ledger].TransactionDate)>=forms!Generalledger!fromdate And ([General Ledger].TransactionDate)<=forms!generalledger!todate))

GROUP BY [>Jobs].Closed

HAVING ((([>Jobs].Closed)=False));
```
### YEProof121Receivables
```sql
SELECT Sum([Creditamount]-[DebitAmount])*-1 AS 121Receivables, 1 AS Sort

FROM [General Ledger] LEFT JOIN [>Jobs] ON [General Ledger].Job=[>Jobs].Key

WHERE ((([General Ledger].AccountNumber)=121) And (([General Ledger].TransactionDate)<=forms!generalledger!todate))

GROUP BY [>Jobs].Closed

HAVING ((([>Jobs].Closed)=False));
```
### YEProof121Refunds
```sql
SELECT Sum([General Ledger].DebitAmount) AS 121Refunds, 1 AS Sort

FROM [General Ledger] LEFT JOIN [>Jobs] ON [General Ledger].Job=[>Jobs].Key

WHERE ((([General Ledger].SourceJournal)="purchase") And (([General Ledger].AccountNumber)=121) And (([General Ledger].TransactionDate)>=forms!Generalledger!fromdate And ([General Ledger].TransactionDate)<=forms!generalledger!todate))

GROUP BY [>Jobs].Closed

HAVING ((([>Jobs].Closed)=False));
```
### YEProof201Checks
```sql
SELECT Sum(nnez([Creditamount])-[DebitAmount]) AS 201Checks, 1 AS Sort

FROM [General Ledger]

WHERE ((([General Ledger].SourceJournal)="Check") And (([General Ledger].AccountNumber)=201) And (([General Ledger].TransactionDate)>=forms!Generalledger!fromdate And ([General Ledger].TransactionDate)<=forms!generalledger!todate));
```
### YEProof201Purchases
```sql
SELECT Sum(nnez([Creditamount])-nnez([DebitAmount])) AS 201Purchases, 1 AS Sort

FROM [General Ledger]

WHERE ((([General Ledger].SourceJournal)="purchase") And (([General Ledger].AccountNumber)=201) And (([General Ledger].TransactionDate)>=forms!Generalledger!fromdate And ([General Ledger].TransactionDate)<=forms!generalledger!todate));
```
### YEProof205Current
```sql
SELECT Sum([Creditamount]-[DebitAmount]) AS 205Current, 1 AS Sort

FROM [General Ledger] LEFT JOIN [>Jobs] ON [General Ledger].Job=[>Jobs].Key

WHERE ((([General Ledger].AccountNumber)=205) And (([General Ledger].TransactionDate)>=forms!Generalledger!fromdate And ([General Ledger].TransactionDate)<=forms!generalledger!todate))

GROUP BY [>Jobs].Closed

HAVING ((([>Jobs].Closed)=False));
```
### YEProof205Deposits
```sql
SELECT Sum(nnez([Creditamount])-nnez([DebitAmount]))*-1 AS 205Deposits, 1 AS Sort

FROM [General Ledger] LEFT JOIN [>Jobs] ON [General Ledger].Job=[>Jobs].Key

WHERE ((([General Ledger].AccountNumber)=205) And (([General Ledger].TransactionDate)<=forms!generalledger!todate))

GROUP BY [>Jobs].Closed

HAVING ((([>Jobs].Closed)=False));
```
### YEProof305
```sql
SELECT [SumofCreditamount] AS 305Sales, 1 AS sort, Sum([General Ledger].CreditAmount) AS SumOfCreditAmount, Sum([General Ledger].DebitAmount) AS SumOfDebitAmount

FROM [General Ledger] INNER JOIN [>Jobs] ON [General Ledger].Job=[>Jobs].Key

WHERE (((IIf([AccountNumber]=305,True,False))=True) And (([General Ledger].TransactionDate)>=forms!Generalledger!fromdate And ([General Ledger].TransactionDate)<=forms!generalledger!todate));
```
### YEProofBalance121
```sql
SELECT [MIS Accounts].Balance, 1 AS Sort

FROM [MIS Accounts]

WHERE ((([MIS Accounts].Number)=121));
```
### YEProofBalance201
```sql
SELECT [Balance]*-1 AS 201Balance, 1 AS Sort

FROM [MIS Accounts]

WHERE ((([MIS Accounts].Number)=201));
```
### YEProofBalance205
```sql
SELECT [MIS Accounts].Balance, 1 AS Sort

FROM [MIS Accounts]

WHERE ((([MIS Accounts].Number)=205));
```
### YEProofPayablesReport
```sql
SELECT DISTINCTROW Sum([Purchase Journal].DebitAmount) AS PayablesReport, 1 AS Sort

FROM [Purchase Journal]

WHERE (((IIf([PayablesAccount]=201 And [EntryDate]<=Forms!GeneralLedger.ToDate And [checkdate]>Forms!GeneralLedger.ToDate Or [PayablesAccount]=201 And [EntryDate]<=Forms!GeneralLedger.ToDate And [Paid]=False,True,False))=True))

GROUP BY [Purchase Journal].Void, [Purchase Journal].Posted

HAVING ((([Purchase Journal].Void)=False) AND (([Purchase Journal].Posted)=True));
```
### YEProofQuery
```sql
SELECT YESort.sort, YEProofBalance121.Balance, YEProofBalance201.[201Balance], YEProof201Checks.[201Checks], YEProof201Purchases.[201Purchases], YEProofBalance205.Balance, YEProof101Cash.[101Cash], YEProofPayablesReport.PayablesReport, YEProof121Receipts.[121Receipts], YEProof121Receivables.[121Receivables], YEProof121Current.[121Current], YEProof205Current.[205Current], YEProof205Deposits.[205Deposits], YEProof305.[305Sales], YEProof121Refunds.[121Refunds]

FROM (((((((((((((YESort LEFT JOIN YE...
```
### YEProofQueryData
```sql
SELECT YESort.sort, YEProofBalance121.Balance, YEProofBalance201.[201Balance], YEProof201Checks.[201Checks], YEProof201Purchases.[201Purchases], YEProofBalance205.Balance, YEProof101Cash.[101Cash], YEProofPayablesReport.PayablesReport, YEProof121Receipts.[121Receipts], YEProof121Receivables.[121Receivables], YEProof121Current.[121Current], YEProof205Current.[205Current], YEProof205Deposits.[205Deposits], YEProof305.[305Sales], YEProof121Refunds.[121Refunds]

FROM YEProof305, ((((((((((((YESort I...
```
### YEProofQueryReconciliation
```sql
SELECT YESort.sort, Sum(YEProof101Cash.[101Cash]) AS SumOf101Cash, Max(YEProof101Cash.Balance) AS MaxOfBalance, Sum(YEProof101Cash.NetActivity) AS SumOfNetActivity

FROM YESort LEFT JOIN YEProof101Cash ON YESort.sort=YEProof101Cash.Sort

GROUP BY YESort.sort;
```
### YESort
```sql
SELECT CopyRight.CopyRight, 1 AS sort

FROM CopyRight

GROUP BY CopyRight.CopyRight;
```
### z>401K Query
```sql
SELECT;
```

## VBA Object Inventory
| Type | Count | Objects |
|------|-------|--------|
| Forms | 19 | AccountSort, AccountSortIndex, AccountSortIndexBalanceSheet, Accounts, Balance, Balance Sheet Template, BalanceNew, BalanceSheet, GeneralLedger, Help, HelpEdit, Income Statement Template, Log, MainMenu, Memo, Password, Purchase Vendor Report Query, SelectDatabase, Startup |
| Reports | 94 | >Sales Not Posted Query, CS+Q Report, Compensation Report, Credits Report, Deposits Report, Employee Birth Dates Report, Employee Hire Dates Report, Employee Hired Dates Report, Employee Roster, Employee Termination Dates Report, Employees Hired and Terminated Report, General Ledger Account Report, General Ledger Accounts, General Ledger Asset and Liability Detail Report, General Ledger Asset and Liability Report, General Ledger Balance Sheet, General Ledger Deposits Report, General Ledger Expense Report, General Ledger Horizontal Balance Sheet, General Ledger Income Statement, General Ledger Interim Asset and Liability Report, General Ledger Job Report, General Ledger Journal Report, General Ledger KR+H Account Sort, General Ledger KR+H Balance Sheet, General Ledger KR+H Detail Income Statement, General Ledger KR+H Income Statement, General Ledger KR+H YTD Income Statement, General Ledger Profit (Loss) Report, General Ledger Receivables Report, General Ledger Report, General Ledger Resource Report, General Ledger Selected Resource Report, General Ledger Trial Balance Report, Help Report, Hours Activity Chart, Hours Chart Report, Hours Employee Report, Hours Report, Hours Rework Report, Hours Rework Top Ten Report, Hours Rework Yearly Comparison, Hours Task Report, Job Audit Report, Job Profit Report, Job Profit Report V1, Job Profit Report1, Log Report, Payable_SubReport, Payables Payee Report, Payables Report, Payables Report by Due Date, Payables Report by Week, Payables_at_From_Date subreport, Payroll 401K Report, Payroll Bonus Plan Report, Payroll Bonus Report, Payroll Direct Deposit Report, Payroll Field Report, Payroll Medical Deductions, Payroll Prepay Report, Payroll Reconciliation Report, Payroll Report, Payroll Roth IRA Report, Payroll Roth Report, Payroll Summary GL Report, Payroll Summary Report, Print Checks, Profit Bonus Report, Purchase Job Report, Purchase Report, Purchase by amount Report, Receipts Report, Receivables Cash Report, Receivables Partner Report, Receivables Report, Receivables Report Aged, Receivables Report Bank Account Aged, Reconciliation Check Report, Reconciliation Receipt Report, Reconciliation Report, Refunds Report, ReportTemplate, Sales Report, Selected Account Chart, Selected Account Chart Report, Selected Account Report, Selected Account Transaction Report, Vacation Holiday and Bonus Report, Vacation Report, WIP Report, WIP Shop Report, Year End Bank Reconciliation Report, Year End Test Report |
| Modules | 5 | AppPosition, AutoAttach, Common, General, ResizeAPP |
| Classes | 0 |  |
| Macros | 47 | FormFile, FormGeneral, FormGoto, MenuAccountsHelp, MenuBars, MenuEdit, MenuEditChecksEntry, MenuExportGeneralLedger, MenuFile, MenuFileGraphs, MenuFileMainMenu, MenuFileReports, MenuGLAdjustmentsHelp, MenuGLGoTo, MenuGeneralLedgerBalanceReports, MenuGeneralLedgerDetailReports, MenuGeneralLedgerHelp, MenuGeneralLedgerIncomeReports, MenuGeneralLedgerLoanReports, MenuGeneralLedgerPayrollReports, MenuGeneralLedgerStatements, MenuGeneralLedgerTemplateForms, MenuGeneralLedgerWIPReports, MenuGeneralLedgerYearEnd, MenuGeneralLedgerYearEnd_OLD, MenuGoto, MenuHelp, MenuReportsAPChecksEntry, MenuReportsBankAccount, MenuReportsGeneralLedger, MenuReportsGeneralLedgerBankReports, MenuReportsGeneralLedgerIncomeReports, MenuReportsGeneralLedgerJobReports, MenuReportsHours, MenuReportsPayroll, MenuReportsReceipts, MenuSettingsMainMenu, MenuUtilityAccounts, MenuUtilityCashJournal, MenuUtilityGeneralLedger, MenuUtilityPurchaseJournal, MenuView, MenuViewReports, MenuWindow, Miscellaneous, Quit, Size |

