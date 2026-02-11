SELECT DISTINCTROW [>Jobs].memo
FROM [>Jobs]
WHERE ((([>Jobs].Key)=Forms!Sales.JobName))
ORDER BY [>Jobs].memo;