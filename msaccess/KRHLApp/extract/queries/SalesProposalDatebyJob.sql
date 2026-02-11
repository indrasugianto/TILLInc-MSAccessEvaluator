SELECT DISTINCT [Sales Journal].Proposal, [Sales Journal].Job, [Sales Journal].Due
FROM [Sales Journal]
WHERE ((([Sales Journal].Proposal)<>0))
ORDER BY [Sales Journal].Job;