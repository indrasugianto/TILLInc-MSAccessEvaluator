SELECT [MIS Hours].Employee, First([MIS Personnel].ADPFile) AS FirstOfADPFile, Sum([MIS Hours].Hours) AS SumOfHours
FROM [MIS Hours] INNER JOIN [MIS Personnel] ON [MIS Hours].Employee=[MIS Personnel].Employee
WHERE (((Year([MIS Hours].Date))=Year(Forms!Payroll!FromDate)) And (([MIS Hours].Date)<=Forms!Payroll!ToDate))
GROUP BY [MIS Hours].Employee
ORDER BY [MIS Hours].Employee;