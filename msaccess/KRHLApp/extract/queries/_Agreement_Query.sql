SELECT DISTINCTROW [>Resources].ID, [>Resources].Category, [>Resources].Key, InStr([Category],"Contract") Or InStr([Category],"Customer") Or InStr([Category],"Architect") Or InStr([Category],"Design") AS Expr1
FROM [>Resources]
ORDER BY [>Resources].Category, [>Resources].ID;