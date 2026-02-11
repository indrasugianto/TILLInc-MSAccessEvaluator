SELECT DISTINCTROW [Sales Journal].*
FROM [Sales Journal]
WHERE ((([Sales Journal].Job)=Forms!Sales.JobName))
ORDER BY [Sales Journal].Journal DESC , [Sales Journal].InvoiceNumber;