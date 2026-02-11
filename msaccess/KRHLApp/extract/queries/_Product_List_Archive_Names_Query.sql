SELECT DISTINCTROW [>Product Lists].ProductList, [>Jobs].ID, [>Product Lists].Key, [>Product Lists].Archive
FROM [>Product Lists] LEFT JOIN [>Jobs] ON [>Product Lists].Job=[>Jobs].Key
WHERE ((([>Product Lists].Archive)=True))
ORDER BY [>Product Lists].ProductList, [>Jobs].ID
WITH OWNERACCESS OPTION;