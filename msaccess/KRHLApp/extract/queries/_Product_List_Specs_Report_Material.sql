SELECT DISTINCTROW [>Material].Description, [>Material].SpecReportText AS Expr1, [>Material].Key, [>Material].Category
FROM [>Material]
WHERE ((([>Material].SpecReportText) Is Not Null))
ORDER BY [>Material].Description;