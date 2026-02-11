SELECT DISTINCTROW [>Material].Category, [>Material].ID, [>Material].Description, [>Material].Factor, [>Material].CostAmount, [>Material].CostUnit
FROM [>Material]
WHERE ((([>Material].Category)<>"All"))
ORDER BY [>Material].Category, [>Material].ID
WITH OWNERACCESS OPTION;