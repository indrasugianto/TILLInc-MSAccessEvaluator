SELECT DatePart("yyyy",[checkdate]) AS Y, DatePart("q",[checkdate]) AS Q, [MIS Personnel].WitholdingAccount, Sum([Payroll Journal].Bonus) AS SumOfBonus
FROM [Payroll Journal], [MIS Personnel], [#19984QEmployees] AS [#19984QEmployees_1]
WHERE ((([Payroll Journal].CheckDate)>#10/1/1998# And ([Payroll Journal].CheckDate)<#1/7/2000#))
GROUP BY DatePart("yyyy",[checkdate]), DatePart("q",[checkdate]), [MIS Personnel].WitholdingAccount
HAVING (((Sum([Payroll Journal].Bonus))>0))
ORDER BY DatePart("yyyy",[checkdate]), DatePart("q",[checkdate]);