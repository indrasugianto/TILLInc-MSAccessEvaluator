SELECT [Payroll Journal].*, nnez([Field3])+nnez([Roth]) AS Retirement
FROM [Payroll Journal]
WHERE (((IIf([CheckDate]>=Forms!Payroll.FromDate And [CheckDate]<=Forms!Payroll.ToDate,True,False))=True) And (([Payroll Journal].Void)=False))
ORDER BY [Payroll Journal].CheckDate DESC , [Payroll Journal].Closed DESC , [Payroll Journal].CheckNumber DESC , [Payroll Journal].Employee DESC;