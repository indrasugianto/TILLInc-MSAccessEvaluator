SELECT tblPeopleClientsMonthlyMaster.*
FROM tblPeopleClientsMonthlyMaster
WHERE (((tblPeopleClientsMonthlyMaster.ProgramCity)=Forms!frmMainMenu!SelectedCity) And ((tblPeopleClientsMonthlyMaster.ProgramLocation)=Forms!frmMainMenu!SelectedProgram));