SELECT DISTINCTROW [Sales Journal].Key, [Sales Journal].InvoiceNumber, [Sales Journal].Category
FROM [Sales Journal]
WHERE ((([Sales Journal].Job)=Forms!Sales!JobName) And (([Sales Journal].Journal)="Sale"))
ORDER BY [Sales Journal].InvoiceNumber;