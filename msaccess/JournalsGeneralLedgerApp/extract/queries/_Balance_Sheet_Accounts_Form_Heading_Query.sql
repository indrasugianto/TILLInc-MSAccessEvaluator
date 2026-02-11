SELECT DISTINCTROW [>Settings].MacroToRun, [>Settings].MenuCategory, [>Settings].Key, IIf(Right([MenuCategory],1)=0,"Heading",IIf(InStr([menutext],"Asset")<>0,"Asset",IIf(InStr([menutext],"Liability")<>0,"Liability",IIf(InStr([menutext],"Income")<>0,"Income","Expense")))) AS Heading
FROM [>Settings]
WHERE (((InStr([MenuText],"BalanceSheetAsset")<>0 Or InStr([MenuText],"BalanceSheetLiability")<>0 Or InStr([MenuText],"ProfitLossExpense")<>0 Or InStr([MenuText],"ProfitLossIncome")<>0)=True))
ORDER BY [>Settings].MenuCategory;