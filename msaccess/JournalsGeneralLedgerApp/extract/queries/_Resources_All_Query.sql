SELECT DISTINCTROW [>Resources].*
FROM [>Resources]
WHERE ((([>Resources].Category)<>"Library"))
ORDER BY [>Resources].Category, [>Resources].ID;