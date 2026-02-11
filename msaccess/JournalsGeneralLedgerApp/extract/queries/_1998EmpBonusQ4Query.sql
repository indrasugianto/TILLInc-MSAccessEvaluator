SELECT [#1999Employees].ADPName AS Expr1, [#1999Employees].ADPFile AS Expr2, Sum([Payroll Journal].Bonus) AS SumOfBonus, [sumofbonus] AS Q498Bonus
FROM [#1999Employees], [Payroll Journal]
WHERE ((([Payroll Journal].CheckDate)>=#10/1/1998# And ([Payroll Journal].CheckDate)<#1/7/1999#))
GROUP BY [#1999Employees].ADPName, [#1999Employees].ADPFile
HAVING (((Sum([Payroll Journal].Bonus))>0))
ORDER BY [#1999Employees].ADPName;