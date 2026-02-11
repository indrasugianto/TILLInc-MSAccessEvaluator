SELECT DISTINCTROW [>Settings].YDrawingAidCode AS Expr1, [>Settings].YDrawingAid AS Expr2
FROM [>Settings]
WHERE ((([>Settings].YDrawingAidCode)=1 Or ([>Settings].YDrawingAidCode)=2))
ORDER BY [>Settings].YDrawingAidCode;