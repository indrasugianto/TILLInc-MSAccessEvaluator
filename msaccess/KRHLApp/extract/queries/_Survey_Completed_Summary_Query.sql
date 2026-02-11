SELECT [>Jobs].ID, [>Jobs].Key, [Sales Journal].TheDate, [Sales Journal].SaleAmount, [MIS Personnel].Employee
FROM ([>Jobs] LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job) LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key
WHERE ((([Sales Journal].TheDate)<=forms!BonusPlan.Currently) And ((Year([TheDate]))=forms!BonusPlan.GoalYear))
ORDER BY [Sales Journal].TheDate DESC;