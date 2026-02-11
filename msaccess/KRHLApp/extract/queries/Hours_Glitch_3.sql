SELECT [MIS Hours].*, *
FROM [MIS Hours]
WHERE ((([MIS Hours].GeneralHour)=True) AND (([MIS Hours].General) Is Null))
ORDER BY [MIS Hours].Date DESC;