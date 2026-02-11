SELECT Sum(nnez([Creditamount])-nnez([DebitAmount])) AS 201Purchases, 1 AS Sort
FROM [General Ledger]
WHERE ((([General Ledger].SourceJournal)="purchase") And (([General Ledger].AccountNumber)=201) And (([General Ledger].TransactionDate)>=forms!Generalledger!fromdate And ([General Ledger].TransactionDate)<=forms!generalledger!todate));