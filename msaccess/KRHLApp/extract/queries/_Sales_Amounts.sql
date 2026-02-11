SELECT [Sales Journal].Job, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount
FROM [Sales Journal] RIGHT JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key
WHERE ((([>Jobs].Estimate)=False))
GROUP BY [Sales Journal].Job
HAVING (((Sum([Sales Journal].SaleAmount))<>0));