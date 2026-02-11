SELECT [Receipts Journal].CheckDate, [Receipts Journal].Description, [Receipts Journal].Amount
FROM [Receipts Journal]
GROUP BY [Receipts Journal].CheckDate, [Receipts Journal].Description, [Receipts Journal].Amount, [Receipts Journal].Job
HAVING ((([Receipts Journal].Job)=Forms!Sales!theJobName))
ORDER BY [Receipts Journal].CheckDate;