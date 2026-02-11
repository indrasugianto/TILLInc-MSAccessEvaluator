SELECT DISTINCTROW [>Drawings].*, Right([ScaleTemplate],Len([ScaleTemplate])-1) AS Expr1
FROM [>Drawings] INNER JOIN [>Settings] ON [>Drawings].TheScale=[>Settings].TheScale
WHERE ((([>Drawings].Key)=Forms!Drawings.Key))
WITH OWNERACCESS OPTION;