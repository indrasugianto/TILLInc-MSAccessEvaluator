SELECT DISTINCTROW [>Invoices and Payments].JobName AS Expr1, [>Invoices and Payments].InvoiceDate AS Expr2, [>Invoices and Payments].PaymentDate AS Expr3, [>Invoices and Payments].InvoiveAmount AS Expr4, [>Invoices and Payments].InvoiceNumber AS Expr5, [>Invoices and Payments].Payment AS Expr6
FROM [>Invoices and Payments]
WHERE ((([>Invoices and Payments].InvoiceDate)>=Forms!InvoicesAndPayments.Beginning And ([>Invoices and Payments].InvoiceDate)<=Forms!InvoicesAndPayments.Ending))
ORDER BY [>Invoices and Payments].JobName, [>Invoices and Payments].InvoiceDate, [>Invoices and Payments].PaymentDate
WITH OWNERACCESS OPTION;