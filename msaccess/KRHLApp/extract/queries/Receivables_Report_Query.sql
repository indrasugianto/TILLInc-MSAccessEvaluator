SELECT DISTINCTROW [>Jobs].ID, [General Ledger].AccountNumber, Last([General Ledger].TransactionDate) AS LastOfTransactionDate, Sum([General Ledger].DebitAmount) AS SumOfDebitAmount, Sum([General Ledger].CreditAmount) AS SumOfCreditAmount, [>Jobs].Closed, [>Jobs].Key, [General Ledger].SourceOperative, [>Resources].ID
FROM ([General Ledger] INNER JOIN [>Jobs] ON [General Ledger].Job=[>Jobs].Key) LEFT JOIN [>Resources] ON [>Jobs].Agreement=[>Resources].Key
GROUP BY [>Jobs].ID, [General Ledger].AccountNumber, [>Jobs].Closed, [>Jobs].Key, [General Ledger].SourceOperative, [>Resources].ID
HAVING ((([General Ledger].AccountNumber)=121) AND (([>Jobs].Closed)=False))
ORDER BY [>Jobs].ID, Last([General Ledger].TransactionDate);