SELECT DISTINCTROW [>Products].ProductDrawing AS Expr1, [>Products].ProductType, [>Products].ID, [>Products].Key
FROM ([>Product List] LEFT JOIN [>Designs] ON [>Product List].ProductListKey=[>Designs].ProductListKey) LEFT JOIN [>Products] ON [>Designs].DesignAlternate=[>Products].Key
WHERE ((([>Products].ProductDrawing) Is Not Null) And (([>Products].HideDrawing)=False) And (([>Product List].ProductListKey)=Forms!ProductList.ProductListName))
ORDER BY [>Products].ProductType, [>Products].ID
WITH OWNERACCESS OPTION;