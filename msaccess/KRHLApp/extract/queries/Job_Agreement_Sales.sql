SELECT [>Jobs].ID, [>Jobs].Key, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount
FROM [>Jobs] LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job
WHERE ((([>Jobs].Estimate)=False))
GROUP BY [>Jobs].ID, [>Jobs].Key
HAVING (((Sum([Sales Journal].SaleAmount))<>0))
ORDER BY [>Jobs].ID;