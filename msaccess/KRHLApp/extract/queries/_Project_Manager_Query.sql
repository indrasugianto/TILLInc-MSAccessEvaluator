SELECT DISTINCTROW [MIS Personnel].Employee, [MIS Personnel].Key, [MIS Personnel].Text1
FROM [MIS Personnel]
WHERE ((([MIS Personnel].Text2)="Project Manager" Or ([MIS Personnel].Text2)="Partner"))
ORDER BY [MIS Personnel].Text2 DESC , [MIS Personnel].Employee;