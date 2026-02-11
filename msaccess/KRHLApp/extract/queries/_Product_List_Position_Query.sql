SELECT DISTINCTROW [>Product List Whole Query].Item, [>Products].ID, [>Product List Whole Query].X, [>Product List Whole Query].Y, [>Product List Whole Query].Z, [>Product List Whole Query].Key
FROM [>Product List Whole Query] LEFT JOIN [>Products] ON [>Product List Whole Query].Product=[>Products].Key
ORDER BY [>Product List Whole Query].Item;