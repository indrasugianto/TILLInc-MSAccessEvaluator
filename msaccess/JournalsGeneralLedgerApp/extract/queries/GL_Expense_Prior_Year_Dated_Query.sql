SELECT DISTINCTROW [>General Ledger Query].AccountNumber, Sum([>General Ledger Query].DebitAmount) AS SumOfDebitAmount, Sum([>General Ledger Query].CreditAmount) AS SumOfCreditAmount, PriorYear(Forms!GeneralLedger!FromDate) AS FromDate, PriorYear(Forms!GeneralLedger!ToDate) AS ToDate
FROM [>General Ledger Query]
WHERE ((([>General Ledger Query].TransactionDate)>=PriorYear(Forms!GeneralLedger!FromDate) And ([>General Ledger Query].TransactionDate)<=PriorYear(Forms!GeneralLedger!ToDate)))
GROUP BY [>General Ledger Query].AccountNumber
HAVING ((([>General Ledger Query].AccountNumber)>=300))
ORDER BY [>General Ledger Query].AccountNumber;