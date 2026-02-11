SELECT DISTINCTROW [MIS Personnel].ADPName AS Employee, [MIS Personnel].ADPNetAccount AS Account, [MIS Personnel].ADPFile AS File, [MIS Personnel].TerminationDate AS Terminated
FROM [MIS Personnel]
WHERE ((([MIS Personnel].ADPFile)>3))
ORDER BY [MIS Personnel].Closed DESC , [MIS Personnel].ADPName;