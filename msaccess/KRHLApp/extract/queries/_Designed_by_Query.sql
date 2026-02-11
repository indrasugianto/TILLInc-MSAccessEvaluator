SELECT DISTINCTROW [>Resources].ID, [>Resources].Category, [>Resources].Key, InStr([Category],"Design") AS Expr1
FROM [>Resources]
WHERE (((InStr([Category],"Design"))<>0))
ORDER BY [>Resources].Category, [>Resources].ID;