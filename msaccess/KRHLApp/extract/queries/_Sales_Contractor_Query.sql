SELECT DISTINCTROW [>Resources].ID, [>Jobs].ID, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount, Max([Sales Journal].TheDate) AS MaxOfTheDate
FROM [>Resources] INNER JOIN ([>Jobs] LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job) ON [>Resources].Key=[>Jobs].Contractor
WHERE ((([>Jobs].Estimate)=False) AND (([Sales Journal].TheDate) Is Not Null))
GROUP BY [>Resources].ID, [>Jobs].ID
HAVING ((([>Resources].ID)<>"") AND ((Sum([Sales Journal].SaleAmount))<>0))
ORDER BY [>Resources].ID, [>Jobs].ID;