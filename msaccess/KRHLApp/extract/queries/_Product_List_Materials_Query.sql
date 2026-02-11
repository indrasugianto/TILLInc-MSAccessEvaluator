SELECT DISTINCTROW [>Materials].*, [>Material].Description
FROM [>Materials] LEFT JOIN [>Material] ON [>Materials].Material=[>Material].Key
WHERE ((([>Materials].ProductListKey)=Forms!ProductListMaster!ProductListControl!ProductListName) And (([>Materials].Alternate)=Forms!ProductListMaster!ProductListControl!Alternate))
ORDER BY [>Material].Description
WITH OWNERACCESS OPTION;