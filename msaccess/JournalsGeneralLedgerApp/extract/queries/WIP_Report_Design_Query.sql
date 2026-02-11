SELECT DISTINCTROW [WIP Report Cabinet Job Query].ID, Sum([MIS Hours].Hours) AS SumOfHours, Sum([MIS Hours].Cost) AS SumOfCost
FROM [WIP Report Cabinet Job Query] INNER JOIN [MIS Hours] ON [WIP Report Cabinet Job Query].Key=[MIS Hours].[Job ID]
WHERE ((([MIS Hours].Charge)="Project") And (([MIS Hours].Date)<=Forms!GeneralLedger!ToDate))
GROUP BY [WIP Report Cabinet Job Query].ID
HAVING (((Sum([MIS Hours].Cost))>100))
ORDER BY [WIP Report Cabinet Job Query].ID;