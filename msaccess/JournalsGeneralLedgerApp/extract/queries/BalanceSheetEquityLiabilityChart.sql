SELECT IIf(InStr([localsettingtext5],"Total Liability"),"Total Liability","Total Equity") AS Label1, [>Local Settings].LocalSettingText6, [>Local Settings].LocalSettingText5
FROM [>Local Settings]
WHERE ((([>Local Settings].LocalSettingText5)="Balance_Total Liability" Or ([>Local Settings].LocalSettingText5)="Balance_Total Stockholder Equity"));