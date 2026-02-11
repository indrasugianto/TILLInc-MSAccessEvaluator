SELECT [>Resources].ID, [Cash Disbursements Journal].*
FROM [Cash Disbursements Journal] INNER JOIN [>Resources] ON [Cash Disbursements Journal].SupplierID=[>Resources].Key
WHERE ((([Cash Disbursements Journal].Void)=True))
ORDER BY [Cash Disbursements Journal].CheckDate DESC;