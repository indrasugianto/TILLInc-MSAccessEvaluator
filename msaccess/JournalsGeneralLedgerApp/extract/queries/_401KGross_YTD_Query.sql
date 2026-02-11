SELECT [MIS Personnel].Employee, Last([Payroll Journal].CheckDate) AS LastOfCheckDate, First([MIS Personnel].ADPFile) AS FirstOfADPFile, Sum([Payroll Journal].Gross) AS SumOfGross
FROM [MIS Personnel] LEFT JOIN [Payroll Journal] ON [MIS Personnel].ADPFile=[Payroll Journal].ADPFile
WHERE (((Year([Payroll Journal].CheckDate))=Year(Forms!Payroll!FromDate) And (Year([Payroll Journal].CheckDate))<=Forms!Payroll!ToDate))
GROUP BY [MIS Personnel].Employee
HAVING (((First([MIS Personnel].ADPFile))>10))
ORDER BY [MIS Personnel].Employee, Last([Payroll Journal].CheckDate);