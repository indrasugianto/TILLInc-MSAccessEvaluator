SELECT DISTINCTROW [>Resources].ID, [>Resources].Category, [>Resources].SageID, [>Resources].Key, [>Resources].CompanyName, [>Resources].Conversation, [>Resources].ConversationUser, [>Resources].ConversationDate, [>Resources].Key, [>Resources].Web, [>Resources].Field1, [>Resources].Field2, [>Resources].Field3, [>Resources].Field4, [>Resources].TheName, [>Resources].Address, [>Resources].State, [>Resources].Zip, [>Resources].AreaCode, [>Resources].Comment, [>Resources].Customer AS Expr1
FROM [>Resources]
WHERE ((([>Resources].Key)=forms!Resources!ResourceList))
ORDER BY [>Resources].Category, [>Resources].ID
WITH OWNERACCESS OPTION;