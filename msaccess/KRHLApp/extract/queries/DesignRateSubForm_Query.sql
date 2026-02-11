SELECT [MIS Personnel].Employee, [MIS Personnel].DesignRate, [MIS Personnel].TerminationDate
FROM [MIS Personnel]
WHERE ((([MIS Personnel].TerminationDate) Is Null) AND ((InStr([Text2],"Partner")<>0 Or InStr([Text2],"Project")<>0 Or InStr([Text2],"Engineer")<>0)=True) AND (([MIS Personnel].Closed)=False))
ORDER BY [MIS Personnel].Employee;