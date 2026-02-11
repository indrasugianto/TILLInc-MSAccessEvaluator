SELECT [>Jobs].Closed, [>Jobs].ID, [>Jobs].Key, [>Jobs].Estimate, Max([Sales Journal].TheDate) AS MaxOfTheDate, [Sales Journal].Journal, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount
FROM [>Jobs] LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job
WHERE ((([Sales Journal].TheDate) Is Null) AND (([Sales Journal].SaleAmount)<>0))
GROUP BY [>Jobs].Closed, [>Jobs].ID, [>Jobs].Key, [>Jobs].Estimate, [Sales Journal].Journal
HAVING ((([>Jobs].Estimate)=False) AND (([Sales Journal].Journal)="Sale"))
ORDER BY [>Jobs].Closed, [>Jobs].ID;