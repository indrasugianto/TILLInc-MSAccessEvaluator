SELECT DISTINCTROW [>Product List].*
FROM [>Product List] LEFT JOIN [>Product Lists] ON [>Product List].ProductListKey=[>Product Lists].Key
WHERE ((([>Product Lists].Job)=Forms!Jobs.JobName))
ORDER BY [>Product Lists].ProductList, [>Product List].Item
WITH OWNERACCESS OPTION;