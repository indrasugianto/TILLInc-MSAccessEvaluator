SELECT DISTINCTROW [>Settings].MacroToRun
FROM [>Settings]
WHERE ((([>Settings].MacroToRun) Is Not Null) AND (([>Settings].MenuText)="Note"))
ORDER BY [>Settings].MacroToRun
WITH OWNERACCESS OPTION;