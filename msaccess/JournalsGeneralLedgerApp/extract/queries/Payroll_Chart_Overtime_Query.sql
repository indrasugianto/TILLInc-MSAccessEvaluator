SELECT DISTINCTROW [>Payroll Query].CheckDate, Sum([>Payroll Query].OverTime) AS SumOfOverTime
FROM [>Payroll Query] LEFT JOIN [MIS Personnel] ON [>Payroll Query].ADPFile=[MIS Personnel].ADPFile
WHERE ((([>Payroll Query].Void)=False) And (([>Payroll Query].ADPFile)>2) And (([>Payroll Query].ADPNetAccount)=IIf(Forms!Payroll!SelectADPNet,Forms!Payroll!ADPNetAccount,[>Payroll Query].ADPNetAccount)))
GROUP BY [>Payroll Query].CheckDate;