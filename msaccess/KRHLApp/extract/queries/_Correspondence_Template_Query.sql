SELECT DISTINCTROW [>Correspondence].ID, [>Correspondence].Key
FROM [>Correspondence] RIGHT JOIN [>Resources] ON [>Correspondence].Name=[>Resources].Key
WHERE ((([>Resources].Category)="Templates") AND (([>Resources].ID)="Estimate"))
ORDER BY [>Correspondence].ID
WITH OWNERACCESS OPTION;