SELECT [>Product Lists].Job, Sum([>Product List].TotalCost) AS SumOfTotalCost, Sum([>Product List].PremiumCost) AS SumOfPremiumCost
FROM [>Product Lists] INNER JOIN [>Product List] ON [>Product Lists].Key = [>Product List].ProductListKey
GROUP BY [>Product Lists].Job
HAVING ((([>Product Lists].Job)=[forms]![ProductListMaster].[ProductListControl]![JobName]));