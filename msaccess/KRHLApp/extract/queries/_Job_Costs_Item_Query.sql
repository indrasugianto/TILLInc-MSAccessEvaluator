SELECT DISTINCTROW [>Product Lists].Job, [>Product Lists].ProductList, [>Products].ID, [>Product List].Item, [>Product List].TotalCost, [>Product List].PremiumCost
FROM ([>Product List] LEFT JOIN [>Products] ON [>Product List].Product=[>Products].Key) LEFT JOIN [>Product Lists] ON [>Product List].ProductListKey=[>Product Lists].Key
WHERE ((([>Product Lists].Job)=LocalVariable("FormJobs_JobName")) AND (([>Product List].HideItemInList)=False))
ORDER BY [>Product Lists].ProductList, [>Product List].Item
WITH OWNERACCESS OPTION;