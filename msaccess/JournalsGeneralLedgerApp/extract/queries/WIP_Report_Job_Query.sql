SELECT DISTINCTROW [>Jobs].ID, [>Jobs].Key, [>Jobs].Customer
FROM [Sales Journal] INNER JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key
WHERE ((([Sales Journal].TheDate) Is Null Or ([Sales Journal].TheDate)>Forms!GeneralLedger!ToDate) And ((InStr([Sales Journal]!Category,"Cabinet")<>0 Or InStr([Sales Journal]!Category,"Install")<>0)=True) And ((InStr([Sales Journal]!Category,"Additional")=0)=True) And (([>Jobs].Estimate)=False) And (([>Jobs].Closed)=False))
GROUP BY [>Jobs].ID, [>Jobs].Key, [>Jobs].Customer
HAVING (((Sum([Sales Journal].SaleAmount))<>0))
ORDER BY [>Jobs].ID;