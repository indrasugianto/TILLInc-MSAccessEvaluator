SELECT DISTINCTROW [>Jobs].*, [>Resources].ID
FROM [>Jobs] LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key
WHERE ((([>Jobs].Key)=Forms!Job.JobName))
ORDER BY [>Jobs].ID;