SELECT DISTINCTROW [>Product List].*, [>Resources].ID, [>Resources].Field1, [>Resources].Field3, [>Resources].Field2, [>Jobs].ShipTo, [>Jobs].ID, [>Options].OptionRequirement, [>Options].OptionName AS Expr1
FROM ([>Product List] INNER JOIN ([>Jobs] LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key) ON [>Product List].Job=[>Jobs].Key) LEFT JOIN [>Options] ON [>Product List].Key=[>Options].ProductListKey
WHERE ((([>Product List].Job)=Forms!Jobs.JobName) And (([>Product List].HideItemInList)=False))
ORDER BY [>Product List].ProductList, [>Product List].Item
WITH OWNERACCESS OPTION;