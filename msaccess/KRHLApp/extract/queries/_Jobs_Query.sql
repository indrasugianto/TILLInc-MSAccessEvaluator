SELECT DISTINCTROW [>Jobs].ID, [>Jobs].Key, [>Jobs].Customer
FROM [>Jobs]
GROUP BY [>Jobs].ID, [>Jobs].Key, [>Jobs].Customer
ORDER BY [>Jobs].ID
WITH OWNERACCESS OPTION;