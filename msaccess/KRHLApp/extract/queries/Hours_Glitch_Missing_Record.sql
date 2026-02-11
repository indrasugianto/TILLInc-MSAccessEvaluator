SELECT [MIS Hours1].*, *
FROM [MIS Hours], [MIS Hours1], [MIS Personnel]
WHERE ((([MIS Hours1].Cost)<>0) And (([MIS Hours].Key) Is Null))
ORDER BY [MIS Hours1].Date DESC , [MIS Personnel].Employee DESC;