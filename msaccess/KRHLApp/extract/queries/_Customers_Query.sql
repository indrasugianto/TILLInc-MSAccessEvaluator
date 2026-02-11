SELECT DISTINCTROW [>Resources].ID, [>Resources].Key
FROM [>Resources]
WHERE ((([>Resources].Category)="Customer"))
ORDER BY [>Resources].ID
WITH OWNERACCESS OPTION;