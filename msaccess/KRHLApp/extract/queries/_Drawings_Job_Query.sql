SELECT DISTINCTROW [>Drawings].Job AS Expr1, [>Drawings].Name
FROM [>Drawings]
GROUP BY [>Drawings].Job, [>Drawings].Name
HAVING ((([>Drawings].Name)=Forms!Drawings.Category))
ORDER BY [>Drawings].Job;