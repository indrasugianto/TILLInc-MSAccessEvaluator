SELECT DISTINCTROW [MIS Hours].*
FROM [MIS Hours]
WHERE ((([MIS Hours].Date)=Forms!HoursEntry.Week) And (([MIS Hours].ADPHoursCode) Is Not Null))
ORDER BY [MIS Hours].Employee;