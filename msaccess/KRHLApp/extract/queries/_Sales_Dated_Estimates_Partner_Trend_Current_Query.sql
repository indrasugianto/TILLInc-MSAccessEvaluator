SELECT DISTINCTROW [mis personnel].Text1 & " " & [>Jobs].Info2 AS Info2, Sum([Sales Journal].SaleAmount) AS SumOfSaleAmount, [MIS Personnel].Employee
FROM (([>Estimates Open Query] LEFT JOIN ([Sales Journal] LEFT JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key) ON [>Estimates Open Query].Key=[Sales Journal].Job) LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key) LEFT JOIN [MIS Personnel] AS [MIS Personnel_1] ON [>Jobs].SpecifiedBy=[MIS Personnel_1].Key
WHERE (((IIf(Forms!Sales!SelectPartnerManager,IIf([MIS Personnel].Key=Forms!Sales!PartnerManagerSelection Or [MIS Personnel_1].Key=Forms!Sales!PartnerManagerSelection,True,False),True))=True))
GROUP BY [mis personnel].Text1 & " " & [>Jobs].Info2, [MIS Personnel].Employee, [MIS Personnel].Text1, [MIS Personnel].Text2
HAVING ((([MIS Personnel].Text2)="Partner"))
ORDER BY [MIS Personnel].Text1, Sum([Sales Journal].SaleAmount) DESC;