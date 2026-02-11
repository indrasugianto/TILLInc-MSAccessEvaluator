SELECT DISTINCTROW [>Resources].ID, [>Resources].Category, [>Resources].Key
FROM [>Resources]
WHERE ((([>Resources].Category)=Forms!BankAccount.PayeeCategory))
ORDER BY [>Resources].Category, [>Resources].ID;