SELECT DISTINCTROW [MIS Accounts].Sort2 AS Expr1, [MIS Accounts].Number, [MIS Accounts].Sort1 AS Expr2, [MIS Accounts].Heading1, [GL Expense Dated Query].SumOfDebitAmount, [GL Expense Dated Query].SumOfCreditAmount, [MIS Accounts].Account, [MIS Accounts].Balance, [MIS Accounts].Heading2 AS Expr3
FROM [MIS Accounts] LEFT JOIN [GL Expense Dated Query] ON [MIS Accounts].Number=[GL Expense Dated Query].AccountNumber
WHERE ((([MIS Accounts].Number)>=300))
ORDER BY [MIS Accounts].Sort2, [MIS Accounts].Number;