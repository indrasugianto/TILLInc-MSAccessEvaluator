SELECT YESort.sort, Sum(YEProof101Cash.[101Cash]) AS SumOf101Cash, Max(YEProof101Cash.Balance) AS MaxOfBalance, Sum(YEProof101Cash.NetActivity) AS SumOfNetActivity
FROM YESort LEFT JOIN YEProof101Cash ON YESort.sort=YEProof101Cash.Sort
GROUP BY YESort.sort;