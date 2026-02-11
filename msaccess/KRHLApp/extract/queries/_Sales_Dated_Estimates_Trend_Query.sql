SELECT DISTINCTROW [>Jobs].Info2, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount, [MIS Personnel].Text2
FROM ([>Estimates Closed Query] LEFT JOIN ([Sales Journal] LEFT JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key) ON [>Estimates Closed Query].Key=[Sales Journal].Job) LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key
GROUP BY [>Jobs].Info2, [MIS Personnel].Text2
HAVING ((([MIS Personnel].Text2)="Partner"))
ORDER BY Sum([Sales Journal].SaleAmount) DESC;