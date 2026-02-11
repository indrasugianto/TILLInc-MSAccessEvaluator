SELECT DISTINCTROW [>Jobs].ID, Max([Sales Journal].Due) AS MaxOfDue, Sum([Sales Journal].InvoiceAmount) AS SumOfInvoiceAmount, [>Resources].ID, [>Jobs].Key
FROM ([Sales Journal] RIGHT JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key) LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key
WHERE ((([Sales Journal].Due) Is Not Null))
GROUP BY [>Jobs].ID, [>Resources].ID, [>Jobs].Key, [>Jobs].Closed, [>Jobs].Estimate
HAVING ((([>Jobs].Closed)=False) AND (([>Jobs].Estimate)=False))
ORDER BY [>Jobs].ID;