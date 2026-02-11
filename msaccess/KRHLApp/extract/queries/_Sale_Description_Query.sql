SELECT DISTINCTROW [Sales Journal].Description, Count([>Jobs].ID) AS CountOfID, Last([>Jobs].ID) AS LastOfID, Last([Sales Journal].EntryDate) AS LastOfEntryDate
FROM [Sales Journal] LEFT JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key
WHERE ((([Sales Journal].EntryDate)>Year(Date())-2))
GROUP BY [Sales Journal].Description
HAVING ((([Sales Journal].Description) Is Not Null))
ORDER BY [Sales Journal].Description;