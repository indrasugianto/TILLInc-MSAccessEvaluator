SELECT DISTINCTROW [>Jobs].ID AS Job, [>Jobs].Completed, [>Jobs].Key, IIf(nnez([>Survey Query].Job)=0,"No","Yes") AS Surveyed, Count([>Survey Query].Question) AS Questions, [>Resources].ID, [MIS Personnel].Employee
FROM (([>Jobs] LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key) LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key) LEFT JOIN [>Survey Query] ON [>Jobs].Key=[>Survey Query].Job
GROUP BY [>Jobs].ID, [>Jobs].Completed, [>Jobs].Key, IIf(nnez([>Survey Query].Job)=0,"No","Yes"), [>Resources].ID, [MIS Personnel].Employee, [>Jobs].Estimate, [>Jobs].Closed
HAVING ((([>Jobs].Completed)>#1/1/2004#) AND (([>Jobs].Estimate)=False) AND (([>Jobs].Closed)=False))
ORDER BY [>Jobs].Completed DESC
WITH OWNERACCESS OPTION;