SELECT eMail.email AS Email, [>Resources].ID AS Company, [>Resources].State AS State, [>Resources].Comment
FROM eMail LEFT JOIN [>Resources] ON eMail.ResourceKey=[>Resources].Key
WHERE (((eMail.email)<>"") AND (([>Resources].Comment)<>"") AND ((eMail.UnSubscribe)=False))
ORDER BY [>Resources].Comment, [>Resources].ID;