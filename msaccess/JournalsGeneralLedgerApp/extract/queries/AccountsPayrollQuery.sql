SELECT [MIS Accounts].Number, [MIS Accounts].Account
FROM [MIS Accounts]
WHERE (((InStr([Account],"Payroll"))<>"0"))
ORDER BY [MIS Accounts].Number;