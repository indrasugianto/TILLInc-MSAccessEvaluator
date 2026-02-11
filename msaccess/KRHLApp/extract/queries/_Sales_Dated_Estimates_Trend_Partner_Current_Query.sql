SELECT DISTINCTROW [>Jobs].Info2, [Sales Journal].SaleAmount, [MIS Personnel].Text2, [MIS Personnel].Employee
FROM ([>Estimates Open Query] LEFT JOIN ([Sales Journal] LEFT JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key) ON [>Estimates Open Query].Key=[Sales Journal].Job) LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key
WHERE ((([MIS Personnel].Text2)="Partner") And (([MIS Personnel].Employee)=Forms!Sales!Partner))
ORDER BY [Sales Journal].SaleAmount DESC;