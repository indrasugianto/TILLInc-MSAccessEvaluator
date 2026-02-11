SELECT DISTINCTROW [>Jobs].ID AS Job, [>Jobs].Key, [>Resources].ID AS Customer, [>Jobs].ProductionPhase AS Phase, [MIS Personnel].Text1 & "/" & [MIS Personnel_1].text1 AS Team, Sum([SaleAmount]\1) AS [Total Sale], Max([Sales Journal].Due) AS [Last Invoice], [>Jobs].Closed
FROM ((([>Jobs] LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key) LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key) LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job) LEFT JOIN [MIS Personnel] AS [MIS Personnel_1] ON [>Jobs].SpecifiedBy=[MIS Personnel_1].Key
GROUP BY [>Jobs].ID, [>Jobs].Key, [>Resources].ID, [>Jobs].ProductionPhase, [MIS Personnel].Text1 & "/" & [MIS Personnel_1].text1, [>Jobs].Closed, [>Jobs].Estimate, [>Jobs].ManagedBy, [>Jobs].SpecifiedBy
HAVING ((([>Jobs].Estimate)=False))
ORDER BY [>Jobs].ID
WITH OWNERACCESS OPTION;