SELECT DISTINCTROW [>Material].*
FROM [>Material]
WHERE ((([>Material].Category)=Forms!Material.CategorySort) And (([>Material].StandardMaterial)=No))
ORDER BY [>Material].Category, [>Material].Description
WITH OWNERACCESS OPTION;