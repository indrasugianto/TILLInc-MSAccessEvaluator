SELECT [>Jobs].ID, Count(ProjectSchedule.TaskSummary) AS CountOfTaskSummary
FROM ProjectSchedule LEFT JOIN [>Jobs] ON ProjectSchedule.Job=[>Jobs].Key
GROUP BY [>Jobs].ID, [>Jobs].Estimate, [>Jobs].Closed, ProjectSchedule.TaskSummary
HAVING ((([>Jobs].Estimate)=False) AND (([>Jobs].Closed)=False) AND ((ProjectSchedule.TaskSummary)=True))
ORDER BY [>Jobs].ID;