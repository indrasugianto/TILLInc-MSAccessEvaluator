SELECT [>Materials].Key, [>Materials].ProductListKey AS TheKey
FROM [>Materials] LEFT JOIN [>Product Lists] ON [>Materials].ProductListKey=[>Product Lists].Key
WHERE ((([>Product Lists].Key) Is Null))
ORDER BY [>Materials].ProductListKey;