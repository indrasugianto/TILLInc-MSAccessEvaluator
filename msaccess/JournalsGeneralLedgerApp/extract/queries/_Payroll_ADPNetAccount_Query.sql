SELECT DISTINCTROW [MIS Personnel].ADPNetAccount, [MIS Accounts].Account
FROM [MIS Personnel] LEFT JOIN [MIS Accounts] ON [MIS Personnel].ADPNetAccount=[MIS Accounts].Number
GROUP BY [MIS Personnel].ADPNetAccount, [MIS Accounts].Account
HAVING ((([MIS Personnel].ADPNetAccount)>0));