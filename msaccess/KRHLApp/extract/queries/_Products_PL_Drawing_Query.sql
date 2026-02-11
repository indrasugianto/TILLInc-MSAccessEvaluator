SELECT DISTINCTROW [>Products].*, [>Product Drawing].ProductDrawing AS Expr1
FROM [>Directory], [>Products], [>Product Drawing]
WHERE ((([>Product Drawing].ProductDrawing) Is Not Null And ([>Product Drawing].ProductDrawing)<>""))
ORDER BY [>Products].ProductType, [>Products].ID
WITH OWNERACCESS OPTION;