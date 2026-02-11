SELECT [MIS Personnel_1].Employee, [Sales Journal].TheDate, [>Jobs].ID, [MIS Personnel].Employee, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount, [MIS Personnel_1].Text2, [MIS Personnel_1].Key
FROM (([Sales Journal] LEFT JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key) LEFT JOIN [MIS Personnel] AS [MIS Personnel_1] ON [>Jobs].SpecifiedBy=[MIS Personnel_1].Key) LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key
GROUP BY [MIS Personnel_1].Employee, [Sales Journal].TheDate, [>Jobs].ID, [MIS Personnel].Employee, [MIS Personnel_1].Text2, [MIS Personnel_1].Key
HAVING ((([Sales Journal].TheDate) Is Not Null And ([Sales Journal].TheDate)>=#1/1/1996#) AND ((Sum([Sales Journal].SaleAmount))<>0))
ORDER BY [MIS Personnel_1].Employee, [Sales Journal].TheDate, [>Jobs].ID;