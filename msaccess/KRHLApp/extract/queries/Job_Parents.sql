SELECT DISTINCTROW [>Jobs].Key, [>Jobs].ID
FROM [>Jobs]
WHERE ((([>Jobs].Key)<>Forms!Sales!Jobname) And (([>Jobs].Family)=True))
ORDER BY [>Jobs].ID;