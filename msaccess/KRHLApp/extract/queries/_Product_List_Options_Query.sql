SELECT DISTINCTROW [>Options].*, [>Products].Category, [>Products].ID
FROM [>Options] INNER JOIN [>Products] ON [>Options].Option=[>Products].Key
WHERE ((([>Options].ProductListKey)=Forms!ProductListMaster!ProductListControl!Key))
ORDER BY [>Products].Category, [>Products].ID
WITH OWNERACCESS OPTION;