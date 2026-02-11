SELECT DISTINCTROW [>Products].Key, [>Products].ProductType, [>Products].Category, [>Products].ID, [>Products].Description, [>Products].ProductDrawing AS Expr1, [>Products].Graphic2 AS Expr2, [>Products].Graphic3 AS Expr3
FROM [>Products]
WHERE ((([>Products].ProductDrawing) Is Not Null));