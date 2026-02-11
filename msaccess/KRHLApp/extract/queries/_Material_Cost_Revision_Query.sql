SELECT DISTINCTROW [>Material].Category, [>Material].ID, [>Material].Description, [>Material].CostAmount, [>Material].StandardMaterial, IIf(IsNull([CostAmountDate]),#1/1/2000#,[CostAmountDate]) AS CostDate
FROM [>Material]
WHERE ((([>Material].Category)=forms!Material!CategorySort) And ((IIf(Forms!Material!StandardMaterials And [StandardMaterial],True,IIf(Not Forms!Material!StandardMaterials And Not [StandardMaterial],True,False)))=True))
ORDER BY [>Material].Category, [>Material].ID
WITH OWNERACCESS OPTION;