SELECT DISTINCTROW [Payroll Journal].*
FROM [Payroll Journal]
WHERE ((([Payroll Journal].CheckNumber)=0) AND (([Payroll Journal].Void)=False) AND (([Payroll Journal].ADPFile)<=9))
ORDER BY [Payroll Journal].CheckDate, [Payroll Journal].CheckNumber;