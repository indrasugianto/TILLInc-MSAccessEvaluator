SELECT Last([Sales Journal].Due) AS LastOfDue, Last([privateNote]) AS Expr2, [>Jobs].ID, [Sales Journal].Job, [Sales Journal].Description, [Sales Journal].Proposal
FROM [Sales Journal] LEFT JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key
GROUP BY [>Jobs].ID, [Sales Journal].Job, [Sales Journal].Description, [Sales Journal].Proposal, InStr([Sales Journal].Description,"Proposal")<>0
HAVING (((Last([privateNote])) Is Not Null) And ((InStr([Sales Journal].Description,"Proposal")<>0)=True))
ORDER BY Last([Sales Journal].Due) DESC , [>Jobs].ID;