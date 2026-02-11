SELECT DISTINCTROW [Payroll Journal].*, [MIS Personnel].ADPName
FROM [Payroll Journal] LEFT JOIN [MIS Personnel] ON [Payroll Journal].ADPFile=[MIS Personnel].ADPFile
WHERE ((([Payroll Journal].Closed)=False) AND (([Payroll Journal].Void)=False) AND (([Payroll Journal].Net)<>0));