TRANSFORM Count(temptbl1.Counter) AS CountOfCounter
SELECT temptbl1.Age, temptbl1.Gender, Count(temptbl1.Counter) AS [Total Of Counter]
FROM temptbl1
GROUP BY temptbl1.Age, temptbl1.Gender
PIVOT IIf(IsNull([CountyofResidence]),Null,[CountyOfResidence] & " " & [PhysicalState]);