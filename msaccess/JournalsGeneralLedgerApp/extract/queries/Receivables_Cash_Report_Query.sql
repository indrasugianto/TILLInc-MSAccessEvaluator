SELECT DISTINCTROW [>Jobs].ID, [General Ledger].AccountNumber, [General Ledger].TransactionDate, [General Ledger].DebitAmount, [General Ledger].CreditAmount, [>Jobs].Closed, [>Jobs].Key, [General Ledger].SourceOperative, [>Resources].ID, [General Ledger].SourceJournal
FROM ([General Ledger] LEFT JOIN [>Jobs] ON [General Ledger].Job=[>Jobs].Key) LEFT JOIN [>Resources] ON [>Jobs].Agreement=[>Resources].Key
WHERE ((([General Ledger].AccountNumber)=121) AND (([>Jobs].Closed)=False) AND (([General Ledger].SourceJournal)="receipt"))
ORDER BY [>Jobs].ID, [General Ledger].TransactionDate;