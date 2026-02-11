SELECT DISTINCTROW [>Product List Note All Query].ProductList, Count([>Product List Note All Query].ProductList) AS CountOfProductList
FROM [>Product List Note All Query]
GROUP BY [>Product List Note All Query].ProductList
HAVING ((Not ([>Product List Note All Query].ProductList) Is Null))
WITH OWNERACCESS OPTION;