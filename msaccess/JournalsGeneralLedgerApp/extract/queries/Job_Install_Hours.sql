SELECT [>Jobs].ID, [>Jobs].Key, Sum([MIS Hours].Hours) AS SumOfHours, Sum([MIS Hours].Cost) AS SumOfCost, [SumofHours]*Variable("ShopOH")+[SumofCost] AS TotalCost
FROM [>Jobs] LEFT JOIN [MIS Hours] ON [>Jobs].Key=[MIS Hours].[Job ID]
WHERE (((InStr([MIS Hours].Charge,"Install")<>0)=True) And (([>Jobs].Estimate)=False))
GROUP BY [>Jobs].ID, [>Jobs].Key
HAVING (((Last([MIS Hours].Date))>#12/31/1999#))
ORDER BY [>Jobs].ID;