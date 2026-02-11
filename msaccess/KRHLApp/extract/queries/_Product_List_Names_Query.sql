SELECT DISTINCTROW [>Product Lists].ProductList AS [Product List Name], IIf([IncludeinEstimate] And [>Product Lists].Job<>0,[ID] & " (estimate)",IIf([IncludeinEstimate],"No job selected",[ID])) AS Job, [>Product Lists].Key AS [Record Number], [>Product Lists].EntryDate, [>Product Lists].Archive
FROM [>Product Lists] LEFT JOIN [>Jobs] ON [>Product Lists].Job=[>Jobs].Key
WHERE ((([>Product Lists].Archive)=False))
ORDER BY [>Product Lists].ProductList, IIf([IncludeinEstimate] And [>Product Lists].Job<>0,[ID] & " (estimate)",IIf([IncludeinEstimate],"No job selected",[ID]))
WITH OWNERACCESS OPTION;