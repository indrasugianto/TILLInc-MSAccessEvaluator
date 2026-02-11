SELECT Sum([Creditamount]-[DebitAmount])*-1 AS 121Receipts, 1 AS Sort
FROM [General Ledger] LEFT JOIN [>Jobs] ON [General Ledger].Job=[>Jobs].Key
WHERE ((([General Ledger].SourceJournal)="receipt") And (([General Ledger].AccountNumber)=121) And (([General Ledger].TransactionDate)>=forms!Generalledger!fromdate And ([General Ledger].TransactionDate)<=forms!generalledger!todate))
GROUP BY [>Jobs].Closed
HAVING ((([>Jobs].Closed)=False));