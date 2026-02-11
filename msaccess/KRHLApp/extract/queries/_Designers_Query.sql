SELECT DISTINCTROW [>Resources].ID, [>Resources].Key
FROM [>Resources]
WHERE ((([>Resources].Category)="Designers"))
ORDER BY [>Resources].ID
WITH OWNERACCESS OPTION;