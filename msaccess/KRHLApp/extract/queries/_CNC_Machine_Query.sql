SELECT DISTINCTROW [>Settings].CNCMachines, [>Settings].CNCFunction, [>Settings].CNCToolSize, [>Settings].CNCFunctionDescription
FROM [>Settings]
WHERE ((([>Settings].CNCMachines) Is Not Null))
ORDER BY [>Settings].CNCMachines, [>Settings].CNCFunctionDescription;