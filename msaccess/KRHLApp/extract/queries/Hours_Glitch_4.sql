SELECT [MIS Hours].*, [MIS Personnel].Employee, *
FROM [MIS Hours] INNER JOIN [MIS Personnel] ON [MIS Hours].ADPFile=[MIS Personnel].ADPFile
WHERE ((([MIS Personnel].Employee)="Monkevich") AND (([MIS Hours].Date)=#12/19/2011#))
ORDER BY [MIS Hours].Date DESC;