SELECT DISTINCTROW [>Products].Category, First([>Products].Key) AS FirstOfKey
FROM [>Products]
GROUP BY [>Products].Category, [>Products].ProductType
HAVING ((([>Products].ProductType)="Design"))
ORDER BY [>Products].Category
WITH OWNERACCESS OPTION;