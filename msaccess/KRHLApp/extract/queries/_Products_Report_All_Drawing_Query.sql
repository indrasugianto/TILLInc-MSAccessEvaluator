SELECT DISTINCTROW [>Products].ProductDrawing AS Expr1, [>Products].ProductType, [>Products].ID, [>Products].Description, [>Products].Key
FROM [>Products]
WHERE ((([>Products].ProductDrawing) Is Not Null) And (([>Products].HideDrawing)=False))
ORDER BY [>Products].ProductType, [>Products].ID
WITH OWNERACCESS OPTION;