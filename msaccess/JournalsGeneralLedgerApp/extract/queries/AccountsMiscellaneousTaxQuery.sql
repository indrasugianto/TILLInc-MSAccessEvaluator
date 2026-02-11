SELECT [MIS Accounts].Number, [MIS Accounts].Account
FROM [MIS Accounts]
WHERE (((InStr([Account],"Tax Expense"))<>"0"))
ORDER BY [MIS Accounts].Number;