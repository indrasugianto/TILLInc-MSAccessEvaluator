SELECT DISTINCTROW [MIS Hours].ADPHoursCode
FROM [MIS Hours]
GROUP BY [MIS Hours].ADPHoursCode
HAVING ((([MIS Hours].ADPHoursCode) Is Not Null))
ORDER BY [MIS Hours].ADPHoursCode;