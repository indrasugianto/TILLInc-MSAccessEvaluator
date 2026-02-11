SELECT Sum([Purchase Journal].DebitAmount) AS SumOfDebitAmount
FROM [Purchase Journal] LEFT JOIN [MIS Accounts] ON [Purchase Journal].AccountNo=[MIS Accounts].Number
WHERE ((([Purchase Journal].InvoiceDate)>=Forms!Sales!FromDate And ([Purchase Journal].InvoiceDate)<=Forms!Sales!toDate) And (([Purchase Journal].Job)=Forms!Sales!JobName));