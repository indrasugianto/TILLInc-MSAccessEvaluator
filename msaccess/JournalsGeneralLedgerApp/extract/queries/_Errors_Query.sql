SELECT DISTINCTROW [>Errors].Error, [>Errors].Form, [>Errors].Time
FROM [>Errors]
WHERE ((([>Errors].Error) Is Not Null))
ORDER BY [>Errors].Time;