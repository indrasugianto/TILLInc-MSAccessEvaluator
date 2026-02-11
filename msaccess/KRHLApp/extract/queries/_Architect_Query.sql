SELECT DISTINCTROW [>Resources].ID, [>Resources].Category, [>Resources].Key, InStr([Category],"Architect") AS Expr1
FROM [>Resources]
WHERE (((InStr([Category],"Architect"))<>0))
ORDER BY [>Resources].Category, [>Resources].ID;