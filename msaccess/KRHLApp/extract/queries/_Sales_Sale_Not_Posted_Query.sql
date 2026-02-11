SELECT DISTINCTROW [Sales Journal].*, [>Jobs].ID, [MIS Personnel].Employee, [>Resources].ID, [>Jobs].ManagedBy, [>Jobs].SpecifiedBy
FROM (([Sales Journal] LEFT JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key) LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key) LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key
WHERE ((([Sales Journal].TheDate) Is Not Null) AND (([Sales Journal].Posted)=False) AND (([Sales Journal].SaleAmount)<>0))
ORDER BY [>Jobs].ID, [Sales Journal].TheDate;