SELECT DISTINCTROW [>Correspondence].Name, [>Correspondence].Correspondence, [>Correspondence].Key, [>Correspondence].ID, [>Correspondence].Date, [>Correspondence].UserName, [>Correspondence].PrimaryKey, [>Correspondence].Description
FROM [>Correspondence]
WHERE ((([>Correspondence].Name)=forms!ProductListMaster.Form.ProductListControl!Key) And (([>Correspondence].Description)="ProductList"));