SELECT [>Settings].MenuText, [>Settings].MenuCategory
FROM [>Settings]
WHERE ((([>Settings].MenuCategory)>0) AND (([>Settings].MacroToRun)="SurveyContact"))
ORDER BY [>Settings].MenuCategory;