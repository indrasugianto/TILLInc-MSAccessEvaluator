SELECT DISTINCTROW [>Resources].ID, [>Resources].Key, [>Resources].Category
FROM [>Resources]
WHERE ((([>Resources].Category)<>"library"))
ORDER BY [>Resources].Category, [>Resources].ID
WITH OWNERACCESS OPTION;