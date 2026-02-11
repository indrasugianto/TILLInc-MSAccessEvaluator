SELECT [MIS Accounts].Number, [MIS Accounts].BalanceSheetItemSort, [MIS Accounts].Balance, [MIS Accounts].FY5
FROM [MIS Accounts]
WHERE ((([MIS Accounts].Number)<300))
ORDER BY [MIS Accounts].Number;