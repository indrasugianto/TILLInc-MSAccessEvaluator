SELECT DISTINCTROW [Purchase Journal].*, [MIS Accounts].Account
FROM [Purchase Journal] LEFT JOIN [MIS Accounts] ON [Purchase Journal].AccountNo=[MIS Accounts].Number
ORDER BY [Purchase Journal].Due, [Purchase Journal].CheckNumber, [Purchase Journal].InvoiceDate, [Purchase Journal].SupplierID, [Purchase Journal].InvoiceNo;