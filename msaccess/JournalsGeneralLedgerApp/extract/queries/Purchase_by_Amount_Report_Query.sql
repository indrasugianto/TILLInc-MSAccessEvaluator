SELECT DISTINCTROW [Purchase Journal].SupplierID, [>Resources].ID, [>Resources].Category, Sum([Purchase Journal].DebitAmount) AS SumOfDebitAmount, [Purchase Journal].PayablesAccount, [Purchase Journal].Void, [Purchase Journal].Posted
FROM ([Purchase Journal] LEFT JOIN [>Resources] ON [Purchase Journal].SupplierID=[>Resources].Key) LEFT JOIN [>Jobs] ON [Purchase Journal].Job=[>Jobs].Key
WHERE ((([Purchase Journal].InvoiceDate)>=Forms!APChecksEntry.FromDate And ([Purchase Journal].InvoiceDate)<=Forms!APChecksEntry.ToDate))
GROUP BY [Purchase Journal].SupplierID, [>Resources].ID, [>Resources].Category, [Purchase Journal].PayablesAccount, [Purchase Journal].Void, [Purchase Journal].Posted
HAVING (((Sum([Purchase Journal].DebitAmount))<>0) AND (([Purchase Journal].PayablesAccount)=201) AND (([Purchase Journal].Void)=False) AND (([Purchase Journal].Posted)=True))
ORDER BY [>Resources].ID;