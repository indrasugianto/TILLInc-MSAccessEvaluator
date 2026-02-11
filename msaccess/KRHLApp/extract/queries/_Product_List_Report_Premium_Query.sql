SELECT DISTINCTROW [>Product List Whole Query].*, IIf(nnen([Reference1])="","No specific room",[Reference1]) AS TheRoom
FROM [>Product List Whole Query]
WITH OWNERACCESS OPTION;