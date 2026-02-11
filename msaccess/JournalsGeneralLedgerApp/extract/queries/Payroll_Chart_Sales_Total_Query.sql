SELECT DISTINCTROW [>Payroll Query].CheckDate, Sum([Gross]-[Bonus]) AS [Payroll Total], Max([Sales Total Payroll Report Query].SumOfSale) AS Sales
FROM ([>Payroll Query] LEFT JOIN [MIS Personnel] ON [>Payroll Query].ADPFile=[MIS Personnel].ADPFile) LEFT JOIN [Sales Total Payroll Report Query] ON [>Payroll Query].CheckDate=[Sales Total Payroll Report Query].SaleDate
WHERE ((([>Payroll Query].Void)=False) And (([>Payroll Query].ADPNetAccount)=IIf(Forms!Payroll!SelectADPNet,Forms!Payroll!ADPNetAccount,[>Payroll Query].ADPNetAccount)) And (([>Payroll Query].ADPFile)>2))
GROUP BY [>Payroll Query].CheckDate
ORDER BY [>Payroll Query].CheckDate;