SELECT [>Jobs].ID, [>Jobs].Key, Last([Sales Journal].TheDate) AS LastOfTheDate, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount
FROM [>Jobs] LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job
WHERE (((InStr([Sales Journal].Category,"Stone")<>0)=True) And (([>Jobs].Estimate)=False))
GROUP BY [>Jobs].ID, [>Jobs].Key
HAVING (((Last([Sales Journal].TheDate))>#12/31/1999#))
ORDER BY [>Jobs].ID;