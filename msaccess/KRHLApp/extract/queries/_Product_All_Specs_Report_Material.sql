SELECT DISTINCTROW [>Material].Key, [>Material].Category, [>Material].Description, [>Material].SpecReportText AS Expr1
FROM [>Material]
WHERE ((([>Material].Description) Is Not Null) And (([>Material].SpecReportText) Is Not Null));