SELECT Estimates.Job, Sum(Estimates.[11]) AS SumOf11, Sum(Estimates.[11Cost]) AS SumOf11Cost, Sum(Estimates.[12]) AS SumOf12, Sum(Estimates.[12Cost]) AS SumOf12Cost
FROM Estimates
GROUP BY Estimates.Job
HAVING (((Estimates.Job)=[forms]![ProductListMaster].[ProductListControl]![JobName]));