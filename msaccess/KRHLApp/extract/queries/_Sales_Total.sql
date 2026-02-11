SELECT [Sales Journal].Job, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount
FROM [Sales Journal] RIGHT JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key
WHERE ((([>Jobs].Estimate)=False) AND (([Sales Journal].TheDate) Is Not Null))
GROUP BY [Sales Journal].Job;