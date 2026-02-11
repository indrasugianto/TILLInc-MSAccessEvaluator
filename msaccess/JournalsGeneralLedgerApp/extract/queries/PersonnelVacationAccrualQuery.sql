SELECT [>Settings].MacroToRun, [>Settings].MenuCategory
FROM [>Settings]
GROUP BY [>Settings].MacroToRun, [>Settings].MenuCategory, [>Settings].MenuText
HAVING ((([>Settings].MenuText)="VacationAccrual"))
ORDER BY [>Settings].MenuCategory;