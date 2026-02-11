SELECT DISTINCTROW [MIS Accounts].Number, [MIS Accounts].Account, [MIS Accounts].AccountType, [>General Ledger Query].DebitAmount, [>General Ledger Query].CreditAmount, [>General Ledger Query].TransactionDate, NotNull([AccountType]) Or [TransactionDate]>=Forms!GeneralLedger.FromDate And [TransactionDate]<=Forms!GeneralLedger.ToDate AS Expr1
FROM [MIS Accounts] LEFT JOIN [>General Ledger Query] ON [MIS Accounts].Number=[>General Ledger Query].AccountNumber
WHERE ((([MIS Accounts].Number)>=300))
ORDER BY [MIS Accounts].Number;