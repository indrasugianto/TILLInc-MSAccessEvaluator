SELECT DISTINCTROW [General Ledger].AccountNumber AS PreviousAccountNumber, Sum([General Ledger].CreditAmount) AS PreviousCreditAmount, Sum([General Ledger].DebitAmount) AS PreviousDebitAmount
FROM [General Ledger]
WHERE (((Year([TransactionDate]))=Year(Forms!GeneralLedger!FromDate)-1))
GROUP BY [General Ledger].AccountNumber;