SELECT DISTINCTROW [>Resources].Key, [>Resources].ID
FROM [>Resources]
WHERE ((([>Resources].Category)=Forms!Correspondence.CategorySort))
ORDER BY [>Resources].ID
WITH OWNERACCESS OPTION;