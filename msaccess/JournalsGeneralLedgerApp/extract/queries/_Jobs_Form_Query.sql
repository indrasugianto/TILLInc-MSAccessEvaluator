SELECT DISTINCTROW [>Jobs].*, [>Resources].ID
FROM [>Jobs] LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key
WHERE ((([>Jobs].Key)=Forms!Jobs.JobName))
ORDER BY [>Jobs].ID;