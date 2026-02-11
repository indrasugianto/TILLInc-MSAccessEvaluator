SELECT DISTINCTROW [MIS Hours].Employee, [MIS Hours].Date, [MIS Hours].ADPHoursCode, [MIS Hours].ADPHours, [MIS Hours].ADPFile, [MIS Hours].Key
FROM [MIS Hours]
WHERE ((([MIS Hours].Employee)=Forms!HoursEntry.EmpName) And (([MIS Hours].Date)=Forms!HoursEntry.Week) And (([MIS Hours].ADPHoursCode) Is Not Null));