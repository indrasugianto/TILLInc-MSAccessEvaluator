SELECT DISTINCTROW [>Local Settings].LocalSettingText6, [>Local Settings].LocalSettingText7
FROM [>Local Settings]
WHERE (((InStr([LocalSettingText5],"Form_Resources_ResourceList1"))<>"0")) OR (((InStr([LocalSettingText5],"Form_Resources_ResourceList2"))<>"0")) OR (((InStr([LocalSettingText5],"Form_Resources_ResourceList3"))<>"0")) OR (((InStr([LocalSettingText5],"Form_Resources_ResourceList4"))<>"0")) OR (((InStr([LocalSettingText5],"Form_Resources_ResourceList5"))<>"0"))
ORDER BY [>Local Settings].LocalSettingText5;