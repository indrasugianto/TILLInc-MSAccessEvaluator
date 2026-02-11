SELECT DISTINCTROW [>Payroll Query].*, [MIS Personnel].WitholdingAccount
FROM [>Payroll Query] LEFT JOIN [MIS Personnel] ON [>Payroll Query].ADPFile=[MIS Personnel].ADPFile
WHERE ((([>Payroll Query].Void)=False) And (([>Payroll Query].ADPFile)>5) And (([MIS Personnel].ADPNetAccount)=IIf(Forms!Payroll!SelectADPNet,Forms!Payroll!ADPNetAccount,[ADPNetAccount])));