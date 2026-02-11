SELECT DISTINCTROW [>Resources].Field1, [>Resources].Field3, [>Resources].Field2, [>Jobs].ShipTo, [>Jobs].ID, [>Product List].ProductList, [>Product List].Key
FROM ([>Product List] INNER JOIN [>Jobs] ON [>Product List].Job=[>Jobs].Key) LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key
WHERE ((([>Product List].ProductList)=Forms!ProductListMaster!ProductListControl!ProductListName))
ORDER BY [>Product List].Key
WITH OWNERACCESS OPTION;