SELECT DISTINCTROW [Purchase Journal].EntryDate
FROM [Purchase Journal]
GROUP BY [Purchase Journal].EntryDate
ORDER BY [Purchase Journal].EntryDate DESC;