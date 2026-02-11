SELECT DISTINCTROW [>Settings].MenuText
FROM [>Settings]
WHERE ((([>Settings].MenuText)="Disbursements" Or ([>Settings].MenuText)="Receipts"))
ORDER BY [>Settings].MenuText;