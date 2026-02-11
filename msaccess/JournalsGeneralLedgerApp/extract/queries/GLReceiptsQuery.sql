SELECT DISTINCTROW [>Jobs].Closed, [>Jobs].ID, Sum([Receipts Journal].Amount) AS SumOfAmount
FROM [>Jobs] INNER JOIN [Receipts Journal] ON [>Jobs].Key=[Receipts Journal].Job
GROUP BY [>Jobs].Closed, [>Jobs].ID
HAVING ((([>Jobs].Closed)=False))
ORDER BY [>Jobs].ID;