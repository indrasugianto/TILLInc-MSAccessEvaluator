SELECT DISTINCTROW [>Settings].MacroToRun, [>Settings].MenuCategory, [>Settings].Key, [>Settings].MenuText
FROM [>Settings]
WHERE (((InStr([MenuText],"ProfitLossIncome")<>0 And InStr(localvariable("ScratchPad"),"Income")<>0 Or InStr([MenuText],"ProfitLossExpense")<>0 And InStr(localvariable("ScratchPad"),"Income")<>0 Or InStr([MenuText],"BalanceSheetAsset")<>0 And InStr(localvariable("ScratchPad"),"Balance")<>0 Or InStr([MenuText],"BalanceSheetLiability")<>0 And InStr(localvariable("ScratchPad"),"Balance")<>0)=True))
ORDER BY [>Settings].MenuCategory;