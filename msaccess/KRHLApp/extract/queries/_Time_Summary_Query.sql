SELECT DISTINCTROW [MIS Hours].*, [>Jobs].ID
FROM [MIS Hours] LEFT JOIN [>Jobs] ON [MIS Hours].[Job ID]=[>Jobs].Key
WHERE ((([MIS Hours].Employee)=Forms!HoursEntry.EmpName) And (([MIS Hours].Date)=Forms!HoursEntry.Week))
ORDER BY [MIS Hours].Archive DESC , [MIS Hours].Activity;