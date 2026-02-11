SELECT DISTINCTROW [>Jobs].Key, [>Jobs].ID
FROM [>Jobs]
WHERE ((([>Jobs].Customer)=Forms!Receipts.Payor) And (([>Jobs].Estimate)=False) And (([>Jobs].Closed)=False))
ORDER BY [>Jobs].ID;