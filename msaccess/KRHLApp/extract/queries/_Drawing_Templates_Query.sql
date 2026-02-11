SELECT DISTINCTROW [>Drawings].ID, [>Drawings].Key
FROM [>Resources] RIGHT JOIN [>Drawings] ON [>Resources].Key=[>Drawings].Name
WHERE (((InStr([Category],"Template"))<>"0"))
ORDER BY [>Drawings].ID
WITH OWNERACCESS OPTION;