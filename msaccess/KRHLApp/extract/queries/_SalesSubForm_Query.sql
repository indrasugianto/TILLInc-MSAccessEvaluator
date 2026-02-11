SELECT DISTINCTROW [Sales Journal].*
FROM [>Jobs] LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job
WHERE ((([Sales Journal].Journal)="Sale") And ((IIf(Not forms!Sales!Family And [Job]=forms!Sales!Jobname,True,IIf(forms!Sales!Family And [Parent]=Forms!Sales!JobName Or forms!Sales!Family And [Job]=Forms!Sales!JobName,True,False)))=True))
ORDER BY [>Jobs].ID, [Sales Journal].InvoiceNumber;