SELECT DISTINCTROW [MIS Personnel].ADPName, [MIS Personnel].BirthDate AS BirthDate, [MIS Personnel].ADPFile, [MIS Personnel].Closed, [MIS Personnel].TerminationDate, Format([BirthDate],"mm") AS [Month], Format([BirthDate],"dd") AS [Day], Format([BirthDate],"yyyy") AS [Year], Format(DateDiff("d",[BirthDate],Now())/365,"#.0") AS Years, Format([BirthDate],"mmmm") AS TheMonth
FROM [MIS Personnel]
WHERE ((([MIS Personnel].ADPFile)>5) AND (([MIS Personnel].Closed)=False) AND (([MIS Personnel].TerminationDate) Is Null))
ORDER BY [MIS Personnel].ADPName;