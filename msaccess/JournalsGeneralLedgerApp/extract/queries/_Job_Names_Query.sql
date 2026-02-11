SELECT DISTINCTROW [>Jobs].Key, [>Jobs].ID, [>Resources].ID
FROM [>Jobs] LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key
WHERE ((([>Jobs].Closed)=False) AND (([>Jobs].Estimate)=False))
ORDER BY [>Jobs].ID
WITH OWNERACCESS OPTION;