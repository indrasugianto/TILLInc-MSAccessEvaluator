SELECT DISTINCTROW [>Resources].ID, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount, Max([Sales Journal].TheDate) AS MaxOfTheDate
FROM [>Resources] LEFT JOIN ([>Jobs] LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job) ON [>Resources].Key=[>Jobs].Agreement
WHERE ((([>Jobs].Estimate)=False) AND (([>Jobs].ProductionPhase)="completed" Or ([>Jobs].ProductionPhase)="Archive") AND (([Sales Journal].TheDate) Is Not Null))
GROUP BY [>Resources].ID
HAVING ((([>Resources].ID)<>"") AND ((Sum([Sales Journal].SaleAmount))<>0));