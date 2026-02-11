SELECT [MIS Hours].*, *
FROM [MIS Hours]
WHERE ((([MIS Hours].JobHour)=True) AND (([MIS Hours].Activity) Is Null))
ORDER BY [MIS Hours].Date DESC;