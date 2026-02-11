SELECT DISTINCTROW [>Resources].ID, [General Ledger].Job, [General Ledger].AccountNumber, Sum([General Ledger].DebitAmount) AS SumOfDebitAmount, Sum([General Ledger].CreditAmount) AS SumOfCreditAmount, [>Jobs].Closed
FROM (([General Ledger] LEFT JOIN [>Jobs] ON [General Ledger].Job=[>Jobs].Key) LEFT JOIN [>Resources] ON [>Jobs].Agreement=[>Resources].Key) LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key
WHERE ((([General Ledger].TransactionDate)<=Forms!GeneralLedger!ToDate))
GROUP BY [>Resources].ID, [General Ledger].Job, [General Ledger].AccountNumber, [>Jobs].Closed
HAVING ((([General Ledger].AccountNumber)=121) AND (([>Jobs].Closed)=False))
ORDER BY [>Resources].ID;