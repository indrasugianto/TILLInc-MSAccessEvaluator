SELECT DISTINCTROW [MIS Accounts].Number, [MIS Accounts].Account, [MIS Accounts].Balance, Sum([>General Ledger Query].DebitAmount) AS SumOfDebitAmount, Sum([>General Ledger Query].CreditAmount) AS SumOfCreditAmount, [>Resources].ID
FROM ([MIS Accounts] LEFT JOIN [>General Ledger Query] ON [MIS Accounts].Number=[>General Ledger Query].AccountNumber) LEFT JOIN [>Resources] ON [>General Ledger Query].SourceOperative=[>Resources].Key
WHERE ((([>General Ledger Query].TransactionDate)>=Forms!GeneralLedger.FromDate And ([>General Ledger Query].TransactionDate)<=Forms!GeneralLedger.ToDate))
GROUP BY [MIS Accounts].Number, [MIS Accounts].Account, [MIS Accounts].Balance, [>Resources].ID
ORDER BY [MIS Accounts].Number;