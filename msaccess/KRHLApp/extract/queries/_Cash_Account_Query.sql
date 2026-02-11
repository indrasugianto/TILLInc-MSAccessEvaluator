SELECT DISTINCTROW [MIS Accounts].Number, [MIS Accounts].Account
FROM [MIS Accounts]
WHERE (((InStr([Account],"cash"))<>"0"));