SELECT DISTINCTROW [MIS Personnel].Employee, [MIS Personnel].Key, [MIS Personnel].Rate, [MIS Personnel].ADPFile, [MIS Personnel].ADPName, [MIS Personnel].ADPNetAccount, [MIS Personnel].WitholdingAccount, [MIS Personnel].MedicalAccount, [MIS Personnel].EmployerAccount, [MIS Personnel].MiscAccount, [MIS Personnel].RetirementAccount
FROM [MIS Personnel]
WHERE ((([MIS Personnel].Closed)=False))
ORDER BY [MIS Personnel].Employee
WITH OWNERACCESS OPTION;