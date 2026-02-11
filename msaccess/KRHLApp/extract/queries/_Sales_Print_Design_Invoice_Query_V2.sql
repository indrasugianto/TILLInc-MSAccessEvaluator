SELECT DISTINCTROW TOP 1 [Sales Journal].InvoiceNumber
FROM [Sales Journal]
GROUP BY [Sales Journal].Due, [Sales Journal].InvoiceNumber, [Sales Journal].Job, [Sales Journal].Journal, [Sales Journal].InvoiceAmount
HAVING ((([Sales Journal].Job)=forms!Sales!TheJobName) And (([Sales Journal].Journal)="Invoice") And (([Sales Journal].InvoiceAmount)<>0))
ORDER BY [Sales Journal].Due DESC
WITH OWNERACCESS OPTION;