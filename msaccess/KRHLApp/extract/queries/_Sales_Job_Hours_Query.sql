SELECT Sum([MIS Hours].Hours) AS SumOfHours, [MIS Hours].Employee, Min([>Resources].TheName) AS MinOfTheName, Sum([MIS Hours].Saturday) AS SumOfSaturday, Sum([MIS Hours].Cost) AS SumOfCost
FROM ([MIS Hours] LEFT JOIN [MIS Personnel] ON [MIS Hours].Employee=[MIS Personnel].Employee) LEFT JOIN [>Resources] ON [MIS Personnel].Resource=[>Resources].Key
GROUP BY [MIS Hours].Employee, [MIS Hours].[Job ID]
HAVING ((([MIS Hours].[Job ID])=Forms!Sales!JobName))
ORDER BY Sum([MIS Hours].Hours) DESC , [MIS Hours].Employee;