SELECT [#1999Employees].Employee AS Expr1, [#1999Employees].ADPName AS Expr2, Sum([Payroll Journal].Bonus) AS SumOfBonus, [#1998EmpBonusQ4Query].Q498Bonus AS Expr3, [#1999EmpBonusQ1Query].Q1Bonus AS Expr4, [#1999EmpBonusQ2Query].Q2Bonus AS Expr5, [#1999EmpBonusQ3Query].Q3Bonus AS Expr6, [#1999EmpBonusQ4Query].Q4Bonus AS Expr7
FROM [#1999Employees], [Payroll Journal], [#1999EmpBonusQ1Query], [#1999EmpBonusQ2Query], [#1999EmpBonusQ3Query], [#1999EmpBonusQ4Query], [#1998EmpBonusQ4Query]
WHERE ((([Payroll Journal].CheckDate)>=#10/1/1998#))
GROUP BY [#1999Employees].Employee, [#1999Employees].ADPName, [#1998EmpBonusQ4Query].Q498Bonus, [#1999EmpBonusQ1Query].Q1Bonus, [#1999EmpBonusQ2Query].Q2Bonus, [#1999EmpBonusQ3Query].Q3Bonus, [#1999EmpBonusQ4Query].Q4Bonus
HAVING (((Sum([Payroll Journal].Bonus))>0))
ORDER BY [#1999Employees].ADPName;