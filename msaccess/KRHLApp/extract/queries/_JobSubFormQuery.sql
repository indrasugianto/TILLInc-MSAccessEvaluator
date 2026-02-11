SELECT DISTINCTROW [>Jobs].*, [>Resources].ID, [>Jobs].ID AS JobName
FROM [>Jobs] LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key
WHERE ((([>Jobs].Key)=Forms!Sales.JobName))
ORDER BY [>Jobs].ID;