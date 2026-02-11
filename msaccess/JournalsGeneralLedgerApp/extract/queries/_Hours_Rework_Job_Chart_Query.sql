SELECT Charts.Text1 AS Expr1, Charts.Value1 AS Expr2
FROM Charts
WHERE (((Charts.Counter)<>0))
ORDER BY Charts.Counter;