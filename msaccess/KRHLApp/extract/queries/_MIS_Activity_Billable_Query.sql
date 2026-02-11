SELECT DISTINCTROW [>Settings].JobActivity, [>Settings].JobActivityCharge
FROM [>Settings]
WHERE ((([>Settings].JobActivity) Is Not Null) AND ((InStr([Phase],"DesignJob"))<>0))
ORDER BY [>Settings].JobActivity;