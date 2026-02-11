SELECT DISTINCTROW [MIS Hours].Date, Sum(IIf(Not IsNull([General]),0,IIf([ADPNetAccount]>=700,variable("office hrly cost estimate")*[Hours],variable("shop hrly cost estimate")*[Hours]))) AS CostPlus
FROM ([MIS Hours] LEFT JOIN [>Jobs] ON [MIS Hours].[Job ID]=[>Jobs].Key) LEFT JOIN [MIS Personnel] ON [MIS Hours].Employee=[MIS Personnel].Employee
WHERE (((InStr(1,[Activity],"Rework",0))<>0))
GROUP BY [MIS Hours].Date
HAVING ((([MIS Hours].Date)>=Format(Forms!Hours!Todate,"mm/dd/" & Year(Forms!Hours!DateSort)-1) And ([MIS Hours].Date)<=forms!Hours!ToDate))
ORDER BY [MIS Hours].Date;