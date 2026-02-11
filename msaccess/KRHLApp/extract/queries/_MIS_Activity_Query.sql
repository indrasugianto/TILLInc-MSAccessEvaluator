SELECT DISTINCTROW [>Settings].JobActivity, [>Settings].JobActivityCharge, [>Settings].Phase
FROM [>Settings]
WHERE ((([>Settings].JobActivity) Is Not Null) AND (([>Settings].Phase) Is Null))
ORDER BY [>Settings].JobActivity;