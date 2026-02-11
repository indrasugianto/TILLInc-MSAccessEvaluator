SELECT DISTINCTROW [>Product Parts CNC].SubAssembly, First([>Product Parts CNC].Sequence) AS FirstOfSequence
FROM [>Product Parts CNC]
GROUP BY [>Product Parts CNC].SubAssembly, [>Product Parts CNC].Category, [>Product Parts CNC].CNCMachine
HAVING ((([>Product Parts CNC].SubAssembly) Is Not Null) And (([>Product Parts CNC].Category)=Forms!ProductListMaster!ProductListControl!Product) And (([>Product Parts CNC].CNCMachine)=Forms!CNC.CNCMachine))
ORDER BY First([>Product Parts CNC].Sequence);