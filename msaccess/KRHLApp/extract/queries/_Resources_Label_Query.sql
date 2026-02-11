SELECT DISTINCTROW [>Errors].Form, [>Errors].Error
FROM [>Errors]
WHERE ((([>Errors].Form) Is Not Null))
ORDER BY [>Errors].Form;