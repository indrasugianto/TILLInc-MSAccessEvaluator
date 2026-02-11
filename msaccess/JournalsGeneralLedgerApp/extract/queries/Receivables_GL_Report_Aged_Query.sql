SELECT DISTINCTROW Max([Receivables GL Report Aged Prep Query].TransactionDate) AS MaxOfTransactionDate, [Receivables GL Report Aged Prep Query].[>Jobs].ID, Sum([Receivables GL Report Aged Prep Query].DebitAmount) AS SumOfDebitAmount, Sum([Receivables GL Report Aged Prep Query].CreditAmount) AS SumOfCreditAmount, [Receivables GL Report Aged Prep Query].[>Resources].ID, Sum([debitamount])-Sum([creditamount]) AS Expr1
FROM [Receivables GL Report Aged Prep Query]
GROUP BY [Receivables GL Report Aged Prep Query].[>Jobs].ID, [Receivables GL Report Aged Prep Query].[>Resources].ID
HAVING (((Sum([debitamount])-Sum([creditamount]))>=1 Or (Sum([debitamount])-Sum([creditamount]))<=-1))
ORDER BY Max([Receivables GL Report Aged Prep Query].TransactionDate) DESC;