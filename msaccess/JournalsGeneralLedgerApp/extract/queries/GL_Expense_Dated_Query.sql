SELECT DISTINCTROW [>General Ledger Query].AccountNumber, Sum([>General Ledger Query].DebitAmount) AS SumOfDebitAmount, Sum([>General Ledger Query].CreditAmount) AS SumOfCreditAmount
FROM [>General Ledger Query]
WHERE ((([>General Ledger Query].TransactionDate)>=Forms!GeneralLedger!FromDate And ([>General Ledger Query].TransactionDate)<=Forms!GeneralLedger!Todate))
GROUP BY [>General Ledger Query].AccountNumber
HAVING ((([>General Ledger Query].AccountNumber)>=300))
ORDER BY [>General Ledger Query].AccountNumber;