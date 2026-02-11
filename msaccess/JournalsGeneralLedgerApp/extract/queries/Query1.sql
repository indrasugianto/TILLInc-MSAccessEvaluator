SELECT Year([CheckDate]) AS Expr1, Sum([Payroll Journal].Vacation) AS SumOfVacation, Sum([Payroll Journal].RetroactiveVacation) AS SumOfRetroactiveVacation
FROM [Payroll Journal]
GROUP BY Year([CheckDate]);