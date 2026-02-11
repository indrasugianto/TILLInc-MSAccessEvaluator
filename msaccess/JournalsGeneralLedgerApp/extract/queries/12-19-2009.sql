SELECT [Purchase Journal].Paid, [Purchase Journal].TotalAmount, [Purchase Journal].DebitAmount, [Purchase Journal].InvoiceDate, [Cash Disbursements Journal].CheckDate, [Purchase Journal].CheckDate, [Cash Disbursements Journal].CheckNumber, [Purchase Journal].CheckNumber
FROM [Cash Disbursements Journal] INNER JOIN [Purchase Journal] ON [Cash Disbursements Journal].Key=[Purchase Journal].CheckKey
WHERE ((([Purchase Journal].CheckDate) Is Null))
ORDER BY [Purchase Journal].TotalAmount DESC;