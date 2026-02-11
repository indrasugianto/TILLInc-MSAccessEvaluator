SELECT [Balance]+Sum(nnez(-[Creditamount])+nnez([DebitAmount])) AS 101Cash, [MIS Accounts].Balance, 1 AS Sort, Sum(nnez(-[Creditamount])+nnez([DebitAmount])) AS NetActivity, [General Ledger].SourceJournal
FROM [General Ledger] RIGHT JOIN [MIS Accounts] ON [General Ledger].AccountNumber=[MIS Accounts].Number
WHERE ((([General Ledger].AccountNumber)=101) And (([General Ledger].TransactionDate)>=forms!Generalledger!fromdate And ([General Ledger].TransactionDate)<=forms!generalledger!todate))
GROUP BY [MIS Accounts].Balance, [General Ledger].SourceJournal
ORDER BY [General Ledger].SourceJournal;