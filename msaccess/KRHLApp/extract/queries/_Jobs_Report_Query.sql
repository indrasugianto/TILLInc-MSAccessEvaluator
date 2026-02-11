SELECT DISTINCTROW [>Jobs].*, [>Resources].*
FROM [>Jobs] LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key
WHERE ((([>Jobs].Estimate)=No) AND (([>Jobs].Closed)=No))
ORDER BY [>Jobs].Estimate DESC , [>Jobs].ID
WITH OWNERACCESS OPTION;