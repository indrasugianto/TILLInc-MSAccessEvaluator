SELECT DISTINCTROW [>Resources].ID, [>Resources].Key, [>Resources].Category
FROM [>Resources]
WHERE ((([>Resources].Category)=Forms!APChecksEntry.PayeeCategory))
ORDER BY [>Resources].Category, [>Resources].ID
WITH OWNERACCESS OPTION;