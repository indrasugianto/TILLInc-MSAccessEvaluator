SELECT [MIS Hours].Employee
FROM [MIS Hours] INNER JOIN [MIS Personnel] ON [MIS Hours].Employee=[MIS Personnel].Employee
GROUP BY [MIS Hours].Employee, [MIS Personnel].ADPFile, [MIS Personnel].Closed
HAVING ((([MIS Personnel].Closed)=forms!Hours!ViewArchived))
ORDER BY [MIS Hours].Employee;