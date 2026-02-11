SELECT [Sales Journal].Job, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount
FROM [Sales Journal]
WHERE (((InStr([Category],"Cabinet") Or InStr([Category],"Countertop"))<>0))
GROUP BY [Sales Journal].Job;