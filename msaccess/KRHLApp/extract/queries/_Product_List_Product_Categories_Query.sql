SELECT DISTINCTROW [>Products].Category
FROM [>Product List Whole Query] INNER JOIN [>Products] ON [>Product List Whole Query].Product=[>Products].Key
GROUP BY [>Products].Category
ORDER BY [>Products].Category
WITH OWNERACCESS OPTION;