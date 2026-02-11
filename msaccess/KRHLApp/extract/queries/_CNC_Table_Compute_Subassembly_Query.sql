SELECT DISTINCTROW [>CNC].Subassembly, First([>CNC].Sequence) AS FirstOfSequence
FROM [>CNC]
WHERE ((([>CNC].ProductList) Is Not Null))
GROUP BY [>CNC].Subassembly
HAVING ((([>CNC].Subassembly) Is Not Null))
ORDER BY [>CNC].Subassembly, First([>CNC].Sequence);