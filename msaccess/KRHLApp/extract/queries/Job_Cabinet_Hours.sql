SELECT [>Jobs].ID, [>Jobs].Key, Sum([MIS Hours].Hours) AS SumOfHours, Sum([MIS Hours].Cost) AS SumOfCost, [SumofHours]*Variable("ShopOH")+[SumofCost] AS TotalCost
FROM [>Jobs] LEFT JOIN [MIS Hours] ON [>Jobs].Key=[MIS Hours].[Job ID]
WHERE (((InStr([MIS Hours].Charge,"Cabinet")<>0)=True) And (([>Jobs].Estimate)=False))
GROUP BY [>Jobs].ID, [>Jobs].Key
ORDER BY [>Jobs].ID;