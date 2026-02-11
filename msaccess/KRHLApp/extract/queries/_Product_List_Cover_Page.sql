SELECT DISTINCTROW [>Jobs].*, [>Resources].*
FROM [>Jobs] LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key
WHERE ((([>Jobs].Key)=Forms!ProductList.JobName));