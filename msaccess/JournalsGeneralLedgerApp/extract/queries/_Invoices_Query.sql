SELECT DISTINCTROW [Purchase Journal].SupplierID, [Purchase Journal].InvoiceDate, [Purchase Journal].InvoiceNo, [Purchase Journal].TotalAmount
FROM [Purchase Journal]
WHERE ((([Purchase Journal].SupplierID)=Forms!PurchaseJournalEntry.Supplier))
ORDER BY [Purchase Journal].InvoiceDate;