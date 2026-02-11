SELECT [Receivables date].TheDate, Sum([Receivables by day].Receivables) AS SumOfReceivables
FROM [Receivables by day], [Receivables date]
WHERE (((IIf([transactiondate]<=[TheDate],True,False))=True))
GROUP BY [Receivables date].TheDate
HAVING ((([Receivables date].TheDate)>=Forms!GeneralLedger.fromdate And ([Receivables date].TheDate)<=forms!generalledger.todate))
ORDER BY [Receivables date].TheDate DESC;