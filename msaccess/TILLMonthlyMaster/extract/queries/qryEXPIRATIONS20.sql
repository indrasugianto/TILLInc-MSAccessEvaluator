SELECT temptbl1.*, DLookUp("Skill","catSkills","SkillID=" & [SKILLNUMBER_I]) AS SkillDesc INTO temptbl2
FROM temptbl1;