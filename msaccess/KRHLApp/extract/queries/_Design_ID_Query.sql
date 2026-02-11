SELECT DISTINCTROW [>Products].ID, [>Products].Category, [>Products].Description, [>Products].Key
FROM [>Products]
GROUP BY [>Products].ID, [>Products].Category, [>Products].Description, [>Products].Key, [>Products].ID, [>Products].ProductType
HAVING ((([>Products].ID)<>"") AND (([>Products].Category)<>"") AND (([>Products].ProductType)="Design"))
ORDER BY [>Products].Category, [>Products].ID
WITH OWNERACCESS OPTION;