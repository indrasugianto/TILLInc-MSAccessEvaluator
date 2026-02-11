SELECT DISTINCTROW [>Jobs].ID, Sum(IIf(Not IsNull([General]),0,IIf([ADPNetAccount]>=700,variable("office hrly cost estimate")*[Hours],variable("shop hrly cost estimate")*[Hours]))) AS CostPlus, [MIS Hours].[Job ID], Sum(IIf([ADPNetAccount]>=700,variable("office hrly cost estimate")*[Hours],variable("shop hrly cost estimate")*[Hours])) AS HourlyCost
FROM ([MIS Hours] LEFT JOIN [>Jobs] ON [MIS Hours].[Job ID]=[>Jobs].Key) LEFT JOIN [MIS Personnel] ON [MIS Hours].ADPFile=[MIS Personnel].ADPFile
WHERE (((InStr(1,[Activity],"Rework",0))<>0))
GROUP BY [>Jobs].ID, [MIS Hours].[Job ID]
ORDER BY Sum(IIf(Not IsNull([General]),0,IIf([ADPNetAccount]>=700,variable("office hrly cost estimate")*[Hours],variable("shop hrly cost estimate")*[Hours]))) DESC;