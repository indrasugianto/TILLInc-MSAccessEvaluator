SELECT DISTINCTROW [>Resources].Key, Sum([Job Agreement Sales NIC Stone].SumOfSaleAmount) AS SumOfSumOfSaleAmount
FROM [>Resources] LEFT JOIN ([>Jobs] LEFT JOIN [Job Agreement Sales NIC Stone] ON [>Jobs].Key=[Job Agreement Sales NIC Stone].Key) ON [>Resources].Key=[>Jobs].DesignedBy
WHERE ((([>Jobs].Estimate)=False))
GROUP BY [>Resources].Key
ORDER BY [>Resources].Key;