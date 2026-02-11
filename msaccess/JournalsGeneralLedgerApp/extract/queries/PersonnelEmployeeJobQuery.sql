SELECT [MIS Personnel].Text2
FROM [MIS Personnel]
GROUP BY [MIS Personnel].Text2, [MIS Personnel].Text2
HAVING ((([MIS Personnel].Text2)<>""));