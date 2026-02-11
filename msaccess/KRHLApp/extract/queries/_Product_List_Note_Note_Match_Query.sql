SELECT DISTINCTROW [>Product List Note View Match Query].ID, [>Product List Note View Match Query].Note, [>Product List Note View Match Query].Key, [>Product List Note View Match Query].ProductListKey, IIf(NNEN(Forms!NoteSearch!SearchNote)="",True,IIf(InStr([Note],Forms!NoteSearch!SearchNote)<>0,True,False)) AS NoteMatch
FROM [>Product List Note View Match Query]
WHERE (((IIf(NNEN(Forms!NoteSearch!SearchNote)="",True,IIf(InStr([Note],Forms!NoteSearch!SearchNote)<>0,True,False)))=True))
ORDER BY [>Product List Note View Match Query].ID
WITH OWNERACCESS OPTION;