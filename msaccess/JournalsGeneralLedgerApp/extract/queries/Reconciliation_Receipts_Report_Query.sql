SELECT DISTINCTROW [Receipts Journal].*, [>Resources].ID
FROM [Receipts Journal] INNER JOIN [>Resources] ON [Receipts Journal].Payor=[>Resources].Key
WHERE ((([Receipts Journal].Void)=False) AND (([Receipts Journal].Amount)<>0));