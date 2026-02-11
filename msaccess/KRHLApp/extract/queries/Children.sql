SELECT [>Jobs].Parent AS theParent, Sum(SalesSummarybyJob.Amount) AS SumOfAmount
FROM [>Jobs] LEFT JOIN SalesSummarybyJob ON [>Jobs].Key=SalesSummarybyJob.Key
GROUP BY [>Jobs].Parent
HAVING ((([>Jobs].Parent)<>0))
ORDER BY [>Jobs].Parent;