SELECT DISTINCTROW [>Settings].CNCMachines
FROM [>Settings]
GROUP BY [>Settings].CNCMachines
HAVING ((([>Settings].CNCMachines)<>""))
ORDER BY [>Settings].CNCMachines;