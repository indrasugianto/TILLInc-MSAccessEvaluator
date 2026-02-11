SELECT [>Resources].ID, [>Resources].Key, [>Resources].Category
FROM [>Resources]
WHERE (((InStr([Category],"Employee"))<>"0"))
ORDER BY [>Resources].ID;