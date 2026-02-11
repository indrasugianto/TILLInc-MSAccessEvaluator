SELECT DISTINCTROW [>Product Lists].ProductList, Count([>Product List].Item) AS CountOfItem
FROM [>Product List] LEFT JOIN [>Product Lists] ON [>Product List].ProductListKey=[>Product Lists].Key
GROUP BY [>Product Lists].ProductList, [>Product Lists].Job, [>Product List].HideItemInList
HAVING ((([>Product Lists].Job)=LocalVariable("FormJobs_JobName")) AND (([>Product List].HideItemInList)=False))
ORDER BY [>Product Lists].ProductList
WITH OWNERACCESS OPTION;