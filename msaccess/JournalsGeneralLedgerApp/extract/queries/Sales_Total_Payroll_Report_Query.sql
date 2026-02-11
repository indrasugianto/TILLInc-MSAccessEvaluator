SELECT DISTINCTROW [Sales Payroll Report Query].SaleDate, Sum([Sales Payroll Report Query].Sale) AS SumOfSale
FROM [Sales Payroll Report Query]
GROUP BY [Sales Payroll Report Query].SaleDate;