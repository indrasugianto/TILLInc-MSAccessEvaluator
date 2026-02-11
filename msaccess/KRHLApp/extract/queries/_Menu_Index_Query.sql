SELECT DISTINCTROW [>Settings].MenuCategory, [>Settings].MenuText
FROM [>Settings]
GROUP BY [>Settings].MenuCategory, [>Settings].MenuText
HAVING ((([>Settings].MenuCategory) Is Not Null))
ORDER BY [>Settings].MenuCategory, [>Settings].MenuText
WITH OWNERACCESS OPTION;