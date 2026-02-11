SELECT DISTINCTROW [WIP Report Install Job Query].ID, Sum([MIS Hours].Hours) AS SumOfHours, Sum([MIS Hours].Cost) AS SumOfCost, Min([MIS Hours].Date) AS MinOfDate, Max([MIS Hours].Date) AS MaxOfDate
FROM [WIP Report Install Job Query] INNER JOIN [MIS Hours] ON [WIP Report Install Job Query].Key=[MIS Hours].[Job ID]
WHERE ((([MIS Hours].Date)<=Forms!GeneralLedger!ToDate) And ((InStr([Charge],"Install")<>0)=True))
GROUP BY [WIP Report Install Job Query].ID
HAVING (((Sum([MIS Hours].Cost))>100))
ORDER BY [WIP Report Install Job Query].ID;