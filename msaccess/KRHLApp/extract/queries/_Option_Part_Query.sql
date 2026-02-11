SELECT DISTINCTROW [>Option Parts].*
FROM [>Option Parts]
WHERE ((([>Option Parts].Category)=Forms!OptionParts.CategorySort))
ORDER BY [>Option Parts].SubAssembly, [>Option Parts].Part
WITH OWNERACCESS OPTION;