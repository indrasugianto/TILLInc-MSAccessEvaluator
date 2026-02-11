SELECT [>Product List].Component, [>Product List].ComponentText
FROM [>Product List]
WHERE ((([>Product List].ProductListKey)=[Forms]![ProductListMaster]![ProductListControl]![ProductListName]))
GROUP BY [>Product List].Component, [>Product List].ComponentText
HAVING ((([>Product List].Component) Is Not Null));