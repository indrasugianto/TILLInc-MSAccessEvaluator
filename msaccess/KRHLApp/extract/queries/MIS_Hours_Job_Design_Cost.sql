SELECT [MIS Hours].[Job ID], Sum([MIS Hours].Cost) AS SumOfCost
FROM [MIS Hours]
WHERE (((InStr([activity],"Design"))<>0))
GROUP BY [MIS Hours].[Job ID]
ORDER BY [MIS Hours].[Job ID];