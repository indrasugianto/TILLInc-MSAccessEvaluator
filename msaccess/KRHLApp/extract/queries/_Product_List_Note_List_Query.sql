SELECT DISTINCTROW [>Note].ID, [>Note].Note, [>Product List].ProductListKey, [>Note].EntryDate, [>Note].Key, [>Note].EntryDate, [>Product List].Item, [>Product Lists].ProductList
FROM ([>Note] RIGHT JOIN [>Product List] ON [>Note].ProductListKey = [>Product List].Key) LEFT JOIN [>Product Lists] ON [>Product List].ProductListKey = [>Product Lists].Key
WHERE ((([>Note].Note)<>"") And (([>Product List].ProductListKey)=Forms!ProductListMaster!ProductListControl!ProductListName))
ORDER BY [>Note].ID
WITH OWNERACCESS OPTION;