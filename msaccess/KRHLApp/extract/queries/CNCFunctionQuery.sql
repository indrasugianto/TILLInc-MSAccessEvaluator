SELECT [>Settings].Key, [>Settings].CNCFunctionDescription
FROM [>Settings]
WHERE ((([>Settings].CNCFunctionDescription)<>"") AND (([>Settings].CNCDXF)<>""))
ORDER BY [>Settings].CNCFunctionDescription;