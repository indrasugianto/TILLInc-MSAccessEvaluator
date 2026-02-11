SELECT DISTINCTROW [>Product Parts CNC].SubAssembly
FROM [>Product List Query], [>Product Parts CNC]
GROUP BY [>Product Parts CNC].SubAssembly
HAVING ((([>Product Parts CNC].SubAssembly) Is Not Null))
ORDER BY First([>Product Parts CNC].Sequence);