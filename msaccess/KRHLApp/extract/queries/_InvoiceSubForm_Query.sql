SELECT DISTINCTROW [Sales Journal].*, IIf(InStr([Description],"Proposal")<>0,[InvoiceAmount],0) AS ProposalAmount, [>Jobs].Key
FROM [>Jobs] LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job
WHERE (((IIf(Not forms!Sales!Family And [Job]=forms!Sales!Jobname,True,IIf(forms!Sales!Family And [Parent]=Forms!Sales!JobName Or forms!Sales!Family And [Job]=Forms!Sales!JobName,True,False)))=True) And (([Sales Journal].Journal)="Invoice"))
ORDER BY [>Jobs].ID, [Sales Journal].InvoiceNumber;