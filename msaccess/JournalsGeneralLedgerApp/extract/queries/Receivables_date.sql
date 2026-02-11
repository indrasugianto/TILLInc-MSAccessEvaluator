SELECT [General Ledger].TransactionDate AS TheDate
FROM [General Ledger] RIGHT JOIN [>Jobs] ON [General Ledger].Job=[>Jobs].Key
WHERE ((([General Ledger].AccountNumber)=121) AND (([>Jobs].Closed)=False))
GROUP BY [General Ledger].TransactionDate
ORDER BY [General Ledger].TransactionDate DESC;