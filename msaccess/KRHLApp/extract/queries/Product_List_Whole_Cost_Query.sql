SELECT DISTINCTROW Sum([>Product List].TotalCost) AS SumOfTotalCost, Sum([>Product List].PremiumCost) AS SumOfPremiumCost
FROM [>Product List]
GROUP BY [>Product List].ProductListKey
HAVING ((([>Product List].ProductListKey)=[Forms]![ProductListMaster]![ProductListControl]![ProductListName]))
WITH OWNERACCESS OPTION;