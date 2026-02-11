SELECT DISTINCTROW Count([>Product List].Item) AS CountOfItem, Sum([>Product List].TotalCost) AS SumOfTotalCost, Sum([>Product List].PremiumCost) AS SumOfPremiumCost
FROM [>Product List] LEFT JOIN [>Product Lists] ON [>Product List].ProductListKey=[>Product Lists].Key
WHERE ((([>Product Lists].Job)=LocalVariable("FormJobs_JobName")))
GROUP BY [>Product List].HideItemInList
HAVING ((([>Product List].HideItemInList)=False))
WITH OWNERACCESS OPTION;