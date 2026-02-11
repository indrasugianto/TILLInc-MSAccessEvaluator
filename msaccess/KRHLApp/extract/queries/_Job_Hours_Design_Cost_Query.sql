SELECT DISTINCTROW [>Jobs].Key, [>Jobs].ID, Sum([MIS Hours].Cost) AS SumOfCost, Sum([MIS Hours].Hours) AS SumOfHours, [MIS Hours].Activity
FROM [>Jobs] LEFT JOIN [MIS Hours] ON [>Jobs].Key=[MIS Hours].[Job ID]
WHERE (((InStr([Activity],"DN") Or InStr([Activity],"DR") Or InStr([Activity],"PA"))<>0))
GROUP BY [>Jobs].Key, [>Jobs].ID, [MIS Hours].Activity
WITH OWNERACCESS OPTION;