SELECT DISTINCTROW [>Products].Category, First([>Products].Key) AS FirstOfKey
FROM [>Products]
GROUP BY [>Products].Category, [>Products].ProductType
HAVING ((([>Products].Category) Is Not Null) AND (([>Products].ProductType)="Design" Or ([>Products].ProductType)="Null"))
ORDER BY [>Products].Category
WITH OWNERACCESS OPTION;