SELECT DISTINCTROW [>Product Lists].ProductList, [>Designs].Alternate, First([>Designs].Key) AS FirstOfKey
FROM [>Designs] LEFT JOIN [>Product Lists] ON [>Designs].ProductListKey=[>Product Lists].Key
GROUP BY [>Product Lists].ProductList, [>Designs].Alternate, [>Designs].ProductListKey
HAVING ((([>Product Lists].ProductList) Is Not Null) AND (([>Designs].Alternate) Is Not Null) AND (([>Designs].ProductListKey) Is Not Null))
ORDER BY [>Product Lists].ProductList, [>Designs].Alternate
WITH OWNERACCESS OPTION;