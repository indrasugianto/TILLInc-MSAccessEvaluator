SELECT DISTINCTROW FirstThursday([TransactionDate]) AS SaleDate, Sum([General Ledger].CreditAmount) AS Sale, [General Ledger].TransactionDate
FROM [General Ledger] LEFT JOIN [>Jobs] ON [General Ledger].Job=[>Jobs].Key
GROUP BY [General Ledger].TransactionDate, [General Ledger].AccountNumber
HAVING ((([General Ledger].TransactionDate)>=Forms!Payroll.FromDate And ([General Ledger].TransactionDate)<=Forms!Payroll.ToDate) And (([General Ledger].AccountNumber)=305))
ORDER BY [General Ledger].TransactionDate;