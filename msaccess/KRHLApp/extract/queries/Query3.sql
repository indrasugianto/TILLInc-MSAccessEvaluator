SELECT [MIS Hours].Hours, nnez([Monday])+nnez([Tuesday])+nnez([Wednesday])+nnez([Thursday])+nnez([Friday])+nnez([Saturday])+nnez([Sunday]) AS Expr1, *
FROM [MIS Hours]
WHERE ((((nnez([Monday])+nnez([Tuesday])+nnez([Wednesday])+nnez([Thursday])+nnez([Friday])+nnez([Saturday])+nnez([Sunday]))<>[Hours])=True))
ORDER BY [MIS Hours].Date DESC;