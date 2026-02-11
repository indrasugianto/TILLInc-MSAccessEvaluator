SELECT DISTINCTROW [Payroll Journal].CheckDate, [Payroll Journal].CheckNumber, MISHoursADPFileEmployee.Employee
FROM [Payroll Journal] LEFT JOIN MISHoursADPFileEmployee ON [Payroll Journal].ADPFile=MISHoursADPFileEmployee.ADPFile
WHERE ((([Payroll Journal].CheckDate)>=forms!Payroll!fromDate And ([Payroll Journal].CheckDate)<=forms!payroll!todate))
ORDER BY [Payroll Journal].CheckDate DESC , [Payroll Journal].CheckNumber DESC;