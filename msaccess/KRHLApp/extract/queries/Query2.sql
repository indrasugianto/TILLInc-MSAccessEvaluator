SELECT [>Resources].Field4 AS Email, [>Resources].ID AS Company, [>Resources].State AS State, [>Resources].Comment
FROM [>Resources]
WHERE ((([>Resources].Field4)<>"") AND (([>Resources].Comment)<>""))
ORDER BY [>Resources].Comment, [>Resources].ID;