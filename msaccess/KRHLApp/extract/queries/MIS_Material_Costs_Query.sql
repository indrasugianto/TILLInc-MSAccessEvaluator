SELECT DISTINCTROW [>Jobs].Key, [MIS Material Costs].Order AS Expr1, [MIS Material Costs].Materials AS Expr2
FROM [>Jobs], [MIS Material Costs]
WHERE ((([>Jobs].Key)=Forms!Jobs.JobName));