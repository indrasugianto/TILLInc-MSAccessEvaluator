SELECT DISTINCTROW [MIS Accounts].Number, [MIS Accounts].Account
FROM [MIS Accounts]
WHERE (((InStr([Account],"Accounts Payable"))<>"0"))
ORDER BY [MIS Accounts].Number
WITH OWNERACCESS OPTION;