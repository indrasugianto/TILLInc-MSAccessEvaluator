SELECT DISTINCTROW [Sales Journal].InvoiceNumber, [Sales Journal].Description AS [Select an Invoice], [Sales Journal].Due AS Dated, [Sales Journal].Key, [Sales Journal].Job
FROM [>Jobs] LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job
WHERE ((([Sales Journal].Journal)="Invoice") And ((IIf(Not forms!Sales!Family And [Job]=forms!Sales!Jobname,True,IIf(forms!Sales!Family And [Parent]=Forms!Sales!JobName Or forms!Sales!Family And [Job]=Forms!Sales!JobName,True,False)))=True) And (([Sales Journal].InvoiceAmount)<>0))
ORDER BY [Sales Journal].InvoiceNumber
WITH OWNERACCESS OPTION;