SELECT DISTINCTROW [MIS Accounts].*, IIf(nnez([BalanceSheetItemSort])<100,DLookUp("SubSubHeading","General Ledger Balance Sheet","ReportSort =" & [BalanceSheetItemSort]),DLookUp("SubSubHeading","General Ledger Income Statement","ReportSort =" & [BalanceSheetItemSort])) AS Report
FROM [MIS Accounts]
ORDER BY [MIS Accounts].Number;