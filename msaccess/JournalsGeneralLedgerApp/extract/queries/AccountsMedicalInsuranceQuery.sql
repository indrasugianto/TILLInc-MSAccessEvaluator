SELECT [MIS Accounts].Number, [MIS Accounts].Account
FROM [MIS Accounts]
WHERE (((InStr([Account],"Medical Insurance"))<>"0"))
ORDER BY [MIS Accounts].Number;