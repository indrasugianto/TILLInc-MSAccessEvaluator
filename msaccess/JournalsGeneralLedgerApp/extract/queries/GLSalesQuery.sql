SELECT DISTINCTROW [>Jobs].Closed, [>Jobs].ID, Last([Sales Journal].Due) AS LastOfDue, Sum([Sales Journal].InvoiceAmount) AS SumOfInvoiceAmount, [>Resources].ID
FROM ([Sales Journal] RIGHT JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key) LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key
WHERE ((([Sales Journal].Due) Is Not Null))
GROUP BY [>Jobs].Closed, [>Jobs].ID, [>Resources].ID
HAVING ((([>Jobs].Closed)=False))
ORDER BY [>Jobs].ID;