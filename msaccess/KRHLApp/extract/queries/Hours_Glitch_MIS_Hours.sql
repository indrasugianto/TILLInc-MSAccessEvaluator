SELECT [MIS Hours].*, [MIS Hours].Date, [MIS Personnel].Employee, *
FROM [MIS Hours] LEFT JOIN [MIS Personnel] ON [MIS Hours].ADPFile=[MIS Personnel].ADPFile
ORDER BY [MIS Hours].Date DESC , [MIS Personnel].Employee DESC;