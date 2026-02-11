SELECT DISTINCTROW [>Resources].ID, [>Resources].Category, [>Resources].Key
FROM [>Resources]
WHERE ((([>Resources].Category)=Forms!Receipts.PayorCategory))
ORDER BY [>Resources].ID
WITH OWNERACCESS OPTION;