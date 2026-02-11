SELECT DISTINCTROW [>Jobs].ID, First([Sales Journal].Due) AS FirstOfDue, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount, First([MIS Personnel].Employee) AS FirstOfEmployee, First([>Resources].ID) AS FirstOfID
FROM ([Sales Journal] LEFT JOIN ([>Jobs] LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key) ON [Sales Journal].Job=[>Jobs].Key) LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key
GROUP BY [>Jobs].ID, [>Jobs].Estimate, [>Jobs].Closed
HAVING (((First([Sales Journal].Due))>=Forms!Sales.From And (First([Sales Journal].Due))<=Forms!Sales.To) And (([>Jobs].Estimate)=True) And (([>Jobs].Closed)=False)) Or (((First([Sales Journal].Due)) Is Null) And (([>Jobs].Estimate)=True) And (([>Jobs].Closed)=False))
ORDER BY First([Sales Journal].Due);