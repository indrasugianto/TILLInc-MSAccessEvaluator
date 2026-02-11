SELECT DISTINCTROW [>Spreadsheets].*, Val(NNEZ([Sequence])) AS Expr1
FROM [>Spreadsheets]
WHERE ((([>Spreadsheets].Name)=Forms!Spreadsheets.Category And ([>Spreadsheets].Name) Is Not Null))
ORDER BY Val(NNEZ([Sequence]))
WITH OWNERACCESS OPTION;