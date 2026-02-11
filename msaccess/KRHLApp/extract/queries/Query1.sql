SELECT [>Product Lists].ProductList, [>Note].ID, [>Note].Note, [>Note].EntryDate
FROM ([>Product List] LEFT JOIN [>Product Lists] ON [>Product List].ProductListKey=[>Product Lists].Key) LEFT JOIN [>Note] ON [>Product List].Key=[>Note].ProductListKey
WHERE ((([>Note].ID)="Rework") AND (([>Note].EntryDate) Is Not Null))
ORDER BY [>Note].EntryDate DESC;