SELECT DISTINCTROW [>Settings].ZDrawingAidCode AS Expr1, [>Settings].ZDrawingAid AS Expr2
FROM [>Settings]
WHERE ((([>Settings].ZDrawingAidCode)=3 Or ([>Settings].ZDrawingAidCode)=4 Or ([>Settings].ZDrawingAidCode)=5))
ORDER BY [>Settings].ZDrawingAidCode;