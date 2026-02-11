SELECT DISTINCTROW [>Resources].ID, [>Jobs].ID, [Sales Journal].SaleAmount, [Sales Journal].TheDate
FROM [>Resources] INNER JOIN ([>Jobs] LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job) ON [>Resources].Key=[>Jobs].Agreement
WHERE ((([>Resources].ID)<>"") AND (([Sales Journal].SaleAmount)<>0) AND (([Sales Journal].TheDate)>#1/1/1999#) AND (([>Jobs].Estimate)=False))
ORDER BY [>Resources].ID, [>Jobs].ID;