SELECT [Receivables date].TheDate, Sum([Receivables by day].CreditAmount) AS SumOfCreditAmount1
FROM [Receivables date] LEFT JOIN [Receivables by day] ON [Receivables date].TheDate=[Receivables by day].TransactionDate
WHERE (((IIf([transactiondate]<=[TheDate] And [creditamount]<>0,True,False))=True))
GROUP BY [Receivables date].TheDate
HAVING ((([Receivables date].TheDate)>=Forms!GeneralLedger.fromdate And ([Receivables date].TheDate)<=forms!generalledger.todate))
ORDER BY [Receivables date].TheDate DESC;