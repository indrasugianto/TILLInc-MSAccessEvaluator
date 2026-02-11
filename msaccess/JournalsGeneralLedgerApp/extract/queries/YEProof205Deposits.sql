SELECT Sum(nnez([Creditamount])-nnez([DebitAmount]))*-1 AS 205Deposits, 1 AS Sort
FROM [General Ledger] LEFT JOIN [>Jobs] ON [General Ledger].Job=[>Jobs].Key
WHERE ((([General Ledger].AccountNumber)=205) And (([General Ledger].TransactionDate)<=forms!generalledger!todate))
GROUP BY [>Jobs].Closed
HAVING ((([>Jobs].Closed)=False));