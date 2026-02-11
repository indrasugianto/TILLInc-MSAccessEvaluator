SELECT DISTINCTROW [MIS Accounts].Number, [MIS Accounts].Account, [MIS Accounts].Balance
FROM [MIS Accounts]
WHERE ((([MIS Accounts].Number)<300))
ORDER BY [MIS Accounts].Number, [MIS Accounts].Account;