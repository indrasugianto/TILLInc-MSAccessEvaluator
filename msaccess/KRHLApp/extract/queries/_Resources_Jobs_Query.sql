SELECT DISTINCTROW [>Resources].ID, [>Resources].Category, [>Resources].Key, [>Resources].Field1, [>Resources].Field2, [>Resources].Field3, [>Resources].Field4, [>Resources].TheName, [>Resources].Address, [>Resources].State, [>Resources].Zip, [>Resources].AreaCode, [>Resources].Comment
FROM [>Resources] INNER JOIN [>Jobs] ON [>Resources].Key=[>Jobs].Customer
ORDER BY [>Resources].Category, [>Resources].ID
WITH OWNERACCESS OPTION;