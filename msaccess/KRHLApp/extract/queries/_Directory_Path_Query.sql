SELECT DISTINCTROW [>Local Settings].DirectoryPath, [>Local Settings].Key
FROM [>Local Settings]
WHERE ((([>Local Settings].DirectoryPath) Is Not Null And ([>Local Settings].DirectoryPath)<>""))
ORDER BY [>Local Settings].DirectoryPath;