SELECT DISTINCTROW [>Resources All Query].ID, [>Resources All Query].Category, [>Resources All Query].Key, [>Resources All Query].Field1, [>Resources All Query].Field2, [>Resources All Query].Field3, [>Resources All Query].Field4, [>Resources All Query].TheName, [>Resources All Query].Address, [>Resources All Query].State, [>Resources All Query].Zip, [>Resources All Query].AreaCode, [>Resources All Query].Comment
FROM [>Resources All Query]
WHERE ((([>Resources All Query].Category)=Forms!Resources.CategorySort))
ORDER BY [>Resources All Query].Category, [>Resources All Query].ID
WITH OWNERACCESS OPTION;