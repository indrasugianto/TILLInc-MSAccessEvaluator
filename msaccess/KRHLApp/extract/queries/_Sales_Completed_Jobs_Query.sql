SELECT [>Jobs].Key, Max([Sales Journal].TheDate) AS MaxOfTheDate, [>Sales Total].SumOfSaleAmount
FROM ([>Jobs] LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job) LEFT JOIN [>Sales Total] ON [>Jobs].Key=[>Sales Total].Job
WHERE (((InStr([Sales Journal]!Category,"Install"))<>0))
GROUP BY [>Jobs].Key, [>Sales Total].SumOfSaleAmount
HAVING (((Max([Sales Journal].TheDate))>=#1/1/1996#))
ORDER BY Max([Sales Journal].TheDate);