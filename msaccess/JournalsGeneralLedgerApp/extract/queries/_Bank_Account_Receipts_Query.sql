SELECT DISTINCTROW [Receipts Journal].*, [>Resources].ID
FROM [Receipts Journal] LEFT JOIN [>Resources] ON [Receipts Journal].Payor=[>Resources].Key
ORDER BY [Receipts Journal].Closed DESC , [Receipts Journal].CheckDate DESC , [Receipts Journal].EntryDate DESC , [Receipts Journal].CheckNumber DESC , [>Resources].ID;