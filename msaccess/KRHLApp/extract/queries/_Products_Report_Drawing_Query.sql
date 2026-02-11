SELECT DISTINCTROW [>Products].ProductDrawing AS Expr1, [>Products].ProductType, [>Products].ID, [>Products].Key, [>Products].Key, [>Products].Description
FROM [>Products]
WHERE ((([>Products].Key)=Forms!Products.Key) And (([>Products].ProductDrawing) Is Not Null) And (([>Products].HideDrawing)=False))
ORDER BY [>Products].ProductType, [>Products].ID
WITH OWNERACCESS OPTION;