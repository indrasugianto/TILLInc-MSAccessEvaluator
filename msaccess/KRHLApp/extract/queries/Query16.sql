SELECT Sum([>Part List].ProcessActivityCost) AS SumOfProcessActivityCost, Sum([>Part List].ProcessCost) AS SumOfProcessCost, [>Part List].DisplayPart
FROM [>Part List]
GROUP BY [>Part List].DisplayPart;