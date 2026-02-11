SELECT DISTINCTROW [MIS Hours].*
FROM [MIS Hours]
WHERE ((([MIS Hours].Date)>=Localvariable("Form_Hours_DateSort") And ([MIS Hours].Date)<=Localvariable("Form_Hours_ToDate")));