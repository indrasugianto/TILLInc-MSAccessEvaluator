SELECT DISTINCTROW [MIS Accounts].Number, First([MIS Accounts].Account) AS FirstOfAccount
FROM [MIS Accounts] LEFT JOIN [General Ledger] ON [MIS Accounts].Number=[General Ledger].AccountNumber
WHERE (((IIf(Year([TransactionDate])>=Year(Date())-3 Or [Balance]<>0,True,False))=True))
GROUP BY [MIS Accounts].Number
ORDER BY [MIS Accounts].Number;