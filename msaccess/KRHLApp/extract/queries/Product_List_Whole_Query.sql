SELECT DISTINCTROW [>Product List].Item
FROM [>Product List]
WHERE ((([>Product List].ProductListKey)=[Forms]![ProductListMaster]![ProductListControl]![ProductListName]))
ORDER BY [>Product List].Item, [>Product List].Reference1
WITH OWNERACCESS OPTION;