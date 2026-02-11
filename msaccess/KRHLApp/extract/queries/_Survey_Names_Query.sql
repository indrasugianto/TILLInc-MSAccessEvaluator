SELECT DISTINCTROW [>Jobs].ID AS Job, [>Jobs].Completed, [>Jobs].Key, Count(Survey.Question) AS Questions, [>Resources].ID, [MIS Personnel].Employee
FROM (([>Jobs] LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key) LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key) LEFT JOIN Survey ON [>Jobs].Key=Survey.Job
GROUP BY [>Jobs].ID, [>Jobs].Completed, [>Jobs].Key, [>Resources].ID, [MIS Personnel].Employee
HAVING (((First(Survey.Key))<>0) AND ((Sum(Survey.Score))<>0))
ORDER BY [>Jobs].Completed DESC
WITH OWNERACCESS OPTION;