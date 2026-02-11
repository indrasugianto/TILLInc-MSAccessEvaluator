SELECT [MIS Hours].ADPFile, [MIS Personnel].Employee
FROM [MIS Hours] INNER JOIN [MIS Personnel] ON [MIS Hours].Employee=[MIS Personnel].Employee
GROUP BY [MIS Hours].ADPFile, [MIS Personnel].Employee
HAVING ((([MIS Hours].ADPFile)<>0))
ORDER BY [MIS Hours].ADPFile;