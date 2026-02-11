SELECT DISTINCTROW [>Part List].MaterialCategory, [>Part List].PartProcessAlternate
FROM [>Part List]
GROUP BY [>Part List].MaterialCategory, [>Part List].PartProcessAlternate, [>Part List].ProductList
HAVING ((([>Part List].ProductList)=Forms!ProductListMaster!ProductListControl!ProductListName) And ((IIf(InStr(forms!PartsList!PartAlternateProcess,"Alternate")<>0 And nnez([PartProcessAlternate])<>0,True,IIf(InStr(forms!PartsList!PartAlternateProcess,"Alternate")=0 And NNEZ([PartProcessAlternate])=0,True,False)))=True Or (IIf(InStr(forms!PartsList!PartAlternateProcess,"Alternate")<>0 And nnez([PartProcessAlternate])<>0,True,IIf(InStr(forms!PartsList!PartAlternateProcess,"Alternate")=0 And NNEZ([PartProcessAlternate])=0,True,False)))=False))
WITH OWNERACCESS OPTION;