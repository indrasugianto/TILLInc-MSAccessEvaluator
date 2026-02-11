SELECT [General Ledger].AccountNumber, [MIS Accounts].BalanceSheetItemSort, Sum([General Ledger].CreditAmount) AS SumOfCreditAmount, Sum([General Ledger].DebitAmount) AS SumOfDebitAmount, [General Ledger Income Statement].Detail, IIf([sumofcreditamount]<>[sumofdebitamount]<>0 And nnez([Detail])=0,False,True) AS AccountTest
FROM ([General Ledger] LEFT JOIN [MIS Accounts] ON [General Ledger].AccountNumber = [MIS Accounts].Number) LEFT JOIN [General Ledger Income Statement] ON [MIS Accounts].BalanceSheetItemSort = [General Ledger Income Statement].Detail
WHERE ((([General Ledger].TransactionDate)>=[forms]![GeneralLedger]![FromDate] And ([General Ledger].TransactionDate)<=[Forms]![GeneralLedger]![ToDate]))
GROUP BY [General Ledger].AccountNumber, [MIS Accounts].BalanceSheetItemSort, [General Ledger Income Statement].Detail
HAVING ((([General Ledger].AccountNumber)>=400))
ORDER BY [General Ledger].AccountNumber;