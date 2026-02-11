SELECT DISTINCTROW [>Resources].Key, [>Resources].ID, Sum([Job Agreement Sales NIC Stone].SumOfSaleAmount) AS SumOfSumOfSaleAmount
FROM [>Resources] LEFT JOIN ([>Jobs] LEFT JOIN [Job Agreement Sales NIC Stone] ON [>Jobs].Key=[Job Agreement Sales NIC Stone].Key) ON [>Resources].Key=[>Jobs].Contractor
WHERE ((([>Jobs].Estimate)=False))
GROUP BY [>Resources].Key, [>Resources].ID;