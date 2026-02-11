SELECT DISTINCTROW [Payroll Journal].CheckDate, [Gross]-[federal]-[state]-[Payroll Journal].socialsecurity-[medicare]-[field1]-[field2]-[field3] AS Expr1, MISHoursADPFileEmployee.Employee, MISHoursADPFileEmployee.ADPFile
FROM [Payroll Journal] LEFT JOIN MISHoursADPFileEmployee ON [Payroll Journal].ADPFile=MISHoursADPFileEmployee.ADPFile
WHERE ((([Payroll Journal].CheckNumber)=0) AND (([Payroll Journal].Void)=False) AND (([Payroll Journal].ADPFile)>2))
ORDER BY [Payroll Journal].CheckDate, [Payroll Journal].CheckNumber;