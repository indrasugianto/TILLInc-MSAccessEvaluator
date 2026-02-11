SELECT [Receivables Owed Query].ID, [Receivables Owed Query].SumOfDebitAmount, [Receivables Owed Query].SumOfCreditAmount, [Receivables Owed Query].Job
FROM [Receivables Owed Query]
WHERE (((([sumofdebitamount]\1<>[sumofcreditamount]\1))=True));