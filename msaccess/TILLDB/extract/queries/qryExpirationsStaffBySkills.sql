TRANSFORM First(qryExpirationsStaffCull.EXPIREDSKILL_I) AS FirstOfEXPIREDSKILL_I
SELECT qryExpirationsStaffCull.DEPRTMNT, qryExpirationsStaffCull.LASTNAME, qryExpirationsStaffCull.FRSTNAME, qryExpirationsStaffCull.JOBTITLE
FROM qryExpirationsStaffCull
GROUP BY qryExpirationsStaffCull.DEPRTMNT, qryExpirationsStaffCull.LASTNAME, qryExpirationsStaffCull.FRSTNAME, qryExpirationsStaffCull.JOBTITLE
PIVOT qryExpirationsStaffCull.SkillDesc;