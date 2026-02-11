SELECT DISTINCTROW [>Resources].ID, [>Resources].Category, [>Resources].Key, [>Resources].Field1, [>Resources].Field2, [>Resources].Field3, [>Resources].Field4, [>Resources].TheName, [>Resources].CompanyName, [>Resources].Address, [>Resources].State, [>Resources].Zip, [>Resources].AreaCode, [>Resources].Comment, [>Resources].Customer AS Expr1
FROM [>Resources]
ORDER BY [>Resources].Category, [>Resources].ID
WITH OWNERACCESS OPTION;