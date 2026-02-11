SELECT DISTINCTROW [>Products].ID, [>Products].Category, [>Products].ProductDrawing AS Expr1, [>Products].Key
FROM [>Products]
WHERE ((([>Products].ProductDrawing) Is Not Null))
ORDER BY [>Products].Category, [>Products].ID;