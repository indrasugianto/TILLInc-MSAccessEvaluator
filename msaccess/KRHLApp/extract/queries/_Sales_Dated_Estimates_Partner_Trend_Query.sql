SELECT DISTINCTROW [>Jobs].Info2, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount, [MIS Personnel].Employee
FROM [>Estimates Closed Query] LEFT JOIN (([Sales Journal] LEFT JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key) LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key) ON [>Estimates Closed Query].Key=[Sales Journal].Job
GROUP BY [>Jobs].Info2, [MIS Personnel].Employee
HAVING ((([MIS Personnel].Employee)=Forms!Sales!Partner))
ORDER BY Sum([Sales Journal].SaleAmount) DESC;