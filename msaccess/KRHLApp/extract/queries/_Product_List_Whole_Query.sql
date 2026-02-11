SELECT DISTINCTROW [>Product List].*, [>Product List].Key AS PLKey, [>Products].Category, [>Product Lists].ProductList, [>Product Lists].Job, [>Products].Description, [>Product Lists].Text1, [>Product Lists].IncludeInEstimate
FROM ([>Product List] LEFT JOIN [>Products] ON [>Product List].Product = [>Products].Key) LEFT JOIN [>Product Lists] ON [>Product List].ProductListKey = [>Product Lists].Key
WHERE ((([>Product List].ProductListKey)=[Forms]![ProductListMaster]![ProductListControl]![ProductListName]))
ORDER BY [>Product List].Item, [>Product List].Reference1
WITH OWNERACCESS OPTION;