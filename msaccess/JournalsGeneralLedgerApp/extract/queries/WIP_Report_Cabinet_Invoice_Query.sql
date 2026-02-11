SELECT [WIP Report Cabinet Job Query].ID, [WIP Report Cabinet Job Query].Key, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount
FROM [WIP Report Cabinet Job Query] INNER JOIN [Sales Journal] ON [WIP Report Cabinet Job Query].Key=[Sales Journal].Job
WHERE (((InStr([Sales Journal].Category,"Cabinet")<>0)=True))
GROUP BY [WIP Report Cabinet Job Query].ID, [WIP Report Cabinet Job Query].Key
ORDER BY [WIP Report Cabinet Job Query].ID;