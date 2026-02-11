SELECT DISTINCTROW [>Resources].Key, [>Resources].ID, Count([>Drawings].Drawing) AS CountOfDrawing
FROM [>Resources] LEFT JOIN [>Drawings] ON [>Resources].Key=[>Drawings].Name
GROUP BY [>Resources].Key, [>Resources].ID, [>Resources].Category
HAVING ((([>Resources].Category)=Forms!Drawings.CategorySort))
ORDER BY [>Resources].ID
WITH OWNERACCESS OPTION;