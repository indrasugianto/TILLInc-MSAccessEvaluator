SELECT DISTINCTROW [>Product Lists].Job, [>Products].Category, Sum([>Product List].TotalCost) AS SumOfTotalCost, Sum([>Product List].PremiumCost) AS SumOfPremiumCost
FROM ([>Product List] LEFT JOIN [>Products] ON [>Product List].Product=[>Products].Key) LEFT JOIN [>Product Lists] ON [>Product List].ProductListKey=[>Product Lists].Key
GROUP BY [>Product Lists].Job, [>Products].Category
HAVING ((([>Product Lists].Job)=NNEZ(LocalVariable("FormJobs_JobName"))) AND (([>Products].Category) Is Not Null))
ORDER BY [>Products].Category
WITH OWNERACCESS OPTION;