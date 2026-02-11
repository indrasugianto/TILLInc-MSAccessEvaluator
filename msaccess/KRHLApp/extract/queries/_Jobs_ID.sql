SELECT DISTINCTROW [>Jobs].ID, [>Jobs].Key
FROM [>Jobs]
WHERE ((([>Jobs].Estimate)=False))
ORDER BY [>Jobs].ID;