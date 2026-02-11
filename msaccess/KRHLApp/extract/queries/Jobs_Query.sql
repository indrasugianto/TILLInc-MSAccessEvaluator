SELECT [>Jobs].*, [>Resources].ID
FROM [>Jobs] LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key
ORDER BY [>Jobs].Estimate DESC , [>Jobs].Closed DESC , [>Jobs].ID;