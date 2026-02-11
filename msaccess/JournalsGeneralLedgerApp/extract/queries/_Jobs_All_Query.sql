SELECT DISTINCTROW [>Jobs].Key, [>Jobs].ID, [>Jobs].Closed, [>Jobs].Estimate
FROM [>Jobs]
WHERE ((([>Jobs].ID) Is Not Null))
ORDER BY [>Jobs].ID;