SELECT DISTINCT [>Jobs].ID, [Sales Journal].Job, Sum([Sales Journal].InvoiceAmount) AS SumOfInvoiceAmount, [>Jobs].Estimate, [>Jobs].Family
FROM [Sales Journal] RIGHT JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key
GROUP BY [>Jobs].ID, [Sales Journal].Job, [>Jobs].Estimate, [>Jobs].Family
HAVING (((Sum([Sales Journal].InvoiceAmount))=0) AND (([>Jobs].Estimate)=False) AND (([>Jobs].Family)=False))
ORDER BY [>Jobs].ID;