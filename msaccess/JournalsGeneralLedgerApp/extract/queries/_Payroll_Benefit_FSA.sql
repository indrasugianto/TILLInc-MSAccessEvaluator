SELECT [>Payroll Query].ADPFile, [General Ledger].AccountNumber, Sum([General Ledger].CreditAmount) AS FSAAmount
FROM [>Payroll Query] LEFT JOIN [General Ledger] ON [>Payroll Query].Key=[General Ledger].SourceKey
WHERE (((IIf(InStr([SourceTransaction],"FSA")<>0,True,False))=True))
GROUP BY [>Payroll Query].ADPFile, [General Ledger].AccountNumber;