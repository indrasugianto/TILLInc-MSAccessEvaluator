SELECT [>Jobs].ID, [>Jobs].Key, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount, Last([Sales Journal].TheDate) AS LastOfTheDate
FROM [>Jobs] LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job
WHERE ((([>Jobs].Estimate)=False) And ((IIf(InStr([Sales Journal].Category,'Stone')=0,True,False))=True))
GROUP BY [>Jobs].ID, [>Jobs].Key
HAVING (((Sum([Sales Journal].SaleAmount))>0))
ORDER BY [>Jobs].ID;