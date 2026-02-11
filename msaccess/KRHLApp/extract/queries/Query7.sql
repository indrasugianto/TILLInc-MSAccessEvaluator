SELECT [>Product Lists].ProductList, [>Designs].*, InStr([ProductList],"8.10.15") AS Expr1
FROM [>Product Lists] INNER JOIN [>Designs] ON [>Product Lists].Key = [>Designs].ProductListKey
WHERE (((InStr([ProductList],"8.10.15"))<>0));