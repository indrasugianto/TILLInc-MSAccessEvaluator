SELECT DISTINCTROW [General Ledger].*, [MIS Accounts].Account, [MIS Accounts].Balance, [>Resources].ID
FROM ([General Ledger] INNER JOIN [MIS Accounts] ON [General Ledger].AccountNumber=[MIS Accounts].Number) LEFT JOIN [>Resources] ON [General Ledger].SourceOperative=[>Resources].Key
WHERE ((([General Ledger].TransactionDate)>=Forms!GeneralLedger.FromDate And ([General Ledger].TransactionDate)<=Forms!GeneralLedger.ToDate))
ORDER BY [General Ledger].AccountNumber, [General Ledger].SourceJournal;