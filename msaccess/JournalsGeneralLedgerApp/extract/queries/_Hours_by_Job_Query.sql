SELECT DISTINCTROW [>Jobs].ID, [MIS Hours].[Job ID], [MIS Hours].Date, [MIS Hours].Employee, [MIS Hours].Activity, [MIS Hours].General, [MIS Hours].Hours, [MIS Hours].Key
FROM [MIS Hours] INNER JOIN [>Jobs] ON [MIS Hours].[Job ID]=[>Jobs].Key
ORDER BY [>Jobs].ID, [MIS Hours].Date DESC , [MIS Hours].Employee, [MIS Hours].Activity, [MIS Hours].General;