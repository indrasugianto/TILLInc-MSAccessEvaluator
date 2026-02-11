SELECT DISTINCTROW [>Note].ID, Count([>Note].ID) AS CountOfID
FROM [>Note] INNER JOIN [>Product List Whole Query] ON [>Note].ProductListKey=[>Product List Whole Query].Key
GROUP BY [>Note].ID
HAVING (((Count([>Note].ID))<>0))
WITH OWNERACCESS OPTION;