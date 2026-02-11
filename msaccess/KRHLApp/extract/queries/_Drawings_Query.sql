SELECT DISTINCTROW [>Drawings].*
FROM [>Drawings]
WHERE ((([>Drawings].Name)=Forms!Drawings.Category And ([>Drawings].Name) Is Not Null))
ORDER BY Val(NNEZ([Sequence]))
WITH OWNERACCESS OPTION;