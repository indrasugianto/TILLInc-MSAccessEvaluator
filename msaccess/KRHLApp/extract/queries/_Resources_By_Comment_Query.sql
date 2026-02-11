SELECT DISTINCTROW [>Resources].ID AS Resource, [>Resources].Comment AS [Marketing Category], [>Resources].Key
FROM [>Resources]
WHERE ((([>Resources].Comment)=Forms!Resources.CommentSort))
ORDER BY [>Resources].ID, [>Resources].Comment
WITH OWNERACCESS OPTION;