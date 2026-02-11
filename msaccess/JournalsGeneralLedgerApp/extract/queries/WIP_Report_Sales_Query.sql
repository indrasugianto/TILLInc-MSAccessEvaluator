SELECT DISTINCTROW [WIP Report Cabinet Job Query].ID, [WIP Report Cabinet Job Query].Key, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount, Min([Sales Journal].TheDate) AS MinOfTheDate, Max([Sales Journal].TheDate) AS MaxOfTheDate
FROM [WIP Report Cabinet Job Query] INNER JOIN [Sales Journal] ON [WIP Report Cabinet Job Query].Key=[Sales Journal].Job
WHERE ((([Sales Journal].TheDate)<=Forms!GeneralLedger!ToDate) And ((InStr([Sales Journal]!Category,"Cabinet")<>0 And InStr([Sales Journal]!Category,"Additional")=0)=True))
GROUP BY [WIP Report Cabinet Job Query].ID, [WIP Report Cabinet Job Query].Key
ORDER BY [WIP Report Cabinet Job Query].ID;