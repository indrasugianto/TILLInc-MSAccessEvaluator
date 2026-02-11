SELECT [>Jobs].ID, [>Jobs].Key, [>Jobs].DesignOH, Sum([MIS Hours].Hours) AS SumOfHours, Sum([MIS Hours].Cost) AS SumOfCost, IIf(nnez([>Jobs]!DesignOH)=0,[SumofHours]*Variable("Design OH")+[SumofCost],[SumofHours]*[>Jobs]!DesignOH+[SumofCost]) AS TotalCost
FROM [>Jobs] LEFT JOIN [MIS Hours] ON [>Jobs].Key=[MIS Hours].[Job ID]
WHERE (((InStr([MIS Hours].Charge,"Project")<>0)=True) And (([>Jobs].Estimate)=False))
GROUP BY [>Jobs].ID, [>Jobs].Key, [>Jobs].DesignOH
ORDER BY [>Jobs].ID;