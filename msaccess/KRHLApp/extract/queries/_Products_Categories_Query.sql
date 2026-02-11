SELECT DISTINCTROW [>Products].Category, [>Products].ProductType
FROM [>Products]
GROUP BY [>Products].Category, [>Products].ProductType
HAVING ((([>Products].ProductType)=Forms!Products.ProductType))
ORDER BY [>Products].Category
WITH OWNERACCESS OPTION;