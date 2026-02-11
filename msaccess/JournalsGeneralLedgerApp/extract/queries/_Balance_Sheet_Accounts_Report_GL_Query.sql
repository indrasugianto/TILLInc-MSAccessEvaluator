SELECT DISTINCTROW [General Ledger].AccountNumber, Sum([General Ledger].CreditAmount) AS SumOfCreditAmount, Sum([General Ledger].DebitAmount) AS SumOfDebitAmount
FROM [General Ledger]
WHERE ((([General Ledger].TransactionDate)>=Forms!GeneralLedger!FromDate And ([General Ledger].TransactionDate)<=forms!GeneralLedger!todate))
GROUP BY [General Ledger].AccountNumber;