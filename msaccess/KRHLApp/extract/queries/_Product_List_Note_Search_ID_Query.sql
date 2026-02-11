SELECT DISTINCTROW [>Product List Note View Match Query].ID, Count(IIf(IsNull([ID]),"",[ID])) AS [Count]
FROM [>Product List Note View Match Query]
GROUP BY [>Product List Note View Match Query].ID
ORDER BY [>Product List Note View Match Query].ID
WITH OWNERACCESS OPTION;