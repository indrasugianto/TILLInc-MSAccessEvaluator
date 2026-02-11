SELECT Estimates.Sequence, Estimates.Component
FROM Estimates
GROUP BY Estimates.Job, Estimates.Sequence, Estimates.Component, Estimates.Description, Estimates.ImportPL, Estimates.ImportParts
HAVING (((Estimates.Job)=forms!ProductListMaster!ProductListControl!JobName) And ((Estimates.Description) Is Null) And ((Estimates.ImportPL)=True) And ((Estimates.ImportParts)=True))
ORDER BY Estimates.Sequence, Estimates.Component, Estimates.Description;