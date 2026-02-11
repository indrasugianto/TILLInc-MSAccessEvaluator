SELECT Sum(nnez([Creditamount])-[DebitAmount]) AS 201Checks, 1 AS Sort
FROM [General Ledger]
WHERE ((([General Ledger].SourceJournal)="Check") And (([General Ledger].AccountNumber)=201) And (([General Ledger].TransactionDate)>=forms!Generalledger!fromdate And ([General Ledger].TransactionDate)<=forms!generalledger!todate));