SELECT [>Products].ID, [>Parts].Process1Alternate, *
FROM [>Parts] LEFT JOIN [>Products] ON [>Parts].Part=[>Products].Key
WHERE ((([>Parts].Process1Alternate) Is Not Null));