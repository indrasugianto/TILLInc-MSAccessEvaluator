SELECT [>Jobs].Key, [Sales Journal].Due, [Sales Journal].Description, [>Jobs].Estimate
FROM [Sales Journal] LEFT JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key
WHERE ((([Sales Journal].Due)>=#1/1/2000#) AND (([Sales Journal].Description)="Proposal") AND (([>Jobs].Estimate)=True));