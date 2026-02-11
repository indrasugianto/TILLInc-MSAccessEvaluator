SELECT DISTINCTROW [>Settings].RateUnits, [>Settings].RateAmount, [>Settings].Key
FROM [>Settings]
WHERE ((([>Settings].RateUnits) Is Not Null))
ORDER BY [>Settings].RateUnits;