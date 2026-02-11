SELECT DISTINCTROW [>Settings].YDrawingAidCode AS Expr1, [>Settings].YDrawingAid AS Expr2
FROM [>Settings]
WHERE ((([>Settings].YDrawingAidCode)=1 Or ([>Settings].YDrawingAidCode)=2 Or ([>Settings].YDrawingAidCode)=3 Or ([>Settings].YDrawingAidCode)=4 Or ([>Settings].YDrawingAidCode)=5 Or ([>Settings].YDrawingAidCode)=6))
ORDER BY [>Settings].YDrawingAidCode;