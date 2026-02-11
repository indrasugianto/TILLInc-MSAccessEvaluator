SELECT DISTINCTROW [Purchase Journal].*, [MIS Accounts].Account
FROM [Purchase Journal] LEFT JOIN [MIS Accounts] ON [Purchase Journal].AccountNo=[MIS Accounts].Number
WHERE ((([Purchase Journal].Paid)<>False) And (([Purchase Journal].PayablesAccount)=Forms!APChecksEntry!PayableAccount))
ORDER BY [Purchase Journal].InvoiceDate DESC , [Purchase Journal].CheckNumber DESC , [Purchase Journal].InvoiceNo;