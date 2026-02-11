SELECT DISTINCTROW [MIS Hours].[Job ID], [MIS Hours].Date, [MIS Hours].Employee, [MIS Hours].Activity, [MIS Hours].General, [MIS Hours].Hours, [MIS Hours].Cost, [MIS Hours].Rate, [MIS Hours].Charge
FROM [MIS Hours]
WHERE ((([MIS Hours].[Job ID]) Is Null Or ([MIS Hours].[Job ID])=0) And (([MIS Hours].Date)=Forms!MISHoursEntry!Week) And (([MIS Hours].Employee)=Forms!MISHoursEntry!EmpName));