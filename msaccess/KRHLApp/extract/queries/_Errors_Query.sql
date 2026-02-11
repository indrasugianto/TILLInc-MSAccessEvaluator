SELECT DISTINCTROW [>Errors].Error, [>Errors].Time
FROM [>Errors]
WHERE ((([>Errors].Error) Is Not Null) AND (([>Errors].Time) Is Not Null))
ORDER BY [>Errors].Time;