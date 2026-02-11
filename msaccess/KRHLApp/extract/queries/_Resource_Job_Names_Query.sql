SELECT DISTINCTROW [>Jobs].ID, [>Jobs].Key
FROM [>Jobs]
WHERE ((([>Jobs].Customer)=Forms!Resources.Key))
ORDER BY [>Jobs].ID
WITH OWNERACCESS OPTION;