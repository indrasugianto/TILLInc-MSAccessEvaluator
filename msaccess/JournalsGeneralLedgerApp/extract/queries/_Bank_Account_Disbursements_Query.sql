SELECT DISTINCTROW [Cash Disbursements Journal].*, [>Resources].ID
FROM [Cash Disbursements Journal] LEFT JOIN [>Resources] ON [Cash Disbursements Journal].SupplierID=[>Resources].Key
ORDER BY [Cash Disbursements Journal].Closed DESC , [Cash Disbursements Journal].CheckDate DESC , [Cash Disbursements Journal].CheckNumber DESC , [>Resources].ID DESC;