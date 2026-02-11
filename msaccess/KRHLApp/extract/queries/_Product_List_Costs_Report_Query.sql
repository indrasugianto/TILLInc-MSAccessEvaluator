SELECT DISTINCTROW [>Product List Whole Query].*, IIf(IsNull([Category]),"Miscellaneous",[Category]) AS TheCategory
FROM [>Product List Whole Query]
WITH OWNERACCESS OPTION;