SELECT DISTINCTROW [MIS Personnel].Text1
FROM [MIS Personnel]
WHERE ((([MIS Personnel].Closed)=False) AND (([MIS Personnel].Text2)="Engineer" Or ([MIS Personnel].Text2)="Project Manager"))
ORDER BY [MIS Personnel].Text1
WITH OWNERACCESS OPTION;