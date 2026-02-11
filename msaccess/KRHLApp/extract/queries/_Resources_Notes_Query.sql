SELECT DISTINCTROW [>Resources].ID, [>Resources].Category, [>Resources].Conversation, [>Resources].ConversationUser, [>Resources].ConversationDate, [>Resources].Key, [>Resources].Field1, [>Resources].Field2, [>Resources].Field3, [>Resources].Field4, [>Resources].TheName, [>Resources].CompanyName, [>Resources].Address, [>Resources].State, [>Resources].Zip, [>Resources].AreaCode, [>Resources].Comment, [>Resources].Customer AS Expr1
FROM [>Resources]
WHERE ((Not ([>Resources].Conversation) Is Null))
ORDER BY [>Resources].Category, [>Resources].ID
WITH OWNERACCESS OPTION;