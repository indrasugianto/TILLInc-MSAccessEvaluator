SELECT DISTINCTROW [>Products].ID, [>Products].Category, [>Products].Description, [>Products].Key, [>Products].Requirement
FROM [>Products]
WHERE ((([>Products].ProductType)="Option"))
ORDER BY [>Products].Category, [>Products].ID
WITH OWNERACCESS OPTION;