SELECT [>Jobs].Info2, Count([>Jobs].ID) AS CountOfID, First([>Jobs].ID) AS FirstOfID
FROM [>Jobs]
GROUP BY [>Jobs].Info2
HAVING ((([>Jobs].Info2) Is Not Null))
ORDER BY [>Jobs].Info2;