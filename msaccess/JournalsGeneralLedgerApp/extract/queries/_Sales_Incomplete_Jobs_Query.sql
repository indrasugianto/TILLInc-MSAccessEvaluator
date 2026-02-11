SELECT [>Jobs].Key
FROM [>Jobs] LEFT JOIN [Sales Journal] ON [>Jobs].Key=[Sales Journal].Job
WHERE (((InStr([Sales Journal]!Category,"Install"))=0))
GROUP BY [>Jobs].Key
HAVING (((Max([Sales Journal].TheDate))>=#1/1/2000#))
ORDER BY Max([Sales Journal].TheDate);