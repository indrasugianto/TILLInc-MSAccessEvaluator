SELECT DISTINCTROW [>Jobs].ID, [>Jobs].Key, [>Jobs].Customer, [>Jobs].Estimate, [>Resources].ID, [>Jobs].Closed
FROM [>Jobs] LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key
ORDER BY [>Jobs].Closed DESC , [>Jobs].Estimate DESC , [>Jobs].ID;