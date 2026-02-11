SELECT [General Ledger Balance Sheet].ReportSort, [General Ledger Balance Sheet].SubSubHeading, [General Ledger Balance Sheet].[Index Income], [General Ledger Balance Sheet].[Index Expense], IIf([ReportSort]<40,"Asset",IIf([ReportSort]<50,"Liability","Equity")) AS SortType
FROM [General Ledger Balance Sheet]
WHERE ((([General Ledger Balance Sheet].ReportSort)<>0))
ORDER BY [General Ledger Balance Sheet].ReportSort;