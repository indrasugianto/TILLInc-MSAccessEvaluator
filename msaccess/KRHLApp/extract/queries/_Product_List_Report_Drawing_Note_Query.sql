SELECT DISTINCTROW [>Note].*, [>Product List Query].Key AS Expr1, [>Product List Query].ProductList AS Expr2, [>Product List Query].Item AS Expr3, [>Product List Query].Reference1 AS Expr4, [>Product List Query].Reference2 AS Expr5, [>Product List Query].ProductName AS Expr6, [>Product List Query].X AS Expr7, [>Product List Query].Y AS Expr8, [>Product List Query].Z AS Expr9
FROM [>Note], [>Product List Query]
WHERE ((([>Note].ID) Is Not Null) AND (([>Note].DrawingNote)=True))
WITH OWNERACCESS OPTION;