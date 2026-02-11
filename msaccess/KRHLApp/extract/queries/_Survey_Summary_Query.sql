SELECT First(Survey.Job) AS FirstOfJob, [>Jobs].ID, [>Jobs].Completed, [MIS Personnel].Employee, [>Resources].TheName
FROM ((Survey LEFT JOIN [>Jobs] ON Survey.Job=[>Jobs].Key) LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key) LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key
GROUP BY [>Jobs].ID, [>Jobs].Completed, [MIS Personnel].Employee, [>Resources].TheName, Year([>Jobs].Completed)
HAVING (((Year([>Jobs].Completed))=NNEZ(Localvariable("Form_BonusPlan_GoalYear"))))
ORDER BY [>Jobs].ID;