SELECT DISTINCTROW [>Part List].Category, [>Part List].Processes, [>Part List].DefaultMaterial, [>Part List].CostUnit, [>Part List].PartProcessAlternate, [>Part List].ProcessCost, IIf(Localvariable("Scratchpad")<>"",[Category],IIf([Category]<>"Assembly" And [category]<>"Finish","Milling + Specials",[Category])) AS TheCategory
FROM [>Part List]
WHERE ((([>Part List].Item)=Forms!ProductListMaster!ProductListControl!Key) And (([>Part List].ProductList)=Forms!ProductListMaster!ProductListControl!ProductListName) And (([>Part List].ProcessList)=True) And (([>Part List].DisplayPart)=True))
ORDER BY [>Part List].Category, [>Part List].Processes
WITH OWNERACCESS OPTION;