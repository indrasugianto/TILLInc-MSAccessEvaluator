SELECT DISTINCTROW [>Jobs].ID, [>Jobs].Key, [>Resources].ID
FROM [>Jobs] LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key
WHERE ((([>Jobs].Closed)=False))
ORDER BY [>Jobs].ID
WITH OWNERACCESS OPTION;