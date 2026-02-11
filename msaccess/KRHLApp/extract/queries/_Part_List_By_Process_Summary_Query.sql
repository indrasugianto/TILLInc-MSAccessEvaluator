SELECT DISTINCTROW [>Part List].Item, [>Part List].DefaultMaterial, [>Part List].Category, [>Part List].Processes, [>Part List].PartProcessAlternate, [>Part List].ProcessCostAlternate, [>Part List].ProcessCost, IIf(Localvariable("Scratchpad")<>"",[SubAssembly],IIf([Category]<>"Assembly" And [category]<>"Finish","Milling + Specials",[Category])) AS TheCategory
FROM [>Part List]
WHERE ((([>Part List].ProcessCost)<>0) And (([>Part List].ProductList)=Forms!ProductListMaster!ProductListControl!ProductListName) And (([>Part List].ProcessList)=True Or ([>Part List].ProcessList)=False))
ORDER BY [>Part List].Category, [>Part List].Processes
WITH OWNERACCESS OPTION;