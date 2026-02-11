SELECT DISTINCTROW [>Resources].ID, [>Resources].Key, [>Jobs].ID, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount, Max([Sales Journal].TheDate) AS MaxOfTheDate, First([MIS Personnel].Employee) AS FirstOfEmployee
FROM ([>Resources] INNER JOIN ([>Jobs] LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job) ON [>Resources].Key=[>Jobs].Customer) LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key
WHERE ((([>Jobs].Estimate)=False))
GROUP BY [>Resources].ID, [>Resources].Key, [>Jobs].ID
HAVING ((([>Resources].ID)<>"") AND ((Sum([Sales Journal].SaleAmount))<>0))
ORDER BY [>Resources].ID, [>Jobs].ID;