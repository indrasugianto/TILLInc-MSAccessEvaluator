SELECT DISTINCTROW [MIS Personnel].Employee, [MIS Personnel].Key, [MIS Personnel].Closed
FROM [MIS Personnel]
WHERE ((([MIS Personnel].Closed)=False) AND (([MIS Personnel].Text2)="Partner" Or ([MIS Personnel].Text2)="Project Manager") AND (([MIS Personnel].TerminationDate) Is Null))
ORDER BY [MIS Personnel].Employee
WITH OWNERACCESS OPTION;