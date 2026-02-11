SELECT DISTINCTROW [>Resources].ID, [>Resources].Key
FROM [>Resources]
WHERE ((([>Resources].Category)="Suppliers"))
ORDER BY [>Resources].ID
WITH OWNERACCESS OPTION;