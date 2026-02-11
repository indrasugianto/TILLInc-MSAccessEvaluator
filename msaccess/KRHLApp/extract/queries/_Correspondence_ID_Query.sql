SELECT DISTINCTROW [>Correspondence].ID, [>Correspondence].Name
FROM [>Correspondence]
GROUP BY [>Correspondence].ID, [>Correspondence].Name
HAVING ((([>Correspondence].Name)=NNEZ(Forms!Correspondence.Category) And ([>Correspondence].Name)<>0))
ORDER BY [>Correspondence].ID;