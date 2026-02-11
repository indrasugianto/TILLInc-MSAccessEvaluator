SELECT DISTINCTROW [>Product List Whole Query].[>Product List].Key, [>Product List Whole Query].Item, [>Products].Description, [>Product List Whole Query].X, [>Product List Whole Query].Y, [>Product List Whole Query].Z
FROM [>Product List Whole Query] LEFT JOIN [>Products] ON [>Product List Whole Query].Product=[>Products].Key
ORDER BY [>Product List Whole Query].Item
WITH OWNERACCESS OPTION;