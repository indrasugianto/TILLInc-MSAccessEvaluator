SELECT Sum([Hours]*[DesignRate]) AS PreviousDesignCost, [>Jobs].Key, Min([MIS Hours].Date) AS PreviousDate
FROM [>Jobs] LEFT JOIN ([MIS Hours] LEFT JOIN [>Design Rate] ON [MIS Hours].Employee=[>Design Rate].Designer) ON [>Jobs].Key=[MIS Hours].[Job ID]
WHERE ((([MIS Hours].Date)<Forms!Sales!FromDate))
GROUP BY [>Jobs].Key
HAVING ((([>Jobs].Key)=forms!Sales!thejobname));