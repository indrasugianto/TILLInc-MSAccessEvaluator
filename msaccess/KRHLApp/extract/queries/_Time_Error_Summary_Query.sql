SELECT DISTINCTROW [MIS Hours].*, [>Jobs].ID, [>Jobs].Completed, [>Jobs].DesignJob
FROM [MIS Hours] LEFT JOIN [>Jobs] ON [MIS Hours].[Job ID]=[>Jobs].Key
WHERE ((([MIS Hours].Date)=Forms!HoursEntry.Week))
ORDER BY [MIS Hours].Archive DESC , [MIS Hours].Activity;