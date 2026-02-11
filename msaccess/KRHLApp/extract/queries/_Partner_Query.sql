SELECT DISTINCTROW [MIS Personnel].Employee, [MIS Personnel].Key, [MIS Personnel].Text2
FROM [MIS Personnel]
WHERE ((([MIS Personnel].Text2)="Partner"))
ORDER BY [MIS Personnel].Employee;