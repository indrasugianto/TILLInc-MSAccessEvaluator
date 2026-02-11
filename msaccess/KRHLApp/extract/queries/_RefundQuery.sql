SELECT [>General Ledger Query].ID, [>General Ledger Query].SourceTransaction, [>General Ledger Query].AccountNumber, [>General Ledger Query].TransactionDate, [>General Ledger Query].DebitAmount, [>General Ledger Query].CreditAmount
FROM [>General Ledger Query]
WHERE ((([>General Ledger Query].SourceTransaction)="refund") AND (([>General Ledger Query].AccountNumber)=121));