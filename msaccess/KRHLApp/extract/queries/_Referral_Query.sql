SELECT DISTINCTROW [>Resources].ID, [>Resources].Category, [>Resources].Key, InStr([Category],"Contract") Or InStr([Category],"Customer") Or InStr([Category],"Architect") Or InStr([Category],"Design") AS Expr1
FROM [>Resources]
WHERE (((InStr([Category],"Contract") Or InStr([Category],"Customer") Or InStr([Category],"Architect") Or InStr([Category],"Design"))<>0))
ORDER BY [>Resources].Category, [>Resources].ID;