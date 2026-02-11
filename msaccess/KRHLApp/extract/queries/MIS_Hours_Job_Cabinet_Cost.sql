SELECT [MIS Hours].[Job ID], Sum([MIS Hours].Cost) AS SumOfCost
FROM [MIS Hours]
WHERE (((InStr([Charge],"Cabinet"))<>0) AND ((InStr([Activity],"Design"))=0))
GROUP BY [MIS Hours].[Job ID]
ORDER BY [MIS Hours].[Job ID];