SELECT DISTINCTROW [>Jobs].Key, [>Jobs].Info2, [Sales Journal].SaleAmount, [>Estimates Closed Query].Due
FROM [>Estimates Closed Query] LEFT JOIN ([Sales Journal] LEFT JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key) ON [>Estimates Closed Query].Key=[Sales Journal].Job
WHERE ((([>Jobs].Info2)="price too high") AND (([Sales Journal].SaleAmount)<>0));