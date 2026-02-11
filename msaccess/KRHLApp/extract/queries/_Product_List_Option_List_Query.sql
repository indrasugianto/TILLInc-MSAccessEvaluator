SELECT DISTINCTROW [>Product List].Item, [>Products].ID, [>Products].Description, [>Options].OptionRequirement, [>Product List].ProductListKey, [>Product Lists].ProductList
FROM ([>Options] RIGHT JOIN ([>Product List] LEFT JOIN [>Product Lists] ON [>Product List].ProductListKey = [>Product Lists].Key) ON [>Options].ProductListKey = [>Product List].Key) LEFT JOIN [>Products] ON [>Options].Option = [>Products].Key
WHERE ((([>Products].ID)<>"") And (([>Product List].ProductListKey)=Forms!ProductListMaster!ProductListControl!ProductListName))
ORDER BY [>Product List].Item, [>Products].ID
WITH OWNERACCESS OPTION;