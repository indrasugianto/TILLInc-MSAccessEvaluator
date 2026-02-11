SELECT Sum(EstimateTrend.Trend3Amount) AS Profit, EstimateTrend.Trend1Job AS Employee
FROM EstimateTrend
GROUP BY EstimateTrend.Trend1Job, EstimateTrend.TrendDate
HAVING (((EstimateTrend.TrendDate) Is Not Null))
ORDER BY Sum(EstimateTrend.Trend3Amount) DESC;