SELECT DISTINCTROW [General Ledger].*, SQLResult("Select Account from [MIS Accounts] where number=" & [AccountNumber]) AS Account
FROM [General Ledger]
ORDER BY [General Ledger].TransactionDate, [General Ledger].SourceJournal, [General Ledger].AccountNumber;