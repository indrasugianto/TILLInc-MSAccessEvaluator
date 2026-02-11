SELECT DISTINCTROW [>Settings].XDrawingAidCode AS Expr1, [>Settings].XDrawingAid AS Expr2
FROM [>Settings]
WHERE ((([>Settings].XDrawingAidCode)=1 Or ([>Settings].XDrawingAidCode)=2 Or ([>Settings].XDrawingAidCode)=2.1 Or ([>Settings].XDrawingAidCode)=7 Or ([>Settings].XDrawingAidCode)=10 Or ([>Settings].XDrawingAidCode)=11 Or ([>Settings].XDrawingAidCode)=12))
ORDER BY [>Settings].XDrawingAidCode;