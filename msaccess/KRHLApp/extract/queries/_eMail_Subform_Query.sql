SELECT DISTINCTROW eMail.*
FROM eMail
WHERE (((eMail.ResourceKey)=Forms!Resources.Key))
ORDER BY eMail.email, eMail.ContactName
WITH OWNERACCESS OPTION;