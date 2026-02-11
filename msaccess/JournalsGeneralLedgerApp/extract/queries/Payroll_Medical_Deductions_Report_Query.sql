SELECT DISTINCTROW ADP.CheckDate AS Expr1, Sum(ADP.Medical) AS SumOfMedical, Sum(ADP.Insurance) AS SumOfInsurance, Sum(ADP.Dental) AS SumOfDental
FROM ADP
GROUP BY ADP.CheckDate
ORDER BY ADP.CheckDate;