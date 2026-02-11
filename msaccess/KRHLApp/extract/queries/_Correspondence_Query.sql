SELECT DISTINCTROW [>Correspondence].*
FROM [>Correspondence]
WHERE ((([>Correspondence].Name)=Forms!Correspondence.Category))
ORDER BY Val(NNEZ([Sequence]))
WITH OWNERACCESS OPTION;