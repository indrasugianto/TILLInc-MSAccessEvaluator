SELECT DISTINCTROW [Purchase Journal].*
FROM [Purchase Journal]
WHERE ((([Purchase Journal].Posted)=No) And (([Purchase Journal].SupplierID)=Forms!PurchaseJournalEntryLoans!Supplier))
ORDER BY [Purchase Journal].Posted DESC , [Purchase Journal].InvoiceDate, [Purchase Journal].AccountNo;