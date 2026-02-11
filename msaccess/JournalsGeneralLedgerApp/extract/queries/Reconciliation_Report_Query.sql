SELECT DISTINCTROW [Cash Disbursements Journal].*, [>Resources].ID
FROM [Cash Disbursements Journal] LEFT JOIN [>Resources] ON [Cash Disbursements Journal].SupplierID=[>Resources].Key
WHERE ((([Cash Disbursements Journal].Void)=False) AND (([Cash Disbursements Journal].DebitAmount)<>0));