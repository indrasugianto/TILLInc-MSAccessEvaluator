SELECT DISTINCTROW [WIP Report Install Job Query].ID, [WIP Report Install Job Query].Key, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount
FROM [WIP Report Install Job Query] INNER JOIN [Sales Journal] ON [WIP Report Install Job Query].Key=[Sales Journal].Job
WHERE ((([Sales Journal].TheDate)<=Forms!GeneralLedger!ToDate) And ((InStr([Sales Journal]!Category,"Install")<>0)=True))
GROUP BY [WIP Report Install Job Query].ID, [WIP Report Install Job Query].Key
ORDER BY [WIP Report Install Job Query].ID;