SELECT DISTINCTROW [>Jobs].ID, [MIS Personnel].Employee, [>Jobs].ManagedBy, [>Jobs].SpecifiedBy, [Receipts Journal].CheckDate, [Receipts Journal].Amount, [>Resources].ID
FROM (([>Jobs] LEFT JOIN [Receipts Journal] ON [>Jobs].Key=[Receipts Journal].Job) LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key) LEFT JOIN [>Resources] ON [Receipts Journal].Payor=[>Resources].Key
WHERE ((([Receipts Journal].CheckDate)>Date()-90) AND (([Receipts Journal].Amount)<>0))
ORDER BY [Receipts Journal].CheckDate DESC;