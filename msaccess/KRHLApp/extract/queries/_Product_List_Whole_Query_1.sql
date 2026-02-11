SELECT DISTINCTROW [>Product List].*, [>Product List].Key AS PLKey, [>Products].Category, [>Products].Description
FROM [>Product List] LEFT JOIN [>Products] ON [>Product List].Product=[>Products].Key
WHERE ((([>Product List].ProductListKey)=Forms!ProductListMaster!ProductListControl!ProductListName))
ORDER BY [>Product List].Item, [>Product List].Reference1
WITH OWNERACCESS OPTION;