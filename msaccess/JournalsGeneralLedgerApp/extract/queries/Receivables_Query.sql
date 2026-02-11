SELECT DISTINCTROW [General Ledger].TransactionDate, Sum([General Ledger].DebitAmount) AS SumOfDebitAmount, Sum([General Ledger].CreditAmount) AS SumOfCreditAmount, [sumofdebitamount]-[sumofcreditamount] AS Receivables
FROM [General Ledger] LEFT JOIN [>Jobs] ON [General Ledger].Job=[>Jobs].Key
WHERE ((([General Ledger].AccountNumber)=121))
GROUP BY [General Ledger].TransactionDate, [>Jobs].Closed
HAVING ((([>Jobs].Closed)=False))
ORDER BY [General Ledger].TransactionDate DESC;