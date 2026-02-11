SELECT DISTINCTROW [>Part List].SubAssembly
FROM [>Part List]
GROUP BY [>Part List].SubAssembly, [>Part List].ProductList
HAVING ((([>Part List].ProductList)=Forms!ProductListMaster!ProductListControl!ProductListName))
WITH OWNERACCESS OPTION;