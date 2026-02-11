SELECT DISTINCTROW ADP.*, [MIS Personnel].ADPName
FROM ADP, [MIS Personnel]
ORDER BY ADP.CheckDate DESC , ADP.CheckNumber DESC , [MIS Personnel].ADPName;