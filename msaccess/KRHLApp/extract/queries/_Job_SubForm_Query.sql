SELECT DISTINCTROW [>Jobs].*, [>Resources].Field1, [>Resources].Field3, [>Resources].Field2
FROM [>Jobs] LEFT JOIN [>Resources] ON [>Jobs].Customer=[>Resources].Key
WHERE ((([>Jobs].Key)=Forms!Resources.JobName))
WITH OWNERACCESS OPTION;