SELECT DISTINCTROW [>Settings].TheScale, [>Settings].ScaleTemplate, Right([ScaleTemplate],Len([ScaleTemplate])-1) AS Expr1
FROM [>Settings]
WHERE ((([>Settings].TheScale)<>""))
ORDER BY [>Settings].ScaleTemplate;