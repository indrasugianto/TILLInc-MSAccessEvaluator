SELECT DISTINCTROW [>Products].ID, [>Products].Category, [>Products].Description, [>Products].Key
FROM [>Products]
WHERE ((([>Products].ID)<>"") And (([>Products].ProductType)=Forms!Products.ProductType))
ORDER BY [>Products].Category, [>Products].ID
WITH OWNERACCESS OPTION;