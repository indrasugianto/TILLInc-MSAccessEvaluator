SELECT DISTINCTROW [>Resources].ID, [>Resources].Category, [>Resources].Key
FROM [>Resources]
WHERE ((([>Resources].Category)=Forms!Resources.CategorySort))
ORDER BY [>Resources].ID, [>Resources].Category
WITH OWNERACCESS OPTION;