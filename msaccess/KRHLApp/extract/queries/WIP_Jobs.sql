SELECT [>Jobs].ProductionPhase, [>Jobs].ID, [>Sales Amounts].SumOfSaleAmount
FROM [>Jobs] LEFT JOIN [>Sales Amounts] ON [>Jobs].Key=[>Sales Amounts].Job
WHERE ((([>Jobs].ProductionPhase)="Installation" Or ([>Jobs].ProductionPhase)="Design" Or ([>Jobs].ProductionPhase)="Shop" Or ([>Jobs].ProductionPhase)="Stored") AND (([>Sales Amounts].SumOfSaleAmount)<>0) AND (([>Jobs].Estimate)=False) AND (([>Jobs].Closed)=False))
ORDER BY [>Jobs].ProductionPhase, [>Jobs].ID;