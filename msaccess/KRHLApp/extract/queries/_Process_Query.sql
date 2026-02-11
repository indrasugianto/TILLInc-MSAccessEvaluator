SELECT DISTINCTROW [>Processes].Key, [>Processes].ID, [>Processes].Category, [>Processes].[Process Abbreviation], [>Processes].Cost, [>Processes].CostUnit
FROM [>Processes]
ORDER BY [>Processes].Category, [>Processes].ID
WITH OWNERACCESS OPTION;