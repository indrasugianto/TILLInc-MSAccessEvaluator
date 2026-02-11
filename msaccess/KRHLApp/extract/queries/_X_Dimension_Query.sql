SELECT DISTINCTROW [>Settings].MenuText, [>Settings].MacroToRun
FROM [>Settings]
WHERE (((InStr([MenuText],"dim"))<>"0") AND ((InStr([MenuText],"X"))<>"0"))
ORDER BY [>Settings].MacroToRun;