SELECT DISTINCTROW [>Jobs].Key, [>Jobs].ID, Sum([MIS Hours].Cost) AS SumOfCost, Sum([MIS Hours].Hours) AS SumOfHours
FROM [>Jobs] LEFT JOIN [MIS Hours] ON [>Jobs].Key=[MIS Hours].[Job ID]
GROUP BY [>Jobs].Key, [>Jobs].ID
WITH OWNERACCESS OPTION;