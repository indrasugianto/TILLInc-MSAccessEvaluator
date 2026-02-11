SELECT DISTINCTROW [>Drawings].*, Right([ScaleTemplate],Len([ScaleTemplate])-1) AS Expr1
FROM [>Drawings] INNER JOIN [>Settings] ON [>Drawings].TheScale=[>Settings].TheScale
WHERE ((([>Drawings].Drawing) Is Not Null And ([>Drawings].Drawing)<>"") And (([>Drawings].Customer)=Yes) And (([>Drawings].Name)=Forms!Drawings.Category))
ORDER BY [>Drawings].Sequence
WITH OWNERACCESS OPTION;