SELECT DISTINCTROW [>Material].Description, [>Material].Category, [>Material].ID, [>Material].Key
FROM [>Material]
WHERE ((([>Material].StandardMaterial)=No))
ORDER BY [>Material].Category, [>Material].Description, [>Material].ID
WITH OWNERACCESS OPTION;