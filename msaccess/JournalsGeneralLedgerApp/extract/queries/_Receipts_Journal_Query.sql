SELECT DISTINCTROW [Receipts Journal].*, [>Jobs].ID, [>Resources].ID
FROM ([Receipts Journal] LEFT JOIN [>Jobs] ON [Receipts Journal].Job=[>Jobs].Key) LEFT JOIN [>Resources] ON [Receipts Journal].Payor=[>Resources].Key
WHERE ((([Receipts Journal].Payor)=Forms!Receipts.Payor))
ORDER BY [Receipts Journal].CheckDate DESC , [Receipts Journal].EntryDate DESC , [Receipts Journal].CheckNumber DESC;