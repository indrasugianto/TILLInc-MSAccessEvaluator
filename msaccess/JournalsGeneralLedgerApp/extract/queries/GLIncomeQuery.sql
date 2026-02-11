SELECT DISTINCTROW GLIncomeQueryBasis.AccountType, GLIncomeQueryBasis.Number, GLIncomeQueryBasis.Account, Sum(GLIncomeQueryBasis.DebitAmount) AS SumOfDebitAmount, Sum(GLIncomeQueryBasis.CreditAmount) AS SumOfCreditAmount
FROM GLIncomeQueryBasis
WHERE (((GLIncomeQueryBasis.Expr1)=True))
GROUP BY GLIncomeQueryBasis.AccountType, GLIncomeQueryBasis.Number, GLIncomeQueryBasis.Account
ORDER BY GLIncomeQueryBasis.Number;