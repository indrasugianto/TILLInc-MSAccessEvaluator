SELECT [>General Ledger Query Accounts].AccountNumber, [>General Ledger Query Accounts].Account
FROM [>General Ledger Query Accounts]
GROUP BY [>General Ledger Query Accounts].AccountNumber, [>General Ledger Query Accounts].Account
ORDER BY [>General Ledger Query Accounts].AccountNumber;