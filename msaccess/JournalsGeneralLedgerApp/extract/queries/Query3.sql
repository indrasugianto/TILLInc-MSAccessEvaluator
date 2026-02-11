SELECT [Purchase Journal].CheckDate, [Purchase Journal].CheckNumber, [Purchase Journal].CheckKey, [Purchase Journal].Due, [Purchase Journal].DebitAmount, [Purchase Journal].Paid, [>Resources].ID, [Purchase Journal].EntryDate
FROM [Purchase Journal] LEFT JOIN [>Resources] ON [Purchase Journal].SupplierID=[>Resources].Key
WHERE ((([Purchase Journal].DebitAmount)<0) AND (([Purchase Journal].Paid)=True))
ORDER BY [Purchase Journal].CheckDate, [Purchase Journal].CheckNumber;