SELECT DISTINCT tblTILLMonthlyMaster.ProgramLocation AS Expr1
FROM tblTILLMonthlyMaster
WHERE (((tblTILLMonthlyMaster.ProgramCity)=[Forms]![frmMainMenu]![SelectedCity]))
ORDER BY tblTILLMonthlyMaster.ProgramLocation;