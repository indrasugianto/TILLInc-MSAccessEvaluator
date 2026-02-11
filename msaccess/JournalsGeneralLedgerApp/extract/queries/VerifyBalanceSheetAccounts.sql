SELECT [General Ledger].AccountNumber, [MIS Accounts].BalanceSheetItemSort, Sum([General Ledger].CreditAmount) AS SumOfCreditAmount, Sum([General Ledger].DebitAmount) AS SumOfDebitAmount, [General Ledger Balance Sheet].Detail, [MIS Accounts].Balance, IIf([sumofcreditamount]<>[sumofdebitamount]<>0 And nnez([Detail])=0,False,True) AS AccountTest
FROM ([General Ledger] LEFT JOIN [MIS Accounts] ON [General Ledger].AccountNumber = [MIS Accounts].Number) LEFT JOIN [General Ledger Balance Sheet] ON [MIS Accounts].BalanceSheetItemSort = [General Ledger Balance Sheet].Detail
WHERE ((([General Ledger].TransactionDate)>=[forms]![GeneralLedger]![FromDate] And ([General Ledger].TransactionDate)<=[Forms]![GeneralLedger]![ToDate]))
GROUP BY [General Ledger].AccountNumber, [MIS Accounts].BalanceSheetItemSort, [General Ledger Balance Sheet].Detail, [MIS Accounts].Balance
HAVING ((([General Ledger].AccountNumber)<300))
ORDER BY [General Ledger].AccountNumber;