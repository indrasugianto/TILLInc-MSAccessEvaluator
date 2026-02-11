SELECT DISTINCTROW [General Ledger].SourceTransaction, [General Ledger].SourceTransaction, [General Ledger].TransactionDate
FROM [General Ledger]
WHERE (((IIf(forms!GeneralLedger!SelectJournal And [SourceJournal]=Forms!GeneralLedger!SelectedJournal,True,IIf(Not forms!GeneralLedger!SelectJournal,True,False)))=True))
GROUP BY [General Ledger].SourceTransaction, [General Ledger].SourceTransaction, [General Ledger].TransactionDate
HAVING ((([General Ledger].TransactionDate)>=forms!GeneralLedger.FromDate And ([General Ledger].TransactionDate)<=forms!Generalledger.todate))
ORDER BY [General Ledger].SourceTransaction, [General Ledger].TransactionDate;