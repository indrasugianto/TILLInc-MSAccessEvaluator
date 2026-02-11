SELECT [>Product List].Activity50, [>Product List].Activity51, [>Product List].Activity52, [>Product List].Activity53
FROM [>Product List]
WHERE (((IIf(nnez([activity50])<>0 Or nnez([activity51])<>0,True,False))=True));