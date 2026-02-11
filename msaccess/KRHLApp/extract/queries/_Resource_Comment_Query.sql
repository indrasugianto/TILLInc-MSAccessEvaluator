SELECT DISTINCTROW [>Resources].Comment AS [Marketing Category], Count([>Resources].ID) AS [Found]
FROM [>Resources]
GROUP BY [>Resources].Comment
HAVING ((([>Resources].Comment)<>""))
ORDER BY [>Resources].Comment
WITH OWNERACCESS OPTION;