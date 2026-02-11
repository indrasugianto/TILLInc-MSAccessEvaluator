SELECT DISTINCTROW [>Designs].*
FROM [>Designs]
WHERE ((([>Designs].ProductListKey)=Forms!ProductListMaster!ProductListControl!ProductListName) And (([>Designs].Alternate)=Forms!ProductListMaster!ProductListControl!Alternate))
ORDER BY [>Designs].DesignType
WITH OWNERACCESS OPTION;