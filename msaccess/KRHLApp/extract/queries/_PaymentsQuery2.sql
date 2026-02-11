SELECT DISTINCTROW [>Jobs].Closed, [>Jobs].Estimate, [>Jobs].ID, Sum([Receipts Journal].Amount) AS SumOfAmount, Sum([Receipts Journal].Amount) AS Payments, Max([Receipts Journal].CheckDate) AS MaxOfCheckDate, Max([Receipts Journal].EntryDate) AS MaxOfEntryDate
FROM [>Jobs] LEFT JOIN [Receipts Journal] ON [>Jobs].Key=[Receipts Journal].Job
GROUP BY [>Jobs].Closed, [>Jobs].Estimate, [>Jobs].ID
HAVING ((([>Jobs].Closed)=False) AND (([>Jobs].Estimate)=False));