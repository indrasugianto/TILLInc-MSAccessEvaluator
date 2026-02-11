SELECT DISTINCTROW [>Product List Whole Query].*, IIf(nnen([Reference1])="","No room specified",[Reference1]) AS TheRoom
FROM [>Product List Whole Query]
WHERE (((nnez([Premiumcost])+nnez([totalcost]))<>0))
WITH OWNERACCESS OPTION;