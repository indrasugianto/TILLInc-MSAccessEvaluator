SELECT DISTINCT [>Jobs].ID, [Sales Journal].Job, Last([Sales Journal].Proposal) AS LastOfProposal
FROM [Sales Journal] RIGHT JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key
GROUP BY [>Jobs].ID, [Sales Journal].Job
HAVING (((Last([Sales Journal].Proposal))<>0))
ORDER BY [>Jobs].ID;