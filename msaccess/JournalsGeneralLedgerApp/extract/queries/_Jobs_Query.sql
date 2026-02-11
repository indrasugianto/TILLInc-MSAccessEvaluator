SELECT DISTINCTROW [>Jobs].Key, [>Jobs].ID, [>Jobs].Closed
FROM [>Jobs]
WHERE ((([>Jobs].ID) Is Not Null) AND (([>Jobs].Estimate)=False))
ORDER BY [>Jobs].Closed DESC , [>Jobs].ID;