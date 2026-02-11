SELECT [Date]+10 AS PayCheck, [MIS Hours].General AS V, [MIS Hours].Hours, [MIS Hours].ADPFile, [MIS Hours].Employee
FROM [MIS Hours]
WHERE ((([MIS Hours].General)="V Vacation") AND (([MIS Hours].Date)>=#1/1/2000#));