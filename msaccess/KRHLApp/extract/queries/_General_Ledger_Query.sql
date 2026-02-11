SELECT DISTINCTROW [General Ledger].*, [>Resources].ID, [MIS Accounts].Account
FROM ([General Ledger] LEFT JOIN [MIS Accounts] ON [General Ledger].AccountNumber=[MIS Accounts].Number) LEFT JOIN [>Resources] ON [General Ledger].SourceOperative=[>Resources].Key
ORDER BY [General Ledger].AccountNumber, [General Ledger].TransactionDate;