INSERT INTO [~TempSuperCodes] ( GPCode, GPSuperCode )
SELECT tblStaff.DEPRTMNT, tblStaff.SUPERVISORCODE_I
FROM tblStaff
WHERE (((tblStaff.DIVISIONCODE_I) = 'RESIDE') AND ((tblStaff.JobTitle) = 'RESUNT')) OR 
(((tblStaff.DIVISIONCODE_I) = 'RESIDE') And ((tblStaff.JobTitle) = 'RESUPR')) OR 
(((tblStaff.DIVISIONCODE_I) = 'DAYHAB') And ((tblStaff.JobTitle) = 'DASUPR'))
ORDER BY tblStaff.DEPRTMNT;