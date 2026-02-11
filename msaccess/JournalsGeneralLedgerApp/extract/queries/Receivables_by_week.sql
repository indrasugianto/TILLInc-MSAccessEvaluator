SELECT [MIS Hours Date].TheDate, Sum([Receivables by day].Receivables) AS SumOfReceivables
FROM [Receivables by day], [MIS Hours Date]
WHERE (((IIf([transactiondate]<=[TheDate],True,False))=True))
GROUP BY [MIS Hours Date].TheDate
HAVING ((([MIS Hours Date].TheDate)>=Forms!GeneralLedger.fromdate And ([MIS Hours Date].TheDate)<=forms!generalledger.todate))
ORDER BY [MIS Hours Date].TheDate DESC;