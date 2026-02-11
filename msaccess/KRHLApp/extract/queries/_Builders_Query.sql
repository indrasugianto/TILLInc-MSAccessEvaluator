SELECT DISTINCTROW [>Resources].ID, [>Resources].Key
FROM [>Resources]
WHERE ((([>Resources].Category)="Builders"))
ORDER BY [>Resources].ID
WITH OWNERACCESS OPTION;