SELECT [>Payroll Query].ADPFile, Sum([General Ledger].CreditAmount) AS AFLACAmount
FROM [>Payroll Query] LEFT JOIN [General Ledger] ON [>Payroll Query].Key=[General Ledger].SourceKey
WHERE (((IIf(InStr([SourceTransaction],"Optional")<>0 Or InStr([SourceTransaction],"Dental")<>0,True,False))=True))
GROUP BY [>Payroll Query].ADPFile;