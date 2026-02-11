SELECT DISTINCTROW [>Products].ID, [>Products_1].ID, [>Products].ProductDrawing AS Expr1, [>Products_1].ProductDrawing AS Expr2, [>Products].ProductType, [>Products_1].ProductType
FROM (([>Product List] LEFT JOIN [>Options] ON [>Product List].Key=[>Options].ProductListKey) LEFT JOIN [>Products] ON [>Options].Option=[>Products].Key) LEFT JOIN ([>Designs] LEFT JOIN [>Products] AS [>Products_1] ON [>Designs].DesignAlternate=[>Products_1].Key) ON [>Product List].Key=[>Designs].ProductListKey
WHERE ((([>Product List].ProductListKey)=Forms!ProductList.ProductListName))
ORDER BY [>Products].ID, [>Products_1].ID
WITH OWNERACCESS OPTION;