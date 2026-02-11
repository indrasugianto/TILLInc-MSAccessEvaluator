SELECT [MIS Personnel].*, [MIS Personnel].Closed
FROM [MIS Personnel]
WHERE ((([MIS Personnel].Closed)=False) AND (([MIS Personnel].Employee) Is Not Null))
ORDER BY [MIS Personnel].Employee;