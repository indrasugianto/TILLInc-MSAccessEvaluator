SELECT [Sales Journal].Job, Max([Sales Journal].Due) AS MaxOfDue
FROM [Sales Journal]
GROUP BY [Sales Journal].Job
ORDER BY [Sales Journal].Job;