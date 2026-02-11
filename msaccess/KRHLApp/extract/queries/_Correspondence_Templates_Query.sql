SELECT DISTINCTROW [>Correspondence].ID, [>Correspondence].Key
FROM [>Correspondence] LEFT JOIN [>Resources] ON [>Correspondence].Name=[>Resources].Key
WHERE (((InStr([Category],"Template"))<>"0"))
ORDER BY [>Correspondence].ID
WITH OWNERACCESS OPTION;