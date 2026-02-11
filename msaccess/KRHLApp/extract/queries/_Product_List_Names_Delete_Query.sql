SELECT DISTINCTROW [>Product Lists].ProductList, [>Jobs].ID, [>Product Lists].Key
FROM [>Product Lists] LEFT JOIN [>Jobs] ON [>Product Lists].Job=[>Jobs].Key
WHERE ((([>Product Lists].Key)<>Forms!ProductListMaster!ProductListControl!ProductListName) And (([>Product Lists].Archive)=False))
ORDER BY [>Product Lists].ProductList, [>Jobs].ID
WITH OWNERACCESS OPTION;