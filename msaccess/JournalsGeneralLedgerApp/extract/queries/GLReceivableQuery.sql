SELECT DISTINCTROW GLSalesQuery.[>Jobs].ID, GLSalesQuery.LastOfDue, GLSalesQuery.SumOfInvoiceAmount, GLReceiptsQuery.SumOfAmount, GLSalesQuery.[>Resources].ID
FROM GLSalesQuery INNER JOIN GLReceiptsQuery ON GLSalesQuery.[>Jobs].ID=GLReceiptsQuery.ID
ORDER BY GLSalesQuery.[>Jobs].ID;