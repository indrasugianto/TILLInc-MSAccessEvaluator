SELECT DISTINCTROW [>Products].ProductDrawing AS Expr1, [>Products].ProductType, [>Products].ID, [>Products].Key
FROM [>Product List] LEFT JOIN [>Products] ON [>Product List].Product=[>Products].Key
WHERE ((([>Products].ProductDrawing) Is Not Null) And (([>Products].HideDrawing)=False) And (([>Product List].ProductListKey)=Forms!ProductList.ProductListName))
ORDER BY [>Products].ProductType, [>Products].ID
WITH OWNERACCESS OPTION;