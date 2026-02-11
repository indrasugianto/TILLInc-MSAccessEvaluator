SELECT [MIS Hours].Date, [MIS Hours].Activity, [MIS Hours].[Job ID], [MIS Hours].Charge, [MIS Hours].General, [MIS Hours].Employee, [MIS Hours].Hours, [MIS Hours].Journal, [MIS Hours].GeneralHour, [MIS Hours].JobHour
FROM [MIS Hours]
WHERE ((([Job ID]<>0 And [General]<>"" Or [date]>#1/8/2012# And [GeneralHour]=False And [Jobhour]=False)=True))
ORDER BY [MIS Hours].Date DESC , [MIS Hours].Activity;