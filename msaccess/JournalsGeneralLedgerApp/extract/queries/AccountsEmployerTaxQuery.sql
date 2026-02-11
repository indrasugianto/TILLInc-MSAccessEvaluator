SELECT [MIS Accounts].Number, [MIS Accounts].Account
FROM [MIS Accounts]
WHERE (((InStr([Account],"Employer Tax"))<>"0"))
ORDER BY [MIS Accounts].Number;