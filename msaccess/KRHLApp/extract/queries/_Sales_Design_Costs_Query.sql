SELECT [>Jobs].ID, Max([Sales Journal].TheDate) AS MaxOfTheDate2, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount, [MIS Personnel_1].Employee, Sum([>Job Hours Design Cost Query].SumOfCost) AS SumOfSumOfCost
FROM ((([>Sales Completed Jobs Query] LEFT JOIN [Sales Journal] ON [>Sales Completed Jobs Query].Key=[Sales Journal].Job) LEFT JOIN [>Jobs] ON [>Sales Completed Jobs Query].Key=[>Jobs].Key) LEFT JOIN [MIS Personnel] AS [MIS Personnel_1] ON [>Jobs].ManagedBy=[MIS Personnel_1].Key) LEFT JOIN [>Job Hours Design Cost Query] ON [>Jobs].Key=[>Job Hours Design Cost Query].Key
GROUP BY [>Jobs].ID, [MIS Personnel_1].Employee, [MIS Personnel_1].Text2
HAVING ((([MIS Personnel_1].Text2)="Partner"))
ORDER BY Max([Sales Journal].TheDate);