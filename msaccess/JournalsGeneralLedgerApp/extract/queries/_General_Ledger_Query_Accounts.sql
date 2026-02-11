SELECT DISTINCTROW [MIS Accounts].Account, [General Ledger].AccountNumber
FROM [General Ledger] RIGHT JOIN [MIS Accounts] ON [General Ledger].AccountNumber=[MIS Accounts].Number
WHERE ((([General Ledger].TransactionDate)>=Forms!GeneralLedger.FromDate And ([General Ledger].TransactionDate)<=Forms!GeneralLedger.ToDate Or [Balance]<>0))
GROUP BY [MIS Accounts].Account, [General Ledger].AccountNumber
ORDER BY [General Ledger].AccountNumber;