SELECT DISTINCTROW [>Payroll Query].CheckDate, Sum([Gross]-[Bonus]) AS Total, Sum([>Payroll Query].OverTime) AS OT, Sum([>Payroll Query].Bonus) AS [Annual Bonus]
FROM [>Payroll Query] LEFT JOIN [MIS Personnel] ON [>Payroll Query].ADPFile=[MIS Personnel].ADPFile
WHERE ((([>Payroll Query].Void)=False) And (([>Payroll Query].ADPFile)>2) And (([>Payroll Query].ADPNetAccount)=IIf(Forms!Payroll!SelectADPNet,Forms!Payroll!ADPNetAccount,[>Payroll Query].ADPNetAccount)) And ((IIf(Left([mis personnel].ADPNetAccount,1)=5,True,False))=True))
GROUP BY [>Payroll Query].CheckDate;