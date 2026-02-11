SELECT DISTINCTROW [>Jobs].Closed, [>Jobs].Estimate, [>Jobs].ID, [>Jobs].Key, Sum([General Ledger].CreditAmount) AS SumOfCreditAmount, Sum([General Ledger].DebitAmount) AS SumOfDebitAmount, Sum(-[DebitAmount]+[CreditAmount]) AS SumofAmount
FROM [>Jobs] LEFT JOIN [General Ledger] ON [>Jobs].Key=[General Ledger].Job
WHERE ((([General Ledger].AccountNumber)=121 Or ([General Ledger].AccountNumber)=123) AND (([SourceJournal]="Receipt" Or [SourceJournal]="Purchase" And [SourceTransaction]="Refund")=True))
GROUP BY [>Jobs].Closed, [>Jobs].Estimate, [>Jobs].ID, [>Jobs].Key
HAVING ((([>Jobs].Closed)=False) AND (([>Jobs].Estimate)=False))
ORDER BY [>Jobs].ID;