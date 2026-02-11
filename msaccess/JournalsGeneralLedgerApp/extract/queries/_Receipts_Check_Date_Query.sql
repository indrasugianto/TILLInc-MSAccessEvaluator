SELECT DISTINCTROW [Receipts Journal].CheckDate
FROM [Receipts Journal]
GROUP BY [Receipts Journal].CheckDate
ORDER BY [Receipts Journal].CheckDate DESC;