SELECT DISTINCTROW [>Settings].PartsTypeCode, [>Settings].PartsType
FROM [>Settings]
WHERE ((([>Settings].PartsType)<>"" And ([>Settings].PartsType) Is Not Null))
ORDER BY [>Settings].PartsTypeCode
WITH OWNERACCESS OPTION;