SELECT [General Ledger].TransactionDate, [General Ledger].AccountNumber, [General Ledger].SourceJournal, [MIS Accounts].Account, Sum([General Ledger].CreditAmount) AS SumOfCreditAmount, Sum([General Ledger].DebitAmount) AS SumOfDebitAmount
FROM [General Ledger] INNER JOIN [MIS Accounts] ON [General Ledger].AccountNumber=[MIS Accounts].Number
WHERE (((IIf(Forms!GeneralLedger!SelectJournal,IIf(Forms!GeneralLedger!SelectedJournal=[SourceJournal],True,False),True))=True))
GROUP BY [General Ledger].TransactionDate, [General Ledger].AccountNumber, [General Ledger].SourceJournal, [MIS Accounts].Account
HAVING ((([General Ledger].TransactionDate)>=Forms!GeneralLedger.FromDate And ([General Ledger].TransactionDate)<=Forms!GeneralLedger.ToDate) And (([General Ledger].AccountNumber)=Forms!GeneralLedger.SelectedAccount))
ORDER BY [General Ledger].TransactionDate;