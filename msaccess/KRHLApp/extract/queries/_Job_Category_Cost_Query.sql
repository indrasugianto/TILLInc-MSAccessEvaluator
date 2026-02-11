SELECT DISTINCTROW [>Products].Category, Sum([>Product List].TotalCost) AS SumOfTotalCost, Sum([>Product List].PremiumCost) AS SumOfPremiumCost
FROM ([>Product List] INNER JOIN [>Products] ON [>Product List].Product=[>Products].Key) LEFT JOIN [>Product Lists] ON [>Product List].ProductListKey=[>Product Lists].Key
WHERE ((([>Product Lists].Job)=LocalVariable("FormJobs_JobName")))
GROUP BY [>Products].Category, [>Product List].HideItemInList
HAVING ((([>Product List].HideItemInList)=False))
ORDER BY [>Products].Category
WITH OWNERACCESS OPTION;