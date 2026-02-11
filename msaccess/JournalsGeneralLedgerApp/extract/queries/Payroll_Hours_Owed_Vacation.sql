SELECT [Date]+10 AS PayCheck, [MIS Hours].General AS OV, [MIS Hours].Hours, [MIS Hours].ADPFile, [MIS Hours].Employee
FROM [MIS Hours]
WHERE ((([MIS Hours].General)="OV Owed Vacation") AND (([MIS Hours].Date)>=#1/1/2000#));