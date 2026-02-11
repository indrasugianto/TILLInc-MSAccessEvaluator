SELECT Year([TransactionDate]) AS Expr1
FROM [General Ledger]
GROUP BY Year([TransactionDate])
ORDER BY Year([TransactionDate]) DESC;