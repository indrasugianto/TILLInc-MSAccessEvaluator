SELECT Year([>estimates all query]!Due) AS Expr1, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount
FROM [>Estimates All Query] LEFT JOIN [Sales Journal] ON [>Estimates All Query].Key=[Sales Journal].Job
GROUP BY Year([>estimates all query]!Due);