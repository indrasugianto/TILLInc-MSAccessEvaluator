SELECT DISTINCTROW [>Resources].ID, [>Resources].Key
FROM [>Resources]
WHERE ((([>Resources].Category)=Forms!PurchaseJournalEntryCOD.PayeeCategory))
ORDER BY [>Resources].ID
WITH OWNERACCESS OPTION;