SELECT DISTINCTROW [>Jobs].ID, [>Jobs].Key, [>Jobs].Delivered, [>Jobs].Estimate
FROM [>Jobs]
WHERE ((([>Jobs].ID) Is Not Null) AND (([>Jobs].Estimate)=False) AND (([>Jobs].Closed)=False))
ORDER BY [>Jobs].ID;