SELECT IIf(InStr([localsettingtext5],"Total Current Liability"),"Current Liability","Current Asset") AS Label1, [>Local Settings].LocalSettingText6, [>Local Settings].LocalSettingText5
FROM [>Local Settings]
WHERE ((([>Local Settings].LocalSettingText5)="Balance_Total Current Liability" Or ([>Local Settings].LocalSettingText5)="Balance_Total Current Asset"))
ORDER BY IIf(InStr([localsettingtext5],"Total Current Liability"),"Current Liability","Current Asset") DESC;