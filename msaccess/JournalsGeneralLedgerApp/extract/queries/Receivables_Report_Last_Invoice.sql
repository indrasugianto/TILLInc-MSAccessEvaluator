SELECT [>Jobs].ID AS JobName, [Due] & " " & [Description] AS LastInvoice, [>Jobs].Key AS JobKey
FROM [Sales Journal Max of Key] LEFT JOIN ([Sales Journal] LEFT JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key) ON [Sales Journal Max of Key].MaxOfKey=[Sales Journal].Key
WHERE ((([>Jobs].Closed)=False))
GROUP BY [>Jobs].ID, [Due] & " " & [Description], [>Jobs].Key
HAVING ((([Due] & " " & [Description]) Is Not Null));