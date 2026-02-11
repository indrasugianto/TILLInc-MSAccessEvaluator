SELECT DISTINCTROW [>Settings].ZDrawingAidCode AS Expr1, [>Settings].ZDrawingAid AS Expr2
FROM [>Settings]
WHERE ((([>Settings].ZDrawingAidCode)=1 Or ([>Settings].ZDrawingAidCode)=2 Or ([>Settings].ZDrawingAidCode)=10))
ORDER BY [>Settings].ZDrawingAidCode;