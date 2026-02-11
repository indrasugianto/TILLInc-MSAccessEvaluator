SELECT DISTINCTROW [>Hours Query].[Job ID], [>Hours Query].Employee, [>Hours Query].Date, IIf(IsNull([Activity]),[General],[Activity]) AS AorG, Sum([>Hours Query].Hours) AS SumOfHours, [>Hours Query].Activity, [>Hours Query].General, Sum([>Hours Query].Cost) AS SumOfCost, IIf(IsNull([Activity]),"General Hours","Job Hours") AS GorJ
FROM [>Hours Query]
GROUP BY [>Hours Query].[Job ID], [>Hours Query].Employee, [>Hours Query].Date, IIf(IsNull([Activity]),[General],[Activity]), [>Hours Query].Activity, [>Hours Query].General
HAVING (((Sum([>Hours Query].Hours))<>0));