SELECT DISTINCTROW [MIS Personnel].Text1, [MIS Personnel].Key
FROM [MIS Personnel]
WHERE ((([MIS Personnel].Text2)="Project Manager" Or ([MIS Personnel].Text2)="Partner"))
ORDER BY [MIS Personnel].Text2 DESC , [MIS Personnel].Text1
WITH OWNERACCESS OPTION;