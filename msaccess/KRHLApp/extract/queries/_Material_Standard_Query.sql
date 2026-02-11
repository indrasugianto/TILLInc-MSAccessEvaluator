SELECT DISTINCTROW [>Material].*
FROM [>Material]
WHERE ((([>Material].Category)=Forms!Material.CategorySort) And (([>Material].StandardMaterial)=Yes))
ORDER BY [>Material].Category, [>Material].ID
WITH OWNERACCESS OPTION;