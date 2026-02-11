SELECT DISTINCTROW [>Material].Description, [>Material].Key, [>Material].Category, [>Material].ID
FROM [>Material]
WHERE ((([>Material].StandardMaterial)=No))
ORDER BY [>Material].Category, [>Material].Description, [>Material].ID
WITH OWNERACCESS OPTION;