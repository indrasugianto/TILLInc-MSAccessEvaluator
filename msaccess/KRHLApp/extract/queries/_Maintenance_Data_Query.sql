SELECT DISTINCTROW [>Settings].TableIndex
FROM [>Settings]
WHERE ((([>Settings].TableIndex)<>"" Or ([>Settings].TableIndex) Is Not Null))
ORDER BY [>Settings].TableIndex
WITH OWNERACCESS OPTION;