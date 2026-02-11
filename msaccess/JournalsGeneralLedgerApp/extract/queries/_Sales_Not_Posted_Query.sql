SELECT DISTINCTROW [Sales Journal].*, [>Jobs].ID, [MIS Personnel].Employee, [>Resources].ID AS Resource, [>Jobs].ManagedBy, [>Jobs].SpecifiedBy
FROM (([Sales Journal] LEFT JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key) LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key) LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key
WHERE ((([Sales Journal].Due) Is Not Null) AND (([Sales Journal].Posted)=False) AND (([Sales Journal].InvoiceAmount)<>0) AND ((IIf(InStr([Description],"Proposal")=0,True,False))=True))
ORDER BY [>Jobs].ID, [Sales Journal].Due;