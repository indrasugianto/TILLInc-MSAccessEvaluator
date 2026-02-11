SELECT DISTINCTROW [>Note].ID, [>Note].Key, [>Note].Note, [>Note].ProductListKey, IIf(Forms!NoteSearch!ViewID="View Current" And Not IsNull([MacroToRun]),True,IIf(Forms!NoteSearch!ViewID<>"View Current",True,False)) AS ViewCurrent
FROM [>Product List Note Headings Query] RIGHT JOIN [>Note] ON [>Product List Note Headings Query].MacroToRun=[>Note].ID
WHERE (((IIf(Forms!NoteSearch!ViewID="View Current" And Not IsNull([MacroToRun]),True,IIf(Forms!NoteSearch!ViewID<>"View Current",True,False)))=True))
ORDER BY [>Note].ID
WITH OWNERACCESS OPTION;