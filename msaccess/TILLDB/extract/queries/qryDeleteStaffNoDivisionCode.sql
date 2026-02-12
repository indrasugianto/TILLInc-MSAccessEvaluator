DELETE tblStaff.*
FROM tblStaff
WHERE tblStaff.DIVISIONCODE_I Is Null OR Len(tblStaff.DIVISIONCODE_I) = 0;