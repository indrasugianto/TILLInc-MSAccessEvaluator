SELECT [MIS Hours].Date AS MISHoursDate, [MIS Hours].ADPFile AS FileNo, Sum([MIS Hours].Hours) AS SumOfHours, [Date]+10 AS PayrollDate
FROM [MIS Hours]
GROUP BY [MIS Hours].Date, [MIS Hours].ADPFile, [Date]+10
ORDER BY [MIS Hours].Date DESC;