SELECT [>Jobs].Info4, [>Jobs].Info3, [MIS Personnel].Key
FROM [>Jobs] LEFT JOIN [MIS Personnel] ON [>Jobs].ManagedBy=[MIS Personnel].Key
WHERE ((([>Jobs].Key)=Forms!Sales!JobName));