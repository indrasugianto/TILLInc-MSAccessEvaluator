SELECT [General Ledger].TransactionDate, Sum([General Ledger].DebitAmount) AS SumOfDebitAmount, Sum([General Ledger].CreditAmount) AS SumOfCreditAmount, Sum([debitamount]-[creditamount]) AS Receivables, [General Ledger].CreditAmount
FROM [General Ledger] RIGHT JOIN [>Jobs] ON [General Ledger].Job=[>Jobs].Key
WHERE ((([General Ledger].AccountNumber)=121) AND (([>Jobs].Closed)=False))
GROUP BY [General Ledger].TransactionDate, [General Ledger].CreditAmount
ORDER BY [General Ledger].TransactionDate DESC;