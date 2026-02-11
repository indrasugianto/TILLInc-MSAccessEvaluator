SELECT Sum(ADP.Federal) AS SumOfFederal
FROM ADP
WHERE (((ADP.ADPFile)=2932) And ((ADP.CheckDate)>#1/1/1999# And (ADP.CheckDate)<#1/1/2000#));