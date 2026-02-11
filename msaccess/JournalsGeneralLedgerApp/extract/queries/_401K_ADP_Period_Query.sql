SELECT [Payroll Journal].ADPFile, Max(Format([CheckDate],'mm/dd/yyyy')) AS CheckDateFormatted, Sum([Payroll Journal].Field3) AS SumOfField3, Sum([Payroll Journal].Commission) AS SumOfCommission, Sum([Payroll Journal].Roth) AS SumOfRoth, Sum([Payroll Journal].RothLoan) AS SumOfRothLoan
FROM [Payroll Journal]
WHERE ((([Payroll Journal].CheckDate)>=Forms!Payroll!FromDate And ([Payroll Journal].CheckDate)<=Forms!Payroll!ToDate))
GROUP BY [Payroll Journal].ADPFile
HAVING ((([Payroll Journal].ADPFile)>10));