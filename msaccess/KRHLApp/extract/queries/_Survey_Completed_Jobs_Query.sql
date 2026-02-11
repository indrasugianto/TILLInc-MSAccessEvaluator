SELECT [>Jobs].ID, [>Jobs].Completed, [MIS Personnel].Employee, [>Resources].TheName, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount
FROM (([>Jobs] LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key) LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key) LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job
GROUP BY [>Jobs].ID, [>Jobs].Completed, [MIS Personnel].Employee, [>Resources].TheName
HAVING ((([>Jobs].Completed) Is Not Null))
ORDER BY [>Jobs].ID;