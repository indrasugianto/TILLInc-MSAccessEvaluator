SELECT DISTINCTROW [>Resources].Category
FROM [>Resources]
GROUP BY [>Resources].Category
HAVING (((InStr([Category],"Select a"))="0"))
ORDER BY [>Resources].Category
WITH OWNERACCESS OPTION;