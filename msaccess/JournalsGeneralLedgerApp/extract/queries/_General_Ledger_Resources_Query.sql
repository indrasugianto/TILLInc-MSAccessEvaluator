SELECT DISTINCTROW [>Resources].ID, [>Resources].Category, [>Resources].Key
FROM [>General Ledger Query] INNER JOIN [>Resources] ON [>General Ledger Query].SourceOperative=[>Resources].Key
ORDER BY [>Resources].Category, [>Resources].ID;