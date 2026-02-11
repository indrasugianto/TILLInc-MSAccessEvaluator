SELECT [WIP Report Job Query].ID, [WIP Report Job Query].Key, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount
FROM [WIP Report Job Query] INNER JOIN [Sales Journal] ON [WIP Report Job Query].Key=[Sales Journal].Job
WHERE (((InStr([Sales Journal].Category,"Cabinet")<>0 Or InStr([Sales Journal].Category,"Install")<>0)=True) And ((InStr([Sales Journal].Category,"Additional")=0)=True))
GROUP BY [WIP Report Job Query].ID, [WIP Report Job Query].Key
ORDER BY [WIP Report Job Query].ID;