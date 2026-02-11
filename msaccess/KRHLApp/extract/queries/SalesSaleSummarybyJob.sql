SELECT [Sales Journal].Job, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount, Max([Sales Journal].TheDate) AS MaxOfTheDate
FROM [Sales Journal]
GROUP BY [Sales Journal].Job
HAVING (((Sum([Sales Journal].SaleAmount))<>0));