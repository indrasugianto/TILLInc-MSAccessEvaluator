SELECT [Purchase Journal].InvoiceDate, [Account] & " " & [Description] AS SourceTransaction, [Purchase Journal].DebitAmount
FROM [Purchase Journal] INNER JOIN [MIS Accounts] ON [Purchase Journal].AccountNo=[MIS Accounts].Number
GROUP BY [Purchase Journal].InvoiceDate, [Account] & " " & [Description], [Purchase Journal].DebitAmount, [Purchase Journal].Job
HAVING ((([Purchase Journal].InvoiceDate)>=Forms!Sales!FromDate And ([Purchase Journal].InvoiceDate)<=Forms!Sales!toDate) And (([Purchase Journal].Job)=Forms!Sales!JobName))
ORDER BY [Purchase Journal].InvoiceDate;