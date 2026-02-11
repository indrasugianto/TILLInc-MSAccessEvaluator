SELECT DISTINCTROW [>Settings].MacroToRun, [>Settings].MenuText
FROM [>Settings]
WHERE ((([>Settings].MenuText)="abs" Or ([>Settings].MenuText)="rel"))
ORDER BY [>Settings].MacroToRun;