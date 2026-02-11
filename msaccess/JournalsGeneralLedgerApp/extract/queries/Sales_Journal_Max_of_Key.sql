SELECT [Sales Journal].Job, Max([Sales Journal].Key) AS MaxOfKey, Count([Sales Journal Max of Due].MaxOfDue) AS CountOfMaxOfDue
FROM [Sales Journal Max of Due] LEFT JOIN [Sales Journal] ON ([Sales Journal Max of Due].MaxOfDue=[Sales Journal].Due) AND ([Sales Journal Max of Due].Job=[Sales Journal].Job)
GROUP BY [Sales Journal].Job;