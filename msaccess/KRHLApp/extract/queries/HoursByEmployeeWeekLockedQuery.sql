SELECT DISTINCTROW [MIS Hours].Employee, [MIS Hours].Date, Sum([MIS Hours].Hours) AS SumOfHours, Sum([MIS Hours].Monday) AS SumOfMonday, Sum([MIS Hours].Tuesday) AS SumOfTuesday, Sum([MIS Hours].Wednesday) AS SumOfWednesday, Sum([MIS Hours].Thursday) AS SumOfThursday, Sum([MIS Hours].Friday) AS SumOfFriday, Sum([MIS Hours].Saturday) AS SumOfSaturday, Sum([MIS Hours].Sunday) AS SumOfSunday
FROM [MIS Hours]
GROUP BY [MIS Hours].Employee, [MIS Hours].Date
HAVING ((([MIS Hours].Employee)=Forms!HoursEntryLocked!EmpName) And (([MIS Hours].Date)=Forms!HoursEntryLocked!Week));