SELECT [>Jobs].ID, [Sales Journal].Note, [Sales Journal].Job
FROM [>Jobs] LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job
GROUP BY [>Jobs].ID, [Sales Journal].Note, [Sales Journal].Job, [>Jobs].Key
HAVING ((([>Jobs].Key)=forms!Sales!Jobname));