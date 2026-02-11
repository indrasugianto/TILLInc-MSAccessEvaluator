SELECT DISTINCTROW [>Jobs].Key, [>Jobs].ID, Sum([Receipts Journal].Amount) AS SumOfAmount
FROM [>Jobs] LEFT JOIN [Receipts Journal] ON [>Jobs].Key=[Receipts Journal].Job
GROUP BY [>Jobs].Key, [>Jobs].ID
WITH OWNERACCESS OPTION;