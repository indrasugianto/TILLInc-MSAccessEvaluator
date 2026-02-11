SELECT DISTINCTROW [MIS Hours].Date, Sum(IIf(Not IsNull([General]),0,IIf([ADPNetAccount]>=700,variable("office hrly cost estimate")*[Hours],variable("shop hrly cost estimate")*[Hours]))) AS CostPlus
FROM ([MIS Hours] LEFT JOIN [>Jobs] ON [MIS Hours].[Job ID]=[>Jobs].Key) LEFT JOIN [MIS Personnel] ON [MIS Hours].Employee=[MIS Personnel].Employee
GROUP BY [MIS Hours].Date
HAVING ((([MIS Hours].Date)>=LocalVariable("Form_Hours_DateSort") And ([MIS Hours].Date)<=LocalVariable("Form_Hours_ToDate")))
ORDER BY [MIS Hours].Date;