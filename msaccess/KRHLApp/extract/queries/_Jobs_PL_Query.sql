SELECT DISTINCTROW [>Product List].*
FROM [>Product List] LEFT JOIN [>Product Lists] ON [>Product List].ProductListKey=[>Product Lists].Key
WHERE ((([>Product Lists].Job)=forms!Jobs.JobName))
WITH OWNERACCESS OPTION;