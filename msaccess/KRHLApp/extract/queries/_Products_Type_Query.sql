SELECT DISTINCTROW [>Settings].ProductsType
FROM [>Settings]
GROUP BY [>Settings].ProductsType
HAVING ((([>Settings].ProductsType)<>""))
ORDER BY [>Settings].ProductsType
WITH OWNERACCESS OPTION;