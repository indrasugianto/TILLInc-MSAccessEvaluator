SELECT DISTINCTROW Max([Receivables Report Aged Prep Query].TransactionDate) AS MaxOfTransactionDate, [Receivables Report Aged Prep Query].[>Jobs].ID, Sum([Receivables Report Aged Prep Query].DebitAmount) AS SumOfDebitAmount, Sum([Receivables Report Aged Prep Query].CreditAmount) AS SumOfCreditAmount, [Receivables Report Aged Prep Query].[>Resources].ID, Sum([debitamount])-Sum([creditamount]) AS Expr1
FROM [Receivables Report Aged Prep Query]
GROUP BY [Receivables Report Aged Prep Query].[>Jobs].ID, [Receivables Report Aged Prep Query].[>Resources].ID
HAVING (((Sum([debitamount])-Sum([creditamount]))>=1 Or (Sum([debitamount])-Sum([creditamount]))<=-1))
ORDER BY Max([Receivables Report Aged Prep Query].TransactionDate) DESC;