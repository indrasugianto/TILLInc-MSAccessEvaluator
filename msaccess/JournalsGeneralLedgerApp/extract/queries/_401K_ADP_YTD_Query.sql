SELECT [Payroll Journal].ADPFile, Sum([Payroll Journal].Gross) AS SumOfGross, [MIS Personnel].ADPName
FROM [Payroll Journal] LEFT JOIN [MIS Personnel] ON [Payroll Journal].ADPFile=[MIS Personnel].ADPFile
WHERE (((Year([CheckDate]))=Year(Forms!Payroll!FromDate)) And (([Payroll Journal].CheckDate)<=Forms!Payroll!ToDate))
GROUP BY [Payroll Journal].ADPFile, [MIS Personnel].ADPName
HAVING ((([Payroll Journal].ADPFile)>10));