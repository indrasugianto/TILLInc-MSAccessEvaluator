DELETE tblStaffDedhamManagers.*, tblPeopleStaffSupervisors.STAFFCOUNT
FROM tblPeopleStaffSupervisors INNER JOIN tblStaffDedhamManagers ON tblPeopleStaffSupervisors.SUPERVISORCODE_I = tblStaffDedhamManagers.SUPERVISORCODE_I
WHERE (((tblPeopleStaffSupervisors.STAFFCOUNT)=0));