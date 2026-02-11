SELECT DISTINCTROW [MIS Hours].[Job ID], [>Jobs].ID, [MIS Hours].Charge, [MIS Hours].Activity, Sum([MIS Hours].Hours) AS SumOfHours, Sum([MIS Hours].Cost) AS SumOfCost, [MIS Contracts].Order AS Expr1, First([MIS Contracts].Amount) AS FirstOfAmount, [>Jobs].Delivered, First([MIS Contracts].[Materials Cost]) AS [FirstOfMaterials Cost]
FROM [MIS Contracts], [MIS Hours] LEFT JOIN [>Jobs] ON [MIS Hours].[Job ID] = [>Jobs].Key
GROUP BY [MIS Hours].[Job ID], [>Jobs].ID, [MIS Hours].Charge, [MIS Hours].Activity, [MIS Contracts].Order, [>Jobs].Delivered
HAVING ((([MIS Hours].[Job ID])=[Forms]![Jobs]![JobName]))
ORDER BY [MIS Hours].Charge, [MIS Hours].Activity;