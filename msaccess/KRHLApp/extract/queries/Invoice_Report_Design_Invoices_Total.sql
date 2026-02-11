SELECT Sum([Sales Journal].InvoiceAmount) AS SumOfInvoiceAmount, [Sales Journal].Job
FROM [Sales Journal]
WHERE ((([Sales Journal].Due) Is Not Null))
GROUP BY [Sales Journal].Job
HAVING (((Sum([Sales Journal].InvoiceAmount))<>0) And (([Sales Journal].Job)=Forms!Sales!TheJobName));