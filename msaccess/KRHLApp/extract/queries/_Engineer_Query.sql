SELECT DISTINCTROW [MIS Personnel].Employee, [MIS Personnel].Key, [MIS Personnel].Text2
FROM [MIS Personnel]
WHERE ((([MIS Personnel].Text2)="Engineer" Or ([MIS Personnel].Text2)="Project Manager"))
ORDER BY [MIS Personnel].Employee;