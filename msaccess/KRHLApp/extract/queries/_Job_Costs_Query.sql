SELECT DISTINCTROW [>Product Lists].Job, [>Product Lists].ProductList, [>Products].Category, Sum([>Product List].TotalCost) AS SumOfTotalCost, Sum([>Product List].PremiumCost) AS SumOfPremiumCost
FROM ([>Product List] LEFT JOIN [>Products] ON [>Product List].Product=[>Products].Key) LEFT JOIN [>Product Lists] ON [>Product List].ProductListKey=[>Product Lists].Key
GROUP BY [>Product Lists].Job, [>Product Lists].ProductList, [>Products].Category, [>Product List].HideItemInList
HAVING ((([>Product Lists].Job)=NNEZ(LocalVariable("FormJobs_JobName"))) AND (([>Product List].HideItemInList)=False))
ORDER BY [>Product Lists].Job, [>Product Lists].ProductList, [>Products].Category
WITH OWNERACCESS OPTION;