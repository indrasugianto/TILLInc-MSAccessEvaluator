SELECT DISTINCTROW Guide.Name AS Expr1, Guide.Category AS Expr2, Guide.Key AS Expr3, Guide.Sequence AS Expr4, Guide.Purpose AS Expr5, Guide.Synopsis AS Expr6, Guide.Description AS Expr7, Guide.Examples AS Expr8, Guide.Limitations AS Expr9, Guide.Algorithm AS Expr10, Guide.SeeAlso AS Expr11, Guide.References AS Expr12
FROM Guide
ORDER BY Guide.Category, Guide.Name;