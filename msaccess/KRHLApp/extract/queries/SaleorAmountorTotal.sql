SELECT [>Jobs].Key, [>Jobs].ID, IIf([family],Format([sumofamount],"#,#") & " Total",[saleorproposal]) AS Total, SalesSummarybyJob.MaxOfTheDate
FROM (SalesSummarybyJob RIGHT JOIN [>Jobs] ON SalesSummarybyJob.Key=[>Jobs].Key) LEFT JOIN Children ON [>Jobs].Key=Children.theParent
ORDER BY [>Jobs].ID;