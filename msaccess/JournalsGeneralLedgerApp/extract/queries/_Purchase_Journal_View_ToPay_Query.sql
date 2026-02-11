SELECT DISTINCTROW [Purchase Journal].*, [MIS Accounts].Account
FROM [Purchase Journal] LEFT JOIN [MIS Accounts] ON [Purchase Journal].AccountNo=[MIS Accounts].Number
WHERE ((([Purchase Journal].Paid)=False) AND (([Purchase Journal].PayablesAccount)=201))
ORDER BY [Purchase Journal].Due, [Purchase Journal].InvoiceNo;