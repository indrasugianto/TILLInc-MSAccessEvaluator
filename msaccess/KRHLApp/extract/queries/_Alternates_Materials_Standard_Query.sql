SELECT DISTINCTROW [>Material].Description, [>Material].Category, [>Material].ID, [>Material].Key
FROM [>Material]
WHERE ((([>Material].StandardMaterial)=Yes))
ORDER BY [>Material].Category, [>Material].Description, [>Material].ID
WITH OWNERACCESS OPTION;