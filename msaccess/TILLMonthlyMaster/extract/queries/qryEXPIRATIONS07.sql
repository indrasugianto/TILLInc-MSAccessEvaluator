UPDATE temptbl SET temptbl.GPSuperCode = DLookUp("GPSuperCode","~TempSuperCodes","GPCode='" & [temptbl].[GPName] & "'")
WHERE ((([temptbl].[GPSuperCode]) Is Null));