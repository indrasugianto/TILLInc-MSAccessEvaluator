SELECT [>Payroll Query].ADPFile, [General Ledger].AccountNumber, Sum([General Ledger].CreditAmount) AS MedicalAmount
FROM ([>Payroll Query] LEFT JOIN [General Ledger] ON [>Payroll Query].Key=[General Ledger].SourceKey) LEFT JOIN [MIS Personnel] ON [>Payroll Query].ADPFile=[MIS Personnel].ADPFile
WHERE (((IIf([medicalAccount]=[AccountNumber],True,False))=True) AND ((IIf(InStr([SourceTransaction],"Medical")<>0 And InStr([SourceTransaction],"FSA")=0,True,False))=True))
GROUP BY [>Payroll Query].ADPFile, [General Ledger].AccountNumber;