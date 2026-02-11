SELECT [MIS Accounts].BalanceSheetItemSort, [General Ledger].AccountNumber, Sum([General Ledger].CreditAmount) AS SumOfCreditAmount, Sum([General Ledger].DebitAmount) AS SumOfDebitAmount, [MIS Accounts].Account, [MIS Accounts].MDKHeading, [MIS Accounts].Balance, [MIS Accounts].FY9
FROM [MIS Accounts] INNER JOIN [General Ledger] ON [MIS Accounts].Number=[General Ledger].AccountNumber
WHERE ((([General Ledger].TransactionDate)>=forms!generalledger!fromdate And ([General Ledger].TransactionDate)<=forms!generalledger!todate))
GROUP BY [MIS Accounts].BalanceSheetItemSort, [General Ledger].AccountNumber, [MIS Accounts].Account, [MIS Accounts].MDKHeading, [MIS Accounts].Balance, [MIS Accounts].FY9
HAVING ((([General Ledger].AccountNumber)<300))
ORDER BY [MIS Accounts].BalanceSheetItemSort;