SELECT DISTINCTROW [>Jobs].Closed, [>Jobs].Estimate, [>Jobs].Owner, [>Jobs].ID, Sum([Sales Journal].InvoiceAmount) AS SumOfInvoiceAmount, Sum([Sales Journal].InvoiceAmount) AS Invoices, Max([Sales Journal].Due) AS MaxOfDue, Max([Sales Journal].Due) AS LastInvDate
FROM [>Jobs] LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job
WHERE ((([Sales Journal].Due) Is Not Null))
GROUP BY [>Jobs].Closed, [>Jobs].Estimate, [>Jobs].Owner, [>Jobs].ID
HAVING ((([>Jobs].Closed)=False) AND (([>Jobs].Estimate)=False) AND (([>Jobs].Owner)=False) AND ((Sum([Sales Journal].InvoiceAmount))>0))
ORDER BY [>Jobs].ID;