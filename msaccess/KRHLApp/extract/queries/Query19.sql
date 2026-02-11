SELECT [>Part List].ProcessComponent, [>Part List].ProcessActivity, [>Part List].ProcessCost, Components.Component, Activity.Activity, [>Part List].ProcessActivityCost, [>Part List].ItemNumber
FROM ([>Part List] INNER JOIN Components ON [>Part List].ProcessComponent = Components.key) INNER JOIN Activity ON [>Part List].ProcessActivity = Activity.Key
WHERE ((([>Part List].ProcessActivity)<>0) AND (([>Part List].ProcessCost)=0))
ORDER BY [>Part List].ProcessComponent, [>Part List].ProcessActivity;