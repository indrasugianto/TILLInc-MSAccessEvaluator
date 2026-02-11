SELECT DISTINCTROW [>Products].Category
FROM [>Products]
WHERE ((([>Products].ProductType)="Product") AND ((Left([Category],1)<>"z")=True) AND (([>Products].Category)<>"Obsolete" And ([>Products].Category)<>"Utility" And ([>Products].Category)<>"Drawing Appliance"))
GROUP BY [>Products].Category, [>Products].HideInPLList
HAVING ((([>Products].Category) Is Not Null) AND (([>Products].HideInPLList)=False))
ORDER BY [>Products].Category;