SELECT DISTINCTROW [>Material].Category, [>Material].ID, [>Material].Description, [>Material].Key, [>Material].Category, [>Material].Description, [>Material].CostAmount, [>Material].CostUnit
FROM [>Material]
WHERE ((([>Material].StandardMaterial)=Yes))
ORDER BY [>Material].Category, [>Material].ID
WITH OWNERACCESS OPTION;