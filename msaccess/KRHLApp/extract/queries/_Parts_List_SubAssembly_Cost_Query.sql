SELECT DISTINCTROW [>Part List].SubAssembly, Sum([>Part List].MaterialCost) AS SumOfMaterialCost, Sum([>Part List].ProcessCost) AS SumOfProcessCost, Sum([MaterialCost]+[ProcessCost]) AS Total, [>Part List].PartProcessAlternate
FROM [>Part List]
GROUP BY [>Part List].SubAssembly, [>Part List].PartProcessAlternate, [>Part List].ProductList
HAVING ((([>Part List].ProductList)=Forms!ProductListMaster!ProductListControl!ProductListName))
WITH OWNERACCESS OPTION;