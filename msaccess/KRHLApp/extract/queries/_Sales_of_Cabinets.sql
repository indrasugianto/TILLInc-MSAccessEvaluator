SELECT [Sales Journal].SaleAmount, First([>Jobs].ID) AS FirstOfID
FROM [>Jobs] LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job
WHERE ((([>Jobs].Closed)=False) AND (([>Jobs].Estimate)=False))
GROUP BY [Sales Journal].SaleAmount
ORDER BY First([>Jobs].ID);