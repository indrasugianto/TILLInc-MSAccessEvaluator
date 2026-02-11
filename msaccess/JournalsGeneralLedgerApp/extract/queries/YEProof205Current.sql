SELECT Sum([Creditamount]-[DebitAmount]) AS 205Current, 1 AS Sort
FROM [General Ledger] LEFT JOIN [>Jobs] ON [General Ledger].Job=[>Jobs].Key
WHERE ((([General Ledger].AccountNumber)=205) And (([General Ledger].TransactionDate)>=forms!Generalledger!fromdate And ([General Ledger].TransactionDate)<=forms!generalledger!todate))
GROUP BY [>Jobs].Closed
HAVING ((([>Jobs].Closed)=False));