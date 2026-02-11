SELECT DISTINCT [>Jobs].ID, [Sales Journal].Job AS TheJob, Max([Sales Journal].Due) AS MaxOfDue
FROM [Sales Journal] RIGHT JOIN [>Jobs] ON [Sales Journal].Job=[>Jobs].Key
WHERE ((([Sales Journal].InvoiceAmount)<>0))
GROUP BY [>Jobs].ID, [Sales Journal].Job, [>Jobs].Family
HAVING ((([Sales Journal].Job)=forms!Sales!TheJobName) And ((Max([Sales Journal].Due)) Is Not Null) And (([>Jobs].Family)=False))
ORDER BY [>Jobs].ID;