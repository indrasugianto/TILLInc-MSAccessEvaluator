SELECT DISTINCTROW [>Parts].*
FROM [>Parts]
WHERE ((([>Parts].Draw)=Yes) And (([>Parts].Category)=Forms!Parts.CategorySort))
ORDER BY [>Parts].SubAssembly DESC , [>Parts].Part
WITH OWNERACCESS OPTION;