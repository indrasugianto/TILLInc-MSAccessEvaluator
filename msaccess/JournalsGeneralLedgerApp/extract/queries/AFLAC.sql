SELECT [MIS Personnel].ADPName, ADP.CheckDate AS Expr1, ADP.CheckNumber AS Expr2, ADP.Insurance AS Expr3, ADP.Dental AS Expr4
FROM ADP, [MIS Personnel]
WHERE (((ADP.CheckDate)>#1/1/2001# And (ADP.CheckDate)<#12/31/2001#))
ORDER BY [MIS Personnel].ADPName, ADP.CheckDate;