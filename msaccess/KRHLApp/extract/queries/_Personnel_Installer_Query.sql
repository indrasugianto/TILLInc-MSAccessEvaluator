SELECT DISTINCTROW [MIS Personnel].Employee, [MIS Personnel].Key, [MIS Personnel].Rate, [MIS Personnel].ADPFile, [MIS Personnel].ADPName, [MIS Personnel].ADPNetAccount, [MIS Personnel].WitholdingAccount, [MIS Personnel].MedicalAccount, [MIS Personnel].EmployerAccount, [MIS Personnel].MiscAccount, [MIS Personnel].RetirementAccount, [MIS Personnel].Closed
FROM [MIS Personnel]
WHERE ((([MIS Personnel].ADPFile)>2) AND (([MIS Personnel].ADPNetAccount)=601) AND (([MIS Personnel].Closed)=False))
ORDER BY [MIS Personnel].Employee
WITH OWNERACCESS OPTION;