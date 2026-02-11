SELECT DISTINCTROW [>Resources].Category
FROM [>Resources]
GROUP BY [>Resources].Category
HAVING ((([>Resources].Category)<>"Library"))
ORDER BY [>Resources].Category
WITH OWNERACCESS OPTION;