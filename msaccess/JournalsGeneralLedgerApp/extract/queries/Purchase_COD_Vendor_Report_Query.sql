SELECT DISTINCTROW [>Resources].Category, [>Resources].ID, [Purchase Journal].InvoiceDate, [Purchase Journal].DebitAmount, [Purchase Journal].PayablesAccount, [Purchase Journal].InvoiceNo, IIf([Paid],"Paid","Open") AS Status
FROM [Purchase Journal] LEFT JOIN [>Resources] ON [Purchase Journal].SupplierID=[>Resources].Key
WHERE ((([>Resources].Key)=Forms!purchasejournalentryCOD!supplier) And (([Purchase Journal].Void)=False) And (([Purchase Journal].Posted)=True))
ORDER BY [Purchase Journal].InvoiceDate DESC , [Purchase Journal].Paid DESC , [Purchase Journal].InvoiceNo;