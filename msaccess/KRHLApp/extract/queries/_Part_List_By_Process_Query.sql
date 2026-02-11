SELECT DISTINCTROW [>Part List].DefaultMaterial, [>Part List].Category, [>Part List].Processes, [>Part List].ProcessCostAlternate, IIf(Localvariable("Scratchpad")<>"",[Category],IIf([Category]<>"Assembly" And [category]<>"Finish","Milling + Specials",[Category])) AS TheCategory, [>Part List].ProcessCost
FROM [>Part List]
WHERE ((([>Part List].ProductList)=Forms!ProductListMaster!ProductListControl!ProductListName) And (([>Part List].ProcessList)=True) And (([>Part List].DisplayPart)=True))
ORDER BY [>Part List].Category, [>Part List].Processes
WITH OWNERACCESS OPTION;