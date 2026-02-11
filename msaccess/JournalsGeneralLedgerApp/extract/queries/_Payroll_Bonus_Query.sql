SELECT DISTINCTROW [MIS Personnel].ADPName, [Payroll Journal].CheckNumber, [Payroll Journal].CheckDate, [Payroll Journal].Bonus, [Payroll Journal].ADPFile, [Payroll Journal].Gross
FROM [Payroll Journal] LEFT JOIN [MIS Personnel] ON [Payroll Journal].ADPFile=[MIS Personnel].ADPFile
WHERE ((([MIS Personnel].ADPName) Is Not Null) And (([Payroll Journal].CheckDate)>=Forms!Payroll.FromDate And ([Payroll Journal].CheckDate)<=Forms!Payroll.ToDate))
ORDER BY [MIS Personnel].ADPName, [Payroll Journal].CheckNumber, [Payroll Journal].CheckDate;