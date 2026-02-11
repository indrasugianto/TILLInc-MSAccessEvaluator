SELECT DISTINCTROW [Payroll Journal].*, [MIS Personnel].ADPName
FROM [Payroll Journal] LEFT JOIN [MIS Personnel] ON [Payroll Journal].ADPFile=[MIS Personnel].ADPFile
WHERE ((([MIS Personnel].ADPName)=Forms!Payroll.SelectedPayee) And (([Payroll Journal].CheckDate)>=Forms!Payroll!FromDate And ([Payroll Journal].CheckDate)<=Forms!Payroll!ToDate))
ORDER BY [Payroll Journal].Closed DESC , [Payroll Journal].CheckDate DESC , [Payroll Journal].CheckNumber DESC , [MIS Personnel].ADPName DESC;