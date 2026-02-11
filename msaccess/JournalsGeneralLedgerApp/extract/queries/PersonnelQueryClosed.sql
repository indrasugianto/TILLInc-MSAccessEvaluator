SELECT [MIS Personnel].*, [MIS Personnel].Closed
FROM [MIS Personnel]
WHERE ((([MIS Personnel].Closed)=True) AND (([MIS Personnel].Employee) Is Not Null) AND (([MIS Personnel].ADPFile)>5))
ORDER BY [MIS Personnel].Employee;