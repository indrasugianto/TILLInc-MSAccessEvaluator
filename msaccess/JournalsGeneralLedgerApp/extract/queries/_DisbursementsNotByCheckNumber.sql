SELECT DISTINCTROW [Purchase Journal].*, [MIS Accounts].Account
FROM [Purchase Journal] LEFT JOIN [MIS Accounts] ON [Purchase Journal].AccountNo=[MIS Accounts].Number
WHERE (((IIf([Paid] And Forms!APChecksEntry!ViewPaidInvoices,True,IIf(Not [Paid] And Forms!APChecksEntry!ViewallInvoices,True,False)))=True) And (([Purchase Journal].PayablesAccount)=Forms!APChecksEntry!PayableAccount))
ORDER BY [Purchase Journal].CheckDate DESC , [Purchase Journal].CheckNumber DESC , [Purchase Journal].InvoiceNo;