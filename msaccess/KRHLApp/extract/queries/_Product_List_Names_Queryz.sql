SELECT DISTINCTROW [>Product Lists].ProductList AS [Product List Name], [>Jobs].ID AS Job, [>Product Lists].Key AS [Record Number], [>Product Lists].Archive
FROM [>Product Lists] LEFT JOIN [>Jobs] ON [>Product Lists].Job=[>Jobs].Key
WHERE ((([>Product Lists].Archive)=False))
ORDER BY [>Product Lists].ProductList, [>Jobs].ID
WITH OWNERACCESS OPTION;