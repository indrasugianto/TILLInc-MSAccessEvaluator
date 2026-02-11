SELECT DISTINCTROW [>Settings].CNCFunctionDescription, [>Settings].CNCFunction, [>Settings].CNCMachines, [>Settings].Key
FROM [>Settings]
WHERE ((([>Settings].CNCFunction) Is Not Null))
ORDER BY [>Settings].CNCMachines, [>Settings].CNCFunctionDescription;