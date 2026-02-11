SELECT [>Jobs].ID, Sum([Receipts Journal].Amount) AS SumOfAmount, [Receipts Journal].Job
FROM [>Jobs] LEFT JOIN [Receipts Journal] ON [>Jobs].Key=[Receipts Journal].Job
GROUP BY [>Jobs].ID, [Receipts Journal].Job
HAVING (((Sum([Receipts Journal].Amount))<>0))
ORDER BY [>Jobs].ID;