SELECT DISTINCTROW [>Product Lists].ProductList AS [Product List Name], IIf([IncludeinEstimate],[ID] & " (estimate)",[ID]) AS Job, [>Product Lists].Key AS [Record Number], [>Product Lists].Archive
FROM [>Product Lists] LEFT JOIN [>Jobs] ON [>Product Lists].Job=[>Jobs].Key
WHERE ((([>Product Lists].Archive)=False) And (([>Product Lists].Job)=forms!ProductListMaster!ProductListControl!JobName))
ORDER BY [>Product Lists].ProductList, IIf([IncludeinEstimate],[ID] & " (estimate)",[ID])
WITH OWNERACCESS OPTION;