SELECT DISTINCTROW [>Settings].Phase, [>Settings].PhaseSort
FROM [>Settings]
GROUP BY [>Settings].Phase, [>Settings].PhaseSort
HAVING ((([>Settings].Phase) Is Not Null) AND (([>Settings].PhaseSort) Is Not Null))
ORDER BY [>Settings].PhaseSort
WITH OWNERACCESS OPTION;