SELECT DISTINCTROW [>Product List Note All Query].ID, Count([>Product List Note All Query].ID) AS CountOfID
FROM [>Product List Note All Query]
GROUP BY [>Product List Note All Query].ID
WITH OWNERACCESS OPTION;