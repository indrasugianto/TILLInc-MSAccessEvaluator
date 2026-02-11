SELECT DISTINCTROW [>Correspondence].*, [>Correspondence].Key, [>Correspondence].ID, [>Correspondence].Correspondence, [>Correspondence].Date, [>Correspondence].Description, [>Correspondence].Name
FROM [>Correspondence]
WHERE ((([>Correspondence].Name)=Forms!Resources.Key))
ORDER BY [>Correspondence].Date DESC , [>Correspondence].ID
WITH OWNERACCESS OPTION;