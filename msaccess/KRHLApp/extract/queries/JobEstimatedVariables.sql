SELECT [>Jobs].Key, [>Jobs].Margin, [>Jobs].DesignEstCost, [>Jobs].ShopEstCost, [>Jobs].InstallEstCost
FROM [>Jobs]
WHERE ((([>Jobs].Key)=[forms]![ProductListMaster].[ProductListControl]![JobName]));