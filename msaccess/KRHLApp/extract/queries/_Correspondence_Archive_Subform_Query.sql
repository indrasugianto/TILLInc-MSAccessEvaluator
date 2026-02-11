SELECT DISTINCTROW [>Correspondence].*
FROM [>Correspondence]
WHERE ((([>Correspondence].Name)=Forms!Resources.Key))
ORDER BY [>Correspondence].Date DESC , [>Correspondence].ID
WITH OWNERACCESS OPTION;