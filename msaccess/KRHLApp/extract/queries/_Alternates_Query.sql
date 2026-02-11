SELECT DISTINCTROW [>Designs].Alternate, [>Designs].ProductListKey
FROM [>Designs]
GROUP BY [>Designs].Alternate, [>Designs].ProductListKey
HAVING ((([>Designs].ProductListKey)=Forms!ProductListMaster!ProductListControl!ProductListName))
ORDER BY [>Designs].Alternate
WITH OWNERACCESS OPTION;