SELECT Year([>estimates closed query]!Due) AS Expr1, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount
FROM [>Estimates Closed Query] LEFT JOIN [Sales Journal] ON [>Estimates Closed Query].Key=[Sales Journal].Job
GROUP BY Year([>estimates closed query]!Due);