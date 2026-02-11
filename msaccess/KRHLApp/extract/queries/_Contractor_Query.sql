SELECT DISTINCTROW [>Resources].ID, [>Resources].Category, [>Resources].Key, InStr([Category],"Contract") AS Expr1
FROM [>Resources]
WHERE (((InStr([Category],"Contract"))<>0))
ORDER BY [>Resources].Category, [>Resources].ID;