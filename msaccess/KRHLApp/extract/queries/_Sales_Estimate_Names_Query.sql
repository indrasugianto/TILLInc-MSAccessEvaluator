SELECT DISTINCTROW [>Jobs].ID AS Job, [>Jobs].Key, Max([Sales Journal].Due) AS Proposal, Max([Sales Journal].Proposal) AS Amount, [MIS Personnel].Text1 & "/" & [MIS Personnel_1].text1 AS Team, [>Jobs].Info2 AS Status, [>Jobs].Parent, [>Jobs].Family
FROM ((([>Jobs] LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key) LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job) LEFT JOIN [MIS Personnel] AS [MIS Personnel_1] ON [>Jobs].SpecifiedBy=[MIS Personnel_1].Key) LEFT JOIN [>Resources] ON [>Jobs].Contact1=[>Resources].Key
WHERE ((([>Jobs].Closed)=IIf(InStr(Forms!Sales.ViewClosed,"Closed")<>0,True,False)) And ((IIf(Forms!Sales.SelectPartnerManager,IIf([Managedby]=Forms!Sales.PartnerManagerSelection Or [Specifiedby]=Forms!Sales.PartnerManagerSelection,True,False),True))=True))
GROUP BY [>Jobs].ID, [>Jobs].Key, [MIS Personnel].Text1 & "/" & [MIS Personnel_1].text1, [>Jobs].Info2, [>Jobs].Parent, [>Jobs].Family, [>Resources].ID, [>Jobs].Estimate, [>Jobs].Closed, [>Jobs].Estimate, [>Jobs].ID
HAVING ((([>Jobs].Estimate)=True))
ORDER BY [>Jobs].ID
WITH OWNERACCESS OPTION;