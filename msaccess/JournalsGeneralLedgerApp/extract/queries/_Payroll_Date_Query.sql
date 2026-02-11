SELECT DISTINCTROW [Payroll Journal].CheckDate
FROM [Payroll Journal]
GROUP BY [Payroll Journal].CheckDate
ORDER BY [Payroll Journal].CheckDate DESC;