SELECT DISTINCTROW [>Products].ID, [>Products].Category, [>Products].Description, [>Products].Key
FROM [>Products]
WHERE ((([>Products].ProductType)="Product"))
ORDER BY [>Products].Category, [>Products].ID
WITH OWNERACCESS OPTION;