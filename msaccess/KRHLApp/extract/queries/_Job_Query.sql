SELECT DISTINCTROW [>Jobs].*
FROM [>Jobs]
WHERE ((([>Jobs].Key)=NNEZ(LocalVariable("FormJobs_JobName"))))
WITH OWNERACCESS OPTION;