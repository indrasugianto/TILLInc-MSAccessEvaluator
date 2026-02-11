SELECT DISTINCTROW [MIS Personnel].Employee, [MIS Personnel].Key, [MIS Personnel].Rate, [MIS Personnel].ADPFile, [MIS Personnel].ADPName, [MIS Personnel].ADPNetAccount, [MIS Personnel].WitholdingAccount, [MIS Personnel].MedicalAccount, [MIS Personnel].EmployerAccount, [MIS Personnel].MiscAccount, [MIS Personnel].RetirementAccount, [MIS Personnel].Closed
FROM [MIS Personnel]
WHERE ((([MIS Personnel].ADPFile)>2) AND (([MIS Personnel].Closed)=False) AND (([MIS Personnel].Text2)="engineer" Or ([MIS Personnel].Text2)="Project Manager" Or ([MIS Personnel].Text2)="Partner")) OR ((([MIS Personnel].ADPFile)=Val(2948)) AND (([MIS Personnel].Closed)=False))
ORDER BY [MIS Personnel].Employee, [MIS Personnel].Text2 DESC , [MIS Personnel].Employee
WITH OWNERACCESS OPTION;