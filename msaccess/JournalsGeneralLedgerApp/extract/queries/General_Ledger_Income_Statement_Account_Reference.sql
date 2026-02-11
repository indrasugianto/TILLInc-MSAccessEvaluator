SELECT [General Ledger Income Statement].ReportSort, [General Ledger Income Statement].SubSubHeading, [General Ledger Income Statement].[Index Income], [General Ledger Income Statement].[Index Expense], IIf([ReportSort]<20,"Income","Expense") AS SortType
FROM [General Ledger Income Statement]
WHERE ((([General Ledger Income Statement].ReportSort)<>0))
ORDER BY [General Ledger Income Statement].ReportSort;