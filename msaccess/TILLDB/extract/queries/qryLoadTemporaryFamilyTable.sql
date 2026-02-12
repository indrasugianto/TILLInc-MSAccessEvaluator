SELECT tblPeopleFamily.IndexedName, tblPeopleFamily.ClientIndexedName, tblPeopleFamily.Guardian INTO temptbl
FROM tblPeople INNER JOIN tblPeopleFamily ON tblPeople.IndexedName = tblPeopleFamily.ClientIndexedName
WHERE (((tblPeopleFamily.ClientIndexedName)=tblPeople.IndexedName) And ((tblPeopleFamily.Inactive)=False) And ((tblPeople.IsDeceased)=False) And ((tblPeople.IsFamilyGuardian)=True));