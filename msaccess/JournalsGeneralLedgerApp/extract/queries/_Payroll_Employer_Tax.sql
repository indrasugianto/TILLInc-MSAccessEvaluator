SELECT [>Payroll Query].ADPFile, [General Ledger].AccountNumber, Sum([General Ledger].DebitAmount) AS Employertax
FROM ([>Payroll Query] LEFT JOIN [General Ledger] ON [>Payroll Query].Key=[General Ledger].SourceKey) LEFT JOIN [MIS Personnel] ON [>Payroll Query].ADPFile=[MIS Personnel].ADPFile
WHERE (((IIf([employeraccount]=[AccountNumber],True,False))=True) AND ((IIf(InStr([SourceTransaction],"tax")<>0,True,False))=True))
GROUP BY [>Payroll Query].ADPFile, [General Ledger].AccountNumber;