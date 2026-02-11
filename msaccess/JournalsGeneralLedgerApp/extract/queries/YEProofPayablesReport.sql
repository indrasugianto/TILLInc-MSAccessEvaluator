SELECT DISTINCTROW Sum([Purchase Journal].DebitAmount) AS PayablesReport, 1 AS Sort
FROM [Purchase Journal]
WHERE (((IIf([PayablesAccount]=201 And [EntryDate]<=Forms!GeneralLedger.ToDate And [checkdate]>Forms!GeneralLedger.ToDate Or [PayablesAccount]=201 And [EntryDate]<=Forms!GeneralLedger.ToDate And [Paid]=False,True,False))=True))
GROUP BY [Purchase Journal].Void, [Purchase Journal].Posted
HAVING ((([Purchase Journal].Void)=False) AND (([Purchase Journal].Posted)=True));