SELECT DISTINCTROW [>Jobs].Key, [>Jobs].ID, [>Jobs].Closed
FROM [>General Ledger Query] INNER JOIN [>Jobs] ON [>General Ledger Query].Job=[>Jobs].Key
WHERE ((([>Jobs].ID) Is Not Null) AND (([>Jobs].Estimate)=False))
ORDER BY [>Jobs].ID;