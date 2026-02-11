SELECT DISTINCTROW [>Resources].Key, [>Resources].ID, Sum([Job Agreement Sales NIC Stone].SumOfSaleAmount) AS SumOfSumOfSaleAmount
FROM ([>Resources] LEFT JOIN [>Jobs] ON [>Resources].Key=[>Jobs].Architect) LEFT JOIN [Job Agreement Sales NIC Stone] ON [>Jobs].Key=[Job Agreement Sales NIC Stone].Key
WHERE ((([>Jobs].Estimate)=False))
GROUP BY [>Resources].Key, [>Resources].ID;