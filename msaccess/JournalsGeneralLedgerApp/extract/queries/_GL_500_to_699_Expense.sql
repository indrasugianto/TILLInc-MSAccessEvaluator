SELECT Sum([General Ledger].CreditAmount) AS SumOfCreditAmount, Sum([General Ledger].DebitAmount) AS SumOfDebitAmount
FROM [General Ledger]
WHERE ((([General Ledger].AccountNumber)>=500 And ([General Ledger].AccountNumber)<=699) And (([General Ledger].TransactionDate)>=Forms!GeneralLedger!FromDate And ([General Ledger].TransactionDate)<=Forms!GeneralLedger!ToDate));