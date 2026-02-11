SELECT [MIS Hours].*, *
FROM [MIS Hours]
WHERE ((([MIS Hours].JobHour)=True) AND (([MIS Hours].[Job ID]) Is Null Or ([MIS Hours].[Job ID])=0))
ORDER BY [MIS Hours].Date DESC;