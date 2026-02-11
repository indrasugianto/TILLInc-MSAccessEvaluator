SELECT DISTINCTROW [>Jobs].ID, [>Jobs].Key, [>Jobs].Customer
FROM [>Jobs]
WHERE ((([>Jobs].Customer)=Forms!Resources.ResourceList))
ORDER BY [>Jobs].ID
WITH OWNERACCESS OPTION;