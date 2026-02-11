SELECT [MIS Accounts].Number, [MIS Accounts].Account
FROM [MIS Accounts]
WHERE (((InStr([Account],"Retirement"))<>"0"))
ORDER BY [MIS Accounts].Number;