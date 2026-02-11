SELECT DISTINCTROW [Receivables Report Query].[>Jobs].ID, [Receivables Report Query].TransactionDate, [Receivables Report Query].DebitAmount, [Receivables Report Query].CreditAmount, [Receivables Report Query].[>Resources].ID, [Receivables Report Query].AccountNumber
FROM [Receivables Report Query]
WHERE ((([Receivables Report Query].AccountNumber)=121))
ORDER BY [Receivables Report Query].[>Jobs].ID;