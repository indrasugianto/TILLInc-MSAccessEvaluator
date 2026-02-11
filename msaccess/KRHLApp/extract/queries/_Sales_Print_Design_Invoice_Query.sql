SELECT DISTINCTROW TOP 1 [Sales Journal].InvoiceNumber, [Sales Journal].Description AS [Select an Invoice], [Sales Journal].Due AS Dated, [Sales Journal].Key, [Sales Journal].Job
FROM [Sales Journal]
WHERE ((([Sales Journal].Job)=forms!Sales!TheJobName) And (([Sales Journal].Journal)="Invoice") And (([Sales Journal].InvoiceAmount)<>0))
ORDER BY [Sales Journal].Due DESC
WITH OWNERACCESS OPTION;