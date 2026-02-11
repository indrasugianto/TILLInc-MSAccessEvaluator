SELECT DISTINCTROW [>Jobs].ProductionPhase, [>Jobs].ID, Max([Sales Journal].TheDate) AS MaxOfTheDate, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount
FROM [Sales Journal] INNER JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key
WHERE ((([>Jobs].Estimate)=False) AND (([>Jobs].Closed)=False))
GROUP BY [>Jobs].ProductionPhase, [>Jobs].ID
HAVING ((([>Jobs].ProductionPhase)="Installation"))
ORDER BY [>Jobs].ProductionPhase, [>Jobs].ID, Max([Sales Journal].TheDate);