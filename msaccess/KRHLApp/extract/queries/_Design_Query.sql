SELECT DISTINCTROW [>Design].*
FROM [>Design]
WHERE ((([>Design].Category)=Forms!Design.CategorySort) And (([>Design].ID)<>"ID"))
ORDER BY [>Design].Category, [>Design].ID
WITH OWNERACCESS OPTION;