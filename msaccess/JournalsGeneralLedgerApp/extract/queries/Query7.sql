SELECT [Purchase Journal].*, [Purchase Journal].Key, [>Resources].ID
FROM [Purchase Journal] INNER JOIN [>Resources] ON [Purchase Journal].SupplierID = [>Resources].Key
WHERE ((([Purchase Journal].Key)=13388));