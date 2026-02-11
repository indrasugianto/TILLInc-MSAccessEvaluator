SELECT DISTINCTROW [>Jobs].ID, Sum(IIf(Not IsNull([General]),0,IIf([ADPNetAccount]>=700,variable("office hrly cost estimate")*[Hours],variable("shop hrly cost estimate")*[Hours]))) AS CostPlus, [>Hours by Date].[Job ID], Sum(IIf([ADPNetAccount]>=700,variable("office hrly cost estimate")*[Hours],variable("shop hrly cost estimate")*[Hours])) AS HourlyCost
FROM ([>Hours by Date] LEFT JOIN [MIS Personnel] ON [>Hours by Date].ADPFile=[MIS Personnel].ADPFile) LEFT JOIN [>Jobs] ON [>Hours by Date].[Job ID]=[>Jobs].Key
WHERE (((InStr(1,[Activity],"Rework",0))<>0))
GROUP BY [>Jobs].ID, [>Hours by Date].[Job ID]
ORDER BY Sum(IIf(Not IsNull([General]),0,IIf([ADPNetAccount]>=700,variable("office hrly cost estimate")*[Hours],variable("shop hrly cost estimate")*[Hours]))) DESC;