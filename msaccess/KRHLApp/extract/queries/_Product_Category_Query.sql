SELECT DISTINCTROW [>Products].Category
FROM [>Products]
WHERE ((([>Products].ProductType)="Product"))
GROUP BY [>Products].Category, [>Products].HideInPLList
HAVING ((([>Products].Category) Is Not Null) AND (([>Products].HideInPLList)=False))
ORDER BY [>Products].Category;