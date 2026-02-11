SELECT DISTINCTROW [>Settings].XDrawingAidCode AS Expr1, [>Settings].XDrawingAid AS Expr2
FROM [>Settings]
WHERE ((([>Settings].XDrawingAidCode)=3 Or ([>Settings].XDrawingAidCode)=4 Or ([>Settings].XDrawingAidCode)=7 Or ([>Settings].XDrawingAidCode)=10 Or ([>Settings].XDrawingAidCode)=11))
ORDER BY [>Settings].XDrawingAidCode;