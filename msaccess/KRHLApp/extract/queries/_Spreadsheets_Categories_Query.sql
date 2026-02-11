SELECT DISTINCTROW [>Resources].Key, [>Resources].ID, Count([>Spreadsheets].Spreadsheet) AS CountOfSpreadsheet
FROM [>Resources], [>Spreadsheets]
GROUP BY [>Resources].Key, [>Resources].ID, [>Resources].Category
HAVING ((([>Resources].Category)=Forms!Spreadsheets.CategorySort))
ORDER BY [>Resources].ID
WITH OWNERACCESS OPTION;