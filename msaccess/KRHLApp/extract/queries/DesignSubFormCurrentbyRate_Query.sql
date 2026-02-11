SELECT Sum([Hours]*[DesignRate]) AS CurrentDesignCost, [>Jobs].Key
FROM [>Jobs] LEFT JOIN ([MIS Hours] LEFT JOIN [>Design Rate] ON [MIS Hours].Employee=[>Design Rate].Designer) ON [>Jobs].Key=[MIS Hours].[Job ID]
WHERE ((([MIS Hours].Date)>=Forms!Sales!FromDate And ([MIS Hours].Date)<=Forms!Sales!ToDate))
GROUP BY [>Jobs].Key
HAVING ((([>Jobs].Key)=forms!Sales!thejobname));