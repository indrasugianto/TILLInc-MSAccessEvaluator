SELECT DISTINCTROW [>Drawings].*, Right([ScaleTemplate],Len([ScaleTemplate])-1) AS Expr1
FROM [>Drawings] INNER JOIN [>Settings] ON [>Drawings].TheScale=[>Settings].TheScale
WHERE ((([>Drawings].Name)=Forms!Drawings.Category) And (([>Drawings].Drawing) Is Not Null And ([>Drawings].Drawing)<>""))
ORDER BY [>Drawings].Sequence
WITH OWNERACCESS OPTION;