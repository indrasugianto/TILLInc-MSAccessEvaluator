SELECT DISTINCTROW [MIS Accounts].Number, Last([>General Ledger Query].TransactionDate) AS LastOfTransactionDate, Sum([>General Ledger Query].DebitAmount) AS SumOfDebitAmount, [>Jobs].ID, [MIS Accounts].Account, Sum([>General Ledger Query].CreditAmount) AS SumOfCreditAmount
FROM (([MIS Accounts] RIGHT JOIN [>General Ledger Query] ON [MIS Accounts].Number=[>General Ledger Query].AccountNumber) LEFT JOIN [Sales Journal] ON [>General Ledger Query].SourceKey=[Sales Journal].Key) LEFT JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key
GROUP BY [MIS Accounts].Number, [>Jobs].ID, [MIS Accounts].Account
HAVING ((([MIS Accounts].Number)=121))
ORDER BY Last([>General Ledger Query].TransactionDate), Sum([>General Ledger Query].DebitAmount);