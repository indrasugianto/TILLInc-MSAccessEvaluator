SELECT DISTINCTROW [>Jobs].Closed, [>Jobs].Estimate, [>Jobs].ID, [>Resources].ID
FROM [>Jobs] LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key
ORDER BY [>Jobs].Closed DESC , [>Jobs].Estimate DESC , [>Jobs].ID;