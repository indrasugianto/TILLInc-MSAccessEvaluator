SELECT DISTINCTROW [>Note].*
FROM [>Note]
WHERE ((([>Note].ProductListKey)=Forms!ProductListMaster!ProductListControl!Key))
ORDER BY [>Note].ID
WITH OWNERACCESS OPTION;