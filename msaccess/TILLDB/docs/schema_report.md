# Schema Report: TILLDB
---
## Tables
### catLogonAs
| Column | Type | Size |
|--------|------|------|
| LogonAs | VARCHAR | 255 |

**Row count:** 0

### RedReport
| Column | Type | Size |
|--------|------|------|
| EMPID_I | VARCHAR | 8 |
| SKILLNUMBER_I | INTEGER | 10 |
| Skill | VARCHAR | 25 |
| EXPIREDSKILL_I | DATETIME | 19 |
| LASTNAME | VARCHAR | 30 |
| FRSTNAME | VARCHAR | 30 |
| StaffName | VARCHAR | 255 |
| LocationName | VARCHAR | 100 |
| SUPERVISORCODE_I | VARCHAR | 6 |
| SupervisorIndexedName | VARCHAR | 160 |
| SupervisorName | VARCHAR | 255 |
| RedFlag | BIT | 1 |
| OnLeave | BIT | 1 |

**Row count:** 0

### tblDBChangeHistoryOLD
| Column | Type | Size |
|--------|------|------|
| Version | VARCHAR | 12 |
| Date | DATETIME | 19 |
| Changes | LONGCHAR | 1073741823 |

**Row count:** 72

### tblLocationsDedhamManagers
| Column | Type | Size |
|--------|------|------|
| CityTown | VARCHAR | 50 |
| LocationName | VARCHAR | 80 |
| RecordAddedDate | VARCHAR | 19 |
| RecordAddedBy | VARCHAR | 20 |
| GPName | VARCHAR | 10 |
| Department | VARCHAR | 30 |
| CostCenter | VARCHAR | 4 |
| Cluster | SMALLINT | 5 |
| ABI | BIT | 1 |
| NumClients | SMALLINT | 5 |
| RESTILLOwned | BIT | 1 |
| ResCapacity | SMALLINT | 5 |
| EmailAddress | VARCHAR | 50 |
| Address | VARCHAR | 50 |
| City | VARCHAR | 25 |
| State | VARCHAR | 2 |
| ZIP | VARCHAR | 10 |
| County | VARCHAR | 20 |
| AddressValidated | BIT | 1 |
| PhoneNumber | VARCHAR | 15 |
| DID | INTEGER | 10 |
| SpeedDial | INTEGER | 10 |
| FaxNumber | VARCHAR | 15 |
| FaxEmailAddress | VARCHAR | 255 |
| DDSArea | VARCHAR | 40 |
| DDSRegion | VARCHAR | 20 |
| StaffPrimaryContactIndexedName | VARCHAR | 160 |
| StaffPrimaryContactLastName | VARCHAR | 25 |
| StaffPrimaryContactFirstName | VARCHAR | 25 |
| StaffPrimaryContactMiddleInitial | VARCHAR | 1 |
| Leader | BIT | 1 |
| LOTR | BIT | 1 |
| ManagerLogonID | VARCHAR | 40 |
| StaffSecondaryContactIndexedName | VARCHAR | 160 |
| StaffSecondaryContactLastName | VARCHAR | 25 |
| StaffSecondaryContactFirstName | VARCHAR | 25 |
| StaffSecondaryContactMiddleInitial | VARCHAR | 1 |
| StaffTertiaryContactIndexedName | VARCHAR | 160 |
| StaffTertiaryContactLastName | VARCHAR | 25 |
| StaffTertiaryContactFirstName | VARCHAR | 25 |
| StaffTertiaryContactMiddleInitial | VARCHAR | 1 |
| CommunityRNIndexedName | VARCHAR | 160 |
| CommmunityRNName | VARCHAR | 40 |
| LPN1IndexedName | VARCHAR | 160 |
| LPN1Name | VARCHAR | 40 |
| LPN2IndexedName | VARCHAR | 160 |
| LPN2Name | VARCHAR | 40 |
| LastVehicleChecklistCompleted | VARCHAR | 10 |
| MostRecentAsleepFireDrill | VARCHAR | 10 |
| NextRecentAsleepFireDrill | VARCHAR | 10 |
| DAYStaffTrainedInPrivacyBefore | VARCHAR | 10 |
| DAYAllPlansReviewedByStaffBefore | VARCHAR | 10 |
| DAYQtrlySafetyChecklistDueBy | VARCHAR | 10 |
| HouseSafetyPlanExpires | VARCHAR | 10 |
| HousePlansReviewedByStaffBefore | VARCHAR | 10 |
| MAPChecklistCompleted | VARCHAR | 10 |
| HumanRightsOfficer | VARCHAR | 50 |
| HROTrainsStaffBefore | VARCHAR | 10 |
| HROTrainsIndividualsBefore | VARCHAR | 10 |
| FireSafetyOfficer | VARCHAR | 50 |
| FSOTrainsStaffBefore | VARCHAR | 10 |
| FSOTrainsIndividualsBefore | VARCHAR | 10 |
| ReportExpirations | BIT | 1 |
| ResettlementCityTown | VARCHAR | 50 |
| ResettlementLocation | VARCHAR | 80 |
| Comments | LONGCHAR | 1073741823 |
| SSMA_TimeStamp | VARBINARY | 8 |

**Row count:** 0

### tblTILLMonthlyMasterArchive
| Column | Type | Size |
|--------|------|------|
| RecID | COUNTER | 10 |
| RecordUpdatedDate | VARCHAR | 10 |
| RecordUpdatedByUser | VARCHAR | 25 |
| NoChange | BIT | 1 |
| IndexedName | VARCHAR | 160 |
| ProgramType | VARCHAR | 15 |
| ProgramCity | VARCHAR | 50 |
| ProgramLocation | VARCHAR | 80 |
| StaffPrimaryContactLastName | VARCHAR | 25 |
| StaffPrimaryContactFirstName | VARCHAR | 25 |
| LastName | VARCHAR | 25 |
| FirstName | VARCHAR | 25 |
| MiddleInitial | VARCHAR | 1 |
| ClientIsDeceased | BIT | 1 |
| ClientIsDeceasedChanged | BIT | 1 |
| ClientDeceasedDate | VARCHAR | 10 |
| ClientDeceasedDateChanged | BIT | 1 |
| ClientIsInactive | BIT | 1 |
| ClientIsInactiveChanged | BIT | 1 |
| PhysicalAddress | VARCHAR | 50 |
| PhysicalAddressChanged | BIT | 1 |
| PhysicalCity | VARCHAR | 25 |
| PhysicalCityChanged | BIT | 1 |
| PhysicalState | VARCHAR | 2 |
| PhysicalStateChanged | BIT | 1 |
| PhysicalZIP | VARCHAR | 10 |
| PhysicalZIPChanged | BIT | 1 |
| MailingAddress | VARCHAR | 50 |
| MailingAddressChanged | BIT | 1 |
| MailingCity | VARCHAR | 25 |
| MailingCityChanged | BIT | 1 |
| MailingState | VARCHAR | 2 |
| MailingStateChanged | BIT | 1 |
| MailingZIP | VARCHAR | 10 |
| MailingZIPChanged | BIT | 1 |
| HomePhone | VARCHAR | 15 |
| HomePhoneChanged | BIT | 1 |
| WorkPhone | VARCHAR | 15 |
| WorkPhoneChanged | BIT | 1 |
| MobilePhone | VARCHAR | 15 |
| MobilePhoneChanged | BIT | 1 |
| EmailAddress | VARCHAR | 60 |
| EmailAddressChanged | BIT | 1 |
| ResidentialVendor | VARCHAR | 30 |
| ResidentialVendorChanged | BIT | 1 |
| ResVendorAddress | VARCHAR | 40 |
| ResVendorAddressChanged | BIT | 1 |
| ResVendorCity | VARCHAR | 25 |
| ResVendorCityChanged | BIT | 1 |
| ResVendorState | VARCHAR | 2 |
| ResVendorStateChanged | BIT | 1 |
| ResVendorZIP | VARCHAR | 10 |
| ResVendorZIPChanged | BIT | 1 |
| ResidentialVendorPhoneNumber | VARCHAR | 15 |
| ResidentialVendorPhoneNumberChanged | BIT | 1 |
| LivingWithParentOrGuardian | BIT | 1 |
| LivingWithParentOrGuardianChanged | BIT | 1 |
| LivingIndependently | BIT | 1 |
| LivingIndependentlyChanged | BIT | 1 |
| DayVendor | VARCHAR | 30 |
| DayVendorChanged | BIT | 1 |
| DayVendorAddress | VARCHAR | 40 |
| DayVendorAddressChanged | BIT | 1 |
| DayVendorCity | VARCHAR | 25 |
| DayVendorCityChanged | BIT | 1 |
| DayVendorState | VARCHAR | 2 |
| DayVendorStatechanged | BIT | 1 |
| DayVendorZIP | VARCHAR | 10 |
| DayVendorZIPChanged | BIT | 1 |
| DayVendorPhoneNumber | VARCHAR | 15 |
| DayVendorPhoneNumberChanged | BIT | 1 |
| PCPName | VARCHAR | 50 |
| PCPNameChanged | BIT | 1 |
| PCPOffice | VARCHAR | 50 |
| PCPOfficeChanged | BIT | 1 |
| PCPAddress | VARCHAR | 50 |
| PCPAddressChanged | BIT | 1 |
| PCPCity | VARCHAR | 25 |
| PCPCityChanged | BIT | 1 |
| PCPState | VARCHAR | 2 |
| PCPStateChanged | BIT | 1 |
| PCPZIP | VARCHAR | 10 |
| PCPZIPChanged | BIT | 1 |
| PCPPhoneNumber | VARCHAR | 15 |
| PCPPhoneNumberchanged | BIT | 1 |
| PCPFaxNumber | VARCHAR | 15 |
| PCPFaxNumberChanged | BIT | 1 |
| PCPEmailAddress | VARCHAR | 60 |
| PCPEmailAddressChanged | BIT | 1 |
| PCPHospitalAffiliation | VARCHAR | 50 |
| PCPHospitalAffiliationChanged | BIT | 1 |
| PCPNPI | VARCHAR | 10 |
| PCPNPIChanged | BIT | 1 |
| FamilyLN | VARCHAR | 25 |
| FamilyFN | VARCHAR | 25 |
| FamilyMI | VARCHAR | 1 |
| FamilyIsDeceased | BIT | 1 |
| FamilyIsDeceasedChanged | BIT | 1 |
| FamilyDeceasedDate | VARCHAR | 10 |
| FamilyDeceasedDateChanged | BIT | 1 |
| FamilyIsInactive | BIT | 1 |
| FamilyIsInactiveChanged | BIT | 1 |
| FamilyPhysicalAddress | VARCHAR | 50 |
| FamilyPhysicalAddressChanged | BIT | 1 |
| FamilyPhysicalCity | VARCHAR | 25 |
| FamilyPhysicalCityChanged | BIT | 1 |
| FamilyPhysicalState | VARCHAR | 2 |
| FamilyPhysicalStateChanged | BIT | 1 |
| FamilyPhysicalZIP | VARCHAR | 10 |
| FamilyPhysicalZIPChanged | BIT | 1 |
| FamilyMailingAddress | VARCHAR | 50 |
| FamilyMailingAddressChanged | BIT | 1 |
| FamilyMailingCity | VARCHAR | 25 |
| FamilyMailingCityChanged | BIT | 1 |
| FamilyMailingState | VARCHAR | 2 |
| FamilyMailingStateChanged | BIT | 1 |
| FamilyMailingZIP | VARCHAR | 10 |
| FamilyMailingZIPChanged | BIT | 1 |
| FamilyHomePhone | VARCHAR | 15 |
| FamilyHomePhoneChanged | BIT | 1 |
| FamilyWorkPhone | VARCHAR | 15 |
| FamilyWorkPhoneChanged | BIT | 1 |
| FamilyMobilePhone | VARCHAR | 15 |
| FamilyMobilePhoneChanged | BIT | 1 |
| FamilyEmailAddress | VARCHAR | 60 |
| FamilyEmailAddressChanged | BIT | 1 |
| Relationship | VARCHAR | 30 |
| RelationshipChanged | BIT | 1 |
| Guardian | BIT | 1 |
| GuardianChanged | BIT | 1 |
| PrimaryContact | BIT | 1 |
| PrimaryContactChanged | BIT | 1 |
| DateISP | VARCHAR | 10 |
| DateISPChanged | BIT | 1 |
| DateConsentFormsSigned | VARCHAR | 10 |
| DateConsentFormsSignedChanged | BIT | 1 |
| DateBMMAccessSigned | VARCHAR | 10 |
| DateBMMAccessSignedChanged | BIT | 1 |
| DateSPDAuthExpires | VARCHAR | 10 |
| DateSPDAuthExpiresChanged | BIT | 1 |
| LastUpdated | VARCHAR | 10 |
| RemoveThisFamilyMember | BIT | 1 |
| RemoveThisFamilyMemberChanged | BIT | 1 |
| Comments | LONGCHAR | 1073741823 |
| Processed | BIT | 1 |
| Applied | BIT | 1 |
| ProcessedBy | VARCHAR | 25 |

**Row count:** 4712

## Relationships
No relationships extracted.

## Queries
### Query1
```sql
SELECT temptbl6.EMPID_I, temptbl6.SKILLNUMBER_I, temptbl6.Skill, temptbl6.EXPIREDSKILL_I, temptbl6.LASTNAME, temptbl6.FRSTNAME, [temptbl6].[FRSTNAME] & ' ' & [temptbl6].[LASTNAME] AS StaffName, temptbl6.LocationName, temptbl6.SUPERVISORCODE_I, temptbl6.SupervisorIndexedName, temptbl6.SupervisorName, temptbl6.RedFlag, temptbl6.OnLeave INTO temptbl8

FROM temptbl6

WHERE (((temptbl6.RedFlag) = True));
```
### qryAppendDeletedPerson
```sql
INSERT INTO tblDELETEDPeople ( IndexedName, RecordDeletedDate, RecordDeletedBy, Salutation, LastName, FirstName, MiddleInitial, CompanyOrganization, Title, FamiliarGreeting, PhysicalAddress, PhysicalCity, PhysicalState, PhysicalZIP, PhysicalAddressValidated, CongressionalDistrict, MailingAddress, MailingCity, MailingState, MailingZIP, MailingAddressValidated, HomePhone, WorkPhone, MobilePhone, EmailAddress, OfficeCityTown, OfficeLocationName, GPSuperCode, StaffTitle, Department, SigningAuthority...
```
### qryAutismIndividualsAndFamilyForDDS
```sql
SELECT tblPeople_1.LastName AS ClientLastName, tblPeople_1.FirstName AS ClientFirstName, tblPeople_1.MiddleInitial AS ClientMiddleInitial, tblPeople_1.PhysicalAddress AS ClientPhysicalAddress, tblPeople_1.PhysicalCity AS ClientPhysicalCity, tblPeople_1.PhysicalState AS ClientPhysicalState, tblPeople_1.PhysicalZIP AS ClientPhysicalZIP, tblPeople_1.HomePhone AS ClientHomePhone, tblPeople_1.WorkPhone AS ClientWorkPhone, tblPeople_1.MobilePhone AS ClientMobilePhone, tblPeople_1.EmailAddress AS Clien...
```
### qryAutismServicesRawDemographics_Crosstab
```sql
TRANSFORM Count(temptbl1.Counter) AS CountOfCounter

SELECT temptbl1.Age, temptbl1.Gender, Count(temptbl1.Counter) AS [Total Of Counter]

FROM temptbl1

GROUP BY temptbl1.Age, temptbl1.Gender

PIVOT IIf(IsNull([CountyofResidence]),Null,[CountyOfResidence] & " " & [PhysicalState]);
```
### qryCONINWORKS
```sql
SELECT tblContracts.ContractID, tblContractsBillingBook.BIllingBookNumber, tblContracts.ActivityCode, tblContracts.GPNumber, tblContracts.State, tblContracts.UnitRate, tblContracts.Units AS ContractUnits, tblContracts.MaximumObligation AS ContractMaximumObligation, tblContracts.MaximumObligationAsAmended, tblContracts.TotalClients, tblContracts.TotalUnits, tblContracts.TotalUnitsAsAmended, tblContractsBillingBook.ProgramName, tblContractsBillingBook.CostCenter, tblContractsBillingBook.MaximumObl...
```
### qryCONINWORKSExport
```sql
UPDATE [~CONINWORKSSummary] SET [~CONINWORKSSummary].FY = [Forms]![frmMainMenu]![SelectFY], [~CONINWORKSSummary].NumLocations = DCount("ContractID","qryCONINWORKS","ContractID=""" & [~CONINWORKSSummary].[ContractID] & """"), [~CONINWORKSSummary].DDSMaxObligation = DLookUp("MaximumObligation","qryCurrentFYContracts","ContractID=""" & [~CONINWORKSSummary].[ContractID] & """"), [~CONINWORKSSummary].Units = DLookUp("TotalUnits","qryCurrentFYContracts","ContractID=""" & [~CONINWORKSSummary].[Contract...
```
### qryCensus
```sql
SELECT tblLocations.CityTown, tblLocations.LocationName, tblLocations.Address, tblLocations.City, tblLocations.State, tblLocations.ZIP, tblLocations.County, tblLocations.NumClients

FROM tblLocations

WHERE (tblLocations.NumClients>0 AND tblLocations.Department='Residential Services') OR (tblLocations.City<>'Dedham' AND tblLocations.NumClients>0 AND tblLocations.Department='Individualized Support Options');
```
### qryClientFamilyMailing
```sql
SELECT temptbl0.LastName AS LN, temptbl0.FirstName AS FN, temptbl0.MiddleInitial AS MI, temptbl0.CompanyOrganization AS CO, temptbl0.FamiliarGreeting AS FamilyFamiliarGreeting, temptbl0.MailingAddress AS MailingAddress, temptbl0.MailingCity AS MailingCity, temptbl0.MailingState AS MailingState, temptbl0.MailingZIP AS MailingZIP, temptbl0.IsFamilyGuardian, temptbl0.IsDonor, temptbl0.IsInterestedParty, temptbl0.IsConsultant, temptbl0.InterestedPartyCategory, temptbl0.InterestedPartyInactive, tempt...
```
### qryClientGovernmentAccounts
```sql
SELECT tblPeople.LastName, tblPeople.FirstName, tblPeopleClientsDemographics.DateOfBirth, tblPeople.ResLocation, tblPeopleClientsDemographics.SocialSecurityNumber, tblPeopleClientsDemographics.MedicaidNumber, tblPeopleClientsDemographics.MedicareNumber, tblPeopleClientsDemographics.FoodStampsCardNumber

FROM (tblPeople INNER JOIN tblPeopleClientsDemographics ON tblPeople.IndexedName = tblPeopleClientsDemographics.IndexedName) LEFT JOIN tblPeopleClientsResidentialServices ON tblPeople.IndexedName...
```
### qryCopyDeletedAdultCoaching
```sql
INSERT INTO tblDELETEDPeopleClientsAdultCoaching ( IndexedName, RecordDeletedDate, RecordDeletedBy, CityTown, Location, ContractNumber, ActivityCode, ContractNumber2, ActivityCode2, StartDate, EndDate, TerminationReason, CaseManager, FundingSource, Provider, Inactive, DateInactive )

SELECT tblPeopleClientsAdultCoaching.IndexedName, [Forms]![frmMainMenu]![TodaysDate] AS RecordDeletedDate, [Forms]![frmMainMenu]![UserName] AS RecordDeletedBy, tblPeopleClientsAdultCoaching.CityTown, tblPeopleClient...
```
### qryCopyDeletedAdultCompanion
```sql
INSERT INTO tblDELETEDPeopleClientsAdultCompanion ( IndexedName, RecordDeletedDate, RecordDeletedBy, CityTown, Location, ContractNumber, ActivityCode, ContractNumber2, ActivityCode2, StartDate, EndDate, TerminationReason, CaseManager, FundingSource, Provider, Inactive, DateInactive )

SELECT tblPeopleClientsAdultCompanion.IndexedName, [Forms]![frmMainMenu]![TodaysDate] AS RecordDeletedDate, [Forms]![frmMainMenu]![UserName] AS RecordDeletedBy, tblPeopleClientsAdultCompanion.CityTown, tblPeopleCli...
```
### qryCopyDeletedAutism
```sql
INSERT INTO tblDELETEDPeopleClientsAutismServices ( IndexedName, RecordDeletedDate, RecordDeletedBy, Age, DDSArea, DateOfReferral, ReasonForReferral, GeneralDiagnosis, Diagnosis, GeneralReferralSource, ReferralSource, SupportBrokerLastName, SupportBrokerFirstName, SupportBrokerMiddleInitial, CurrentAutismWaiverClient, AutismWaiverStartDate, AutismWaiverEndDate, FormerAutismWaiverClient, Comments, Inactive, DateInactive )

SELECT tblPeopleClientsAutismServices.IndexedName, [Forms]![frmMainMenu]![...
```
### qryCopyDeletedCLO
```sql
INSERT INTO tblDELETEDPeopleClientsCLOServices ( IndexedName, RecordDeletedDate, RecordDeletedBy, CityTown, Location, StartDate, EndDate, TerminationReason, Funding, ContractNumber, ActivityCode, ContractNumber2, ActivityCode2, Portion, RoomAndBoard, RNHoursAtResidence, LPNHoursAtResidence, Section8, WaitListSection8, WaitListSection8Date, DateInspected, Section8Review, PassFail, ResidentialRate, ClientContribution, HousingAuthorityCaseManager, HousingAuthorityOffice, HousingAuthorityAddress, Ho...
```
### qryCopyDeletedClientDemographics
```sql
INSERT INTO tblDELETEDPeopleClientsDemographics ( IndexedName, RecordDeletedDate, RecordDeletedBy, LegalName, CountyOfResidence, SocialSecurityNumber, Gender, Race, DateOfBirth, Age, MaritalStatus, LegalStatus, GuardianshipPapersOnFile, VisuallyImpaired, HearingImpaired, UsesWheelchair, UsesWalker, DateISP, DateConsentFormsSigned, DateBMMExpires, DateBMMAccessSignedHRC, DateBMMAccessSigned, DateSPDAuthExpires, DateSPDSignedHRC, DateSPDSigned, DateSignaturesDueBy, AllSPDSignaturesReceived, Active...
```
### qryCopyDeletedClientVendors
```sql
INSERT INTO tblDELETEDPeopleClientsVendors ( IndexedName, RecordDeletedDate, RecordDeletedBy, ResidentialVendor, ResVendorAddress, ResVendorCity, ResVendorState, ResVendorZIP, ResidentialVendorPhoneNumber, ResVendorLocation, LivingWithParentOrGuardian, LivingIndependently, DayVendor, DayVendorAddress, DayVendorCity, DayVendorState, DayVendorZIP, DayVendorPhoneNumber, DayVendorLocation, PCPName, PCPOffice, PCPAddress, PCPCity, PCPState, PCPZIP, PCPPhoneNumber, PCPFaxNumber, PCPEmailAddress, PCPHo...
```
### qryCopyDeletedCommunityConnections
```sql
INSERT INTO tblDELETEDPeopleClientsCommunityConnectionsServices ( IndexedName, RecordDeletedDate, RecordDeletedBy, Bowlers, BowlingTeam, Inactive, DateInactive )

SELECT tblPeopleClientsCommunityConnectionsServices.IndexedName, [Forms]![frmMainMenu]![TodaysDate] AS RecordDeletedDate, [Forms]![frmMainMenu]![UserName] AS RecordDeletedBy, tblPeopleClientsCommunityConnectionsServices.Bowlers, tblPeopleClientsCommunityConnectionsServices.BowlingTeam, tblPeopleClientsCommunityConnectionsServices.Inact...
```
### qryCopyDeletedDay
```sql
INSERT INTO tblDELETEDPeopleClientsDayServices ( IndexedName, RecordDeletedDate, RecordDeletedBy, CityTown, LocationName, StartDate, EndDate, TerminationReason, Profile, Severity, IntensityLevel, MassHealthServiceLevel, ContractNumber, ActivityCode, ContractNumber2, ActivityCode2, Funding, STMBillingNumber, ICD10Code, DMRWrapHours, MMARSLine, Rate, MedicaidRate, DMRAnnual, MedicaidAnnual, MCBAmount, MRCAmount, OtherFundingAmount, Annual, ScoreVision, ScoreAuditory, ScoreMobility, ScoreCommunicat...
```
### qryCopyDeletedDonors
```sql
INSERT INTO tblDELETEDPeopleDonors ( IndexedName, [Index], RecordDeletedDate, RecordDeletedBy, DateOfDonation, DateReceived, DateThankYou, DonationType, SolicitationType, AppealCode, IsGrant, IsRestricted, DonationFrom, DonationFrom1Salutation, DonationFrom1FirstName, DonationFrom1LastName, DonationFrom2Salutation, DonationFrom2FirstName, DonationFrom2LastName, DonationFromCompany, Description, Amount, Inactive )

SELECT tblPeopleDonors.IndexedName, tblPeopleDonors.Index, [Forms]![frmMainMenu]![...
```
### qryCopyDeletedFamilyByClientName
```sql
INSERT INTO tblDELETEDPeopleFamily ( IndexedName, ClientIndexedName, RecordDeletedDate, RecordDeletedBy, ClientLastName, ClientFirstName, ClientMiddleInitial, Relationship, Guardian, PrimaryContact, Surrogate, RepPayee, Inactive )

SELECT tblPeopleFamily.IndexedName, tblPeopleFamily.ClientIndexedName, [Forms]![frmMainMenu]![TodaysDate] AS RecordDeletedDate, [Forms]![frmMainMenu]![UserName] AS RecordDeletedBy, tblPeopleFamily.ClientLastName, tblPeopleFamily.ClientFirstName, tblPeopleFamily.Client...
```
### qryCopyDeletedFamilyByFamilyName
```sql
INSERT INTO tblDELETEDPeopleFamily ( IndexedName, ClientIndexedName, RecordDeletedDate, RecordDeletedBy, ClientLastName, ClientFirstName, ClientMiddleInitial, Relationship, Guardian, PrimaryContact, Surrogate, RepPayee, Inactive )

SELECT tblPeopleFamily.IndexedName, tblPeopleFamily.ClientIndexedName, [Forms]![frmMainMenu]![TodaysDate] AS RecordDeletedDate, [Forms]![frmMainMenu]![UserName] AS RecordDeletedBy, tblPeopleFamily.ClientLastName, tblPeopleFamily.ClientFirstName, tblPeopleFamily.Client...
```
### qryCopyDeletedISS
```sql
INSERT INTO tblDELETEDPeopleClientsIndividualSupportServices ( IndexedName, RecordDeletedDate, RecordDeletedBy, CityTown, Location, ContractNumber, ActivityCode, ContractNumber2, ActivityCode2, CostCenter, StartDate, EndDate, TerminationReason, CaseManager, FundingSource, Provider, Inactive, DateInactive )

SELECT tblPeopleClientsIndividualSupportServices.IndexedName, [Forms]![frmMainMenu]![TodaysDate] AS RecordDeletedDate, [Forms]![frmMainMenu]![UserName] AS RecordDeletedBy, tblPeopleClientsInd...
```
### qryCopyDeletedNHDay
```sql
INSERT INTO tblDELETEDPeopleClientsNHDay ( IndexedName, RecordDeletedDate, RecordDeletedBy, CityTown, Location, StartDate, EndDate, TerminationReason, Funding, ContractNumber, ActivityCode, ContractNumber2, ActivityCode2, Rate, DMRAnnual, IntensityLevel, Inactive, DateInactive )

SELECT tblPeopleClientsNHDay.IndexedName, [Forms]![frmMainMenu]![TodaysDate] AS RecordDeletedDate, [Forms]![frmMainMenu]![UserName] AS RecordDeletedBy, tblPeopleClientsNHDay.CityTown, tblPeopleClientsNHDay.Location, tbl...
```
### qryCopyDeletedNHRes
```sql
INSERT INTO tblDELETEDPeopleClientsNHRes ( IndexedName, RecordDeletedDate, RecordDeletedBy, StartDate, EndDate, Funding, ResidentialRate, RoomAndBoard, ChargesForCare, ContractNumber, ActivityCode, ContractNumber2, ActivityCode2, Portion, CaseManager, Inactive, DateInactive )

SELECT tblDELETEDPeopleClientsNHRes.IndexedName, [Forms]![frmMainMenu]![TodaysDate] AS RecordDeletedDate, [Forms]![frmMainMenu]![UserName] AS RecordDeletedBy, tblDELETEDPeopleClientsNHRes.StartDate, tblDELETEDPeopleClients...
```
### qryCopyDeletedPCA
```sql
INSERT INTO tblDELETEDPeopleClientsPCAServices ( IndexedName, RecordDeletedDate, RecordDeletedBy, Age, ConsumerNumber, BillingCode, ARPlusNumber, Billing, IntakeAssessment, IntakeApplicationReceived, IntakeApprovedDate, AnnualAssessment, AnnualReminderSent, AnnualFormsSigned, SkillsTrainerLastName, SkillsTrainerFirstName, SkillsTrainerMiddleInitial, Surrogate, PANumber, DateOfServiceStart, DateOfServiceEnd, NoChange, DayHoursApproved, NightHoursApproved, VacationHoursApproved, RNAssigned, OtherH...
```
### qryCopyDeletedPCAContactNotes
```sql
INSERT INTO tblDELETEDPeopleClientsPCAServicesContactNotes ( IndexedName, RecordNumber, RecordDeletedDate, RecordDeletedBy, DateOfEntry, Staff, ContactType, BillCode, Units, Activity, Comments )

SELECT tblPeopleClientsPCAServicesContactNotes.IndexedName, tblPeopleClientsPCAServicesContactNotes.RecordNumber, [Forms]![frmMainMenu]![TodaysDate] AS RecordDeletedDate, [Forms]![frmMainMenu]![UserName] AS RecordDeletedBy, tblPeopleClientsPCAServicesContactNotes.DateOfEntry, tblPeopleClientsPCAServices...
```
### qryCopyDeletedResidential
```sql
INSERT INTO tblDELETEDPeopleClientsResidentialServices ( IndexedName, RecordDeletedDate, RecordDeletedBy, CityTown, Location, StartDate, EndDate, TerminationReason, RNHoursAtResidence, LPNHoursAtResidence, Section8, WaitListSection8, WaitListSection8Date, DateInspected, PassFail, Section8Review, IntensityLevel, ResidentialRate, ClientContribution, Funding, ContractNumber, ActivityCode, ContractNumber2, ActivityCode2, Portion, RoomAndBoard, PSSAmount, PSSStartDate, PSSEndDate, PSSHours, PSSRate, ...
```
### qryCopyDeletedSharedLiving
```sql
INSERT INTO tblDELETEDPeopleClientsSharedLivingServices ( IndexedName, RecordDeletedDate, RecordDeletedBy, CityTown, Location, ContractNumber, ActivityCode, ContractNumber2, ActivityCode2, CostCenter, StartDate, EndDate, TerminationReason, Portion, CaseManager, Inactive, DateInactive )

SELECT tblPeopleClientsSharedLivingServices.IndexedName, [Forms]![frmMainMenu]![TodaysDate] AS RecordDeletedDate, [Forms]![frmMainMenu]![UserName] AS RecordDeletedBy, tblPeopleClientsSharedLivingServices.CityTown...
```
### qryCopyDeletedSpringboard
```sql
INSERT INTO tblDELETEDPeopleClientsSpringboardServices ( IndexedName, RecordDeletedDate, RecordDeletedBy, CustomerID, Age, DateJoined, DateTerminated, ReasonForTermination, BeginBillingDate, GroupCode, LeaderIndexedName, Leader, Inactive, DateInactive )

SELECT tblPeopleClientsSpringboardServices.IndexedName, [Forms]![frmMainMenu]![TodaysDate] AS RecordDeletedDate, [Forms]![frmMainMenu]![UserName] AS RecordDeletedBy, tblPeopleClientsSpringboardServices.CustomerID, tblPeopleClientsSpringboardServ...
```
### qryCopyDeletedTRASE
```sql
INSERT INTO tblDELETEDPeopleClientsTRASEServices ( IndexedName, RecordDeletedDate, RecordDeletedBy, School, Inactive, DateInactive )

SELECT tblPeopleClientsTRASEServices.IndexedName, [Forms]![frmMainMenu]![TodaysDate] AS RecordDeletedDate, [Forms]![frmMainMenu]![UserName] AS RecordDeletedBy, tblPeopleClientsTRASEServices.School, tblPeopleClientsTRASEServices.Inactive, tblPeopleClientsTRASEServices.DateInactive

FROM tblPeopleClientsTRASEServices

WHERE (((tblPeopleClientsTRASEServices.IndexedNa...
```
### qryCopyDeletedTransportation
```sql
INSERT INTO tblDELETEDPeopleClientsTransportationServices ( IndexedName, RecordDeletedDate, RecordDeletedBy, Company, PhoneNumber, RouteNumber, FundingSource, ContractNumber, ActivityCode, ContractNumber2, ActivityCode2, DDSFunding, Comments, Inactive, DateInactive )

SELECT tblPeopleClientsTransportationServices.IndexedName, [Forms]![frmMainMenu]![TodaysDate] AS RecordDeletedDate, [Forms]![frmMainMenu]![UserName] AS RecordDeletedBy, tblPeopleClientsTransportationServices.Company, tblPeopleClien...
```
### qryCopyDeletedVocational
```sql
INSERT INTO tblDELETEDPeopleClientsVocationalServices ( IndexedName, RecordDeletedDate, RecordDeletedBy, CityTown, Location, StartDate, EndDate, TerminationReason, Funding, ContractNumber, ActivityCode, ContractNumber2, ActivityCode2, Rate, DMRAnnual, IntensityLevel, Inactive, DateInactive )

SELECT tblPeopleClientsVocationalServices.IndexedName, [Forms]![frmMainMenu]![TodaysDate] AS RecordDeletedDate, [Forms]![frmMainMenu]![UserName] AS RecordDeletedBy, tblPeopleClientsVocationalServices.CityTo...
```
### qryCreateAllPeopleTable
```sql
SELECT LastName & ', ' & FirstName & ' ' & IIf(Len(MiddleInitial) > 0, MiddleInitial, '') AS Person, FirstName & ' ' & IIf(Len(MiddleInitial) <= 0, '', MiddleInitial & ' ') & LastName AS PersonByFirstName, tblPeople.* INTO AllPeopleRecords

FROM tblPeople

WHERE Left(IndexedName, 3) <> '///'

ORDER BY tblPeople.IndexedName;
```
### qryCreateTempCompaniesLookup
```sql
SELECT DISTINCT tblPeople.CompanyOrganization, tblPeople.IndexedName, Len([CompanyOrganization]) AS Crit INTO temptbl0

FROM tblPeople

WHERE (((Len([CompanyOrganization])) > 0))

ORDER BY tblPeople.CompanyOrganization;
```
### qryCurrentFYContracts
```sql
SELECT tblContracts.*

FROM tblContracts

WHERE (((tblContracts.FY)=[Forms]![frmRptFinancialAndLetters]![MRFY]));
```
### qryDDSMaxObligation
```sql
SELECT tblContracts.ContractID, tblContracts.FY, IIf(Left([tblContracts]![ContractID],1)="1" Or Left([tblContracts]![ContractID],2)="IN","DDS","Non-DDS"), tblContracts.MaximumObligationAsAmended

FROM tblContracts

WHERE (((tblContracts.FY)=Forms!frmRptFinancialAndLetters!MRFY) And ((IIf(Left(tblContracts!ContractID,1)="1" Or Left(tblContracts!ContractID,2)="IN","DDS","Non-DDS"))="DDS"));
```
### qryDeleteCorruptedPeopleRecords
```sql
DELETE tblPeople.*

FROM tblPeople

WHERE tblPeople.IndexedName = '///'

    OR (

        tblPeople.LastName IS NULL

        AND tblPeople.FirstName IS NOT NULL

        AND tblPeople.CompanyOrganization IS NULL

    )

    OR (

        tblPeople.FirstName IS NULL

        AND tblPeople.LastName IS NOT NULL

        AND tblPeople.CompanyOrganization IS NULL

    );
```
### qryDeleteNullPeople
```sql
DELETE tblPeople.*, tblPeople.IndexedName

FROM tblPeople

WHERE (((tblPeople.IndexedName)='///'));
```
### qryDeletePhoneDirectory
```sql
DELETE tblPhoneDirectory.*

FROM tblPhoneDirectory;
```
### qryDeleteSkillsNotTracked
```sql
DELETE tblStaffSkills.*

FROM tblStaffSkills

WHERE tblStaffSkills.SKILLNUMBER_I <>1 And 

tblStaffSkills.SKILLNUMBER_I <>2 And 

tblStaffSkills.SKILLNUMBER_I <>3 And 

tblStaffSkills.SKILLNUMBER_I <>35 And 

tblStaffSkills.SKILLNUMBER_I <>15 And 

tblStaffSkills.SKILLNUMBER_I <>22 And 

tblStaffSkills.SKILLNUMBER_I <>30 And 

tblStaffSkills.SKILLNUMBER_I <>31 And 

tblStaffSkills.SKILLNUMBER_I <>32 And 

tblStaffSkills.SKILLNUMBER_I <>33 And 

tblStaffSkills.SKILLNUMBER_I <>34 And 

tblStaffSki...
```
### qryDeleteStaffNoDivisionCode
```sql
DELETE tblStaff.*

FROM tblStaff

WHERE tblStaff.DIVISIONCODE_I Is Null OR Len(tblStaff.DIVISIONCODE_I) = 0;
```
### qryDeleteSupervisorsWithNoStaff
```sql
DELETE tblStaffDedhamManagers.*, tblPeopleStaffSupervisors.STAFFCOUNT

FROM tblPeopleStaffSupervisors INNER JOIN tblStaffDedhamManagers ON tblPeopleStaffSupervisors.SUPERVISORCODE_I = tblStaffDedhamManagers.SUPERVISORCODE_I

WHERE (((tblPeopleStaffSupervisors.STAFFCOUNT)=0));
```
### qryDonations
```sql
SELECT tblPeople.IndexedName, tblPeople.FirstName, tblPeople.LastName, tblPeople.CompanyOrganization, tblPeople.IsDeceased, tblPeopleDonors.Inactive, tblPeopleDonors.DateOfDonation, DateValue([DateOfDonation]) AS DateofDonationNumeric, tblPeopleDonors.DonationType, tblPeopleDonors.IsGrant, tblPeopleDonors.IsRestricted, tblPeopleDonors.Description, tblPeopleDonors.Amount

FROM tblPeopleDonors RIGHT JOIN tblPeople ON tblPeopleDonors.IndexedName = tblPeople.IndexedName

WHERE (((tblPeopleDonors.Dat...
```
### qryDonationsForExport
```sql
SELECT qryDonations.FirstName, qryDonations.LastName, qryDonations.CompanyOrganization, qryDonations.IsDeceased, qryDonations.Inactive, qryDonations.DateOfDonation, qryDonations.DonationType, qryDonations.IsGrant, qryDonations.IsRestricted, qryDonations.Description, qryDonations.Amount

FROM qryDonations

WHERE (((qryDonations.DateOfDonation) Is Not Null) And ((qryDonations.DateofDonationNumeric)>=Forms!frmRptExpMAILINGSANDSPREADSHEETS!DonationsStartDateNumeric And (qryDonations.DateofDonationNu...
```
### qryDonorAppealCreateMostRecentDonations
```sql
SELECT temptbl0.IndexedName, Max(Int(CDbl(DateValue([temptbl0].[DateOfDonation])))) AS LastDonationNumeric, CVDate(Max(Int(CDbl(DateValue([temptbl0].[DateOfDonation]))))) AS LastDonationDate, Format(CDate(Max(Int(CDbl(DateValue([temptbl0].[DateOfDonation]))))),"mm/dd/yyyy") AS FormattedDate, DLookUp("Amount","temptbl0","DateOfDonation=""" & Format(CDate(Max(Int(CDbl(DateValue([temptbl0].[DateOfDonation]))))),"mm/dd/yyyy") & """ AND IndexedName = """ & [IndexedName] & """") AS LastDonationAmount,...
```
### qryDonorsMonthlyReport
```sql
SELECT [tblPeopleDonors]![DateOfDonation] AS DonationDate, tblPeopleDonors.DateReceived, tblPeopleDonors.DateThankYou, tblPeopleDonors.IndexedName, DCount("IndexedName","tblPeopleDonors","Indexedname='" & [tblPeopleDonors].[IndexedName] & "'") AS NumDonations, tblPeople.LastName, tblPeople.FirstName, tblPeople.MiddleInitial, tblPeople.CompanyOrganization, tblPeople.MailingAddress, tblPeople.MailingCity, tblPeople.MailingState, tblPeople.MailingZIP, tblPeopleDonors.DonationType, tblPeopleDonors.S...
```
### qryEXPIRATIONS00
```sql
DROP TABLE tempstaff
```
### qryEXPIRATIONS01
```sql
SELECT tblStaff.* INTO tempstaff

FROM tblStaff

ORDER BY tblStaff.LASTNAME, tblStaff.FRSTNAME;
```
### qryEXPIRATIONS02
```sql
UPDATE qrytblStaffDedhamManagers INNER JOIN tempstaff ON qrytblStaffDedhamManagers.SUPERVISORCODE_I = tempstaff.SUPERVISORCODE_I SET tempstaff.DIVISIONCODE_I = 'DEDHAM', tempstaff.DEPRTMNT = qrytblStaffDedhamManagers.NewLocation;
```
### qryEXPIRATIONS02A
```sql
ALTER TABLE tempstaff ADD CONSTRAINT tempstaffconstraint PRIMARY KEY (EMPLOYID)
```
### qryEXPIRATIONS03
```sql
DELETE tempstaff.*

FROM tempstaff

WHERE LastName="EXAMPLE";
```
### qryEXPIRATIONS03A
```sql
DELETE [~TempSuperCodes].*

FROM [~TempSuperCodes];
```
### qryEXPIRATIONS04
```sql
INSERT INTO [~TempSuperCodes] ( GPCode, GPSuperCode, JobTitle )

SELECT tblStaff.DEPRTMNT, tblStaff.SUPERVISORCODE_I, tblStaff.JobTitle

FROM tblStaff

WHERE (((tblStaff.JobTitle)='RESUNT' Or (tblStaff.JobTitle)='RESUPR' Or (tblStaff.JobTitle)='ASDRRE' Or (tblStaff.JobTitle)='DASUPR' Or (tblStaff.JobTitle)='SENDPM')) OR (((tblStaff.DEPRTMNT)='CHELSE') AND ((tblStaff.JobTitle)='PRGMGR')) OR (((tblStaff.DEPRTMNT)='NEWTON') AND ((tblStaff.JobTitle)='PRGMGR')) OR (((tblStaff.JobTitle)='RESMGR')) OR ...
```
### qryEXPIRATIONS04A
```sql
DROP TABLE tempstaffskills
```
### qryEXPIRATIONS05
```sql
SELECT tblStaffSkills.* INTO tempstaffskills

FROM tblStaff LEFT JOIN tblStaffSkills ON tblStaff.EMPLOYID = tblStaffSkills.EMPID_I

WHERE tblStaffSkills.SKILLNUMBER_I=1  OR 

              tblStaffSkills.SKILLNUMBER_I=2  OR 

              tblStaffSkills.SKILLNUMBER_I=3  OR 

              tblStaffSkills.SKILLNUMBER_I=15 OR 

              tblStaffSkills.SKILLNUMBER_I=22 OR 

              tblStaffSkills.SKILLNUMBER_I=30 OR 

              tblStaffSkills.SKILLNUMBER_I=31 OR 

              tblSt...
```
### qryEXPIRATIONS05A
```sql
ALTER TABLE tempstaffskills ADD CONSTRAINT tempstaffskillsconstraint PRIMARY KEY (EMPID_I,SKILLNUMBER_I)
```
### qryEXPIRATIONS05B
```sql
DELETE tblExpirations.*

FROM tblExpirations;
```
### qryEXPIRATIONS06
```sql
SELECT [CityTown] & " - " & [LocationName] AS Location, tblLocations.CityTown, tblLocations.LocationName, tblLocations.GPName, tblPeople.GPSuperCode INTO temptbl

FROM tblLocations INNER JOIN tblPeople ON (tblLocations.CityTown = tblPeople.OfficeCityTown) AND (tblLocations.LocationName = tblPeople.OfficeLocationName)

WHERE (((tblLocations.GPName) Is Not Null) AND ((tblPeople.IsStaff)=True))

ORDER BY [CityTown] & "-" & [LocationName];
```
### qryEXPIRATIONS07
```sql
UPDATE temptbl SET temptbl.GPSuperCode = DLookUp("GPSuperCode","~TempSuperCodes","GPCode='" & [temptbl].[GPName] & "'")

WHERE ((([temptbl].[GPSuperCode]) Is Null));
```
### qryEXPIRATIONS08
```sql
INSERT INTO temptbl ( Location, CityTown, LocationName, GPName, GPSuperCode )

SELECT [CityTown] & " - " & [LocationName] AS Location, tblLocations.CityTown, tblLocations.LocationName, tblLocations.GPName, DLookUp("GPSuperCode","tblPeople","FirstName='" & tblLocations.StaffPrimaryContactFirstName & "' AND LastName='" & tblLocations.StaffPrimaryContactLastName & "'") AS Expr1

FROM tblLocations

WHERE (((tblLocations.CityTown)<>"Dedham") AND ((tblLocations.GPName) Is Not Null) AND ((tblLocations....
```
### qryEXPIRATIONS09
```sql
SELECT IIf(IsNull([tblPeopleClientsResidentialServices]![CityTown]),"",[tblPeopleClientsResidentialServices]![CityTown] & " - " & [tblPeopleClientsResidentialServices]![Location]) AS LocRes, IIf(IsNull([tblPeopleClientsCLOServices]![CityTown]),"",[tblPeopleClientsCLOServices]![CityTown] & " - " & [tblPeopleClientsCLOServices]![Location]) AS LocCLO, IIf(IsNull([tblPeopleClientsDayServices]![CityTown]),"",[tblPeopleClientsDayServices]![CityTown] & " - " & [tblPeopleClientsDayServices]![LocationNam...
```
### qryEXPIRATIONS10
```sql
UPDATE (temptbl0 LEFT JOIN qrytblPeopleClientsDemographics ON temptbl0.IndexedName = qrytblPeopleClientsDemographics.IndexedName) LEFT JOIN tblPeopleClientsCLOServices ON temptbl0.IndexedName = tblPeopleClientsCLOServices.IndexedName SET temptbl0.LocCLO = Null

WHERE (Len(temptbl0!LocCLO)>0 And qrytblPeopleClientsDemographics.ActiveCLO=False) Or (Len(temptbl0!LocCLO)>0 And qrytblPeopleClientsDemographics.ActiveCLO=True And tblPeopleClientsCLOServices.Inactive=True);
```
### qryEXPIRATIONS11
```sql
UPDATE (temptbl0 LEFT JOIN qrytblPeopleClientsDemographics ON temptbl0.IndexedName = qrytblPeopleClientsDemographics.IndexedName) LEFT JOIN tblPeopleClientsResidentialServices ON temptbl0.IndexedName = tblPeopleClientsResidentialServices.IndexedName SET temptbl0.LocRes = Null

WHERE (((Len(temptbl0!LocRes))>0) And ((qrytblPeopleClientsDemographics.ActiveResidentialServices)=False)) Or (((Len(temptbl0!LocRes))>0) And ((qrytblPeopleClientsDemographics.ActiveResidentialServices)=True) And ((tblPeop...
```
### qryEXPIRATIONS12
```sql
UPDATE (temptbl0 LEFT JOIN qrytblPeopleClientsDemographics ON temptbl0.IndexedName = qrytblPeopleClientsDemographics.IndexedName) LEFT JOIN tblPeopleClientsDayServices ON temptbl0.IndexedName = tblPeopleClientsDayServices.IndexedName SET temptbl0.LocDay = Null

WHERE (((Len(temptbl0!LocDay))>0) And ((qrytblPeopleClientsDemographics.ActiveDayServices)=False)) Or (((Len(temptbl0!LocDay))>0) And ((qrytblPeopleClientsDemographics.ActiveDayServices)=True) And ((tblPeopleClientsDayServices.Inactive)=T...
```
### qryEXPIRATIONS13
```sql
UPDATE (temptbl0 LEFT JOIN qrytblPeopleClientsDemographics ON temptbl0.IndexedName = qrytblPeopleClientsDemographics.IndexedName) LEFT JOIN tblPeopleClientsVocationalServices ON temptbl0.IndexedName = tblPeopleClientsVocationalServices.IndexedName SET temptbl0.LocVoc = Null

WHERE (((Len(temptbl0!LocVoc))>0) And ((qrytblPeopleClientsDemographics.ActiveVocationalServices)=False)) Or (((Len(temptbl0!LocVoc))>0) And ((qrytblPeopleClientsDemographics.ActiveVocationalServices)=True) And ((tblPeopleCl...
```
### qryEXPIRATIONS14
```sql
INSERT INTO tblExpirations ( Location, RecordType, LastName, FirstName, Supervisor, LastVehicleChecklistCompleted, MostRecentAsleepFireDrill, NextRecentAsleepFireDrill, HouseSafetyPlanExpires, HousePlansReviewedByStaffBefore, DAYStaffTrainedInPrivacyBefore, DAYAllPlansReviewedByStaffBefore, DAYQtrlySafetyChecklistDueBy, MAPChecklistCompleted, HumanRightsOfficer, HROTrainsStaffBefore, HROTrainsIndividualsBefore, FireSafetyOfficer, FSOTrainsStaffBefore, FSOTrainsIndividualsBefore )

SELECT tblLoca...
```
### qryEXPIRATIONS15
```sql
INSERT INTO tblExpirations ( Location, RecordType, LastName, FirstName, Supervisor, DateISP, DateConsentFormsSigned, DateBMMExpires, DateBMMAccessSignedHRC, DateBMMAccessSigned, DateSPDAuthExpires, DateSignaturesDueBy, AllSPDSignaturesReceived )

SELECT DLookUp("GPName","temptbl","Location='" & [LocCLO] & "'") AS Location, 'Client' AS RecordType, temptbl0.LastName, temptbl0.FirstName, DLookUp("GPSuperCode","temptbl","Location='" & [LocCLO] & "'") AS Supervisor, temptbl0.DateISP, temptbl0.DateCon...
```
### qryEXPIRATIONS16
```sql
INSERT INTO tblExpirations ( Location, RecordType, LastName, FirstName, Supervisor, DateISP, DateConsentFormsSigned, DateBMMExpires, DateBMMAccessSignedHRC, DateBMMAccessSigned, DateSPDAuthExpires, DateSignaturesDueBy, AllSPDSignaturesReceived )

SELECT DLookUp("GPName","temptbl","Location='" & [LocRes] & "'") AS Location, 'Client' AS RecordType, temptbl0.LastName, temptbl0.FirstName, DLookUp("GPSuperCode","temptbl","Location='" & [LocRes] & "'") AS Supervisor, temptbl0.DateISP, temptbl0.DateCon...
```
### qryEXPIRATIONS17
```sql
INSERT INTO tblExpirations ( Location, RecordType, LastName, FirstName, Supervisor, DateISP, DateConsentFormsSigned, DateBMMExpires, DateBMMAccessSignedHRC, DateBMMAccessSigned, DateSPDAuthExpires, DateSignaturesDueBy, AllSPDSignaturesReceived )

SELECT DLookUp("GPName","temptbl","Location='" & [LocVoc] & "'") AS Location, "Client" AS RecordType, temptbl0.LastName, temptbl0.FirstName, DLookUp("GPSuperCode","temptbl","Location='" & [LocVoc] & "'") AS Supervisor, temptbl0.DateISP, temptbl0.DateCon...
```
### qryEXPIRATIONS18
```sql
INSERT INTO tblExpirations ( Location, RecordType, LastName, FirstName, JobTitle, Supervisor, AdjustedStartDate )

SELECT [tempstaff]![DEPRTMNT] AS Location, "Staff" AS RecordType, tempstaff.LASTNAME, tempstaff.FRSTNAME, tempstaff.JOBTITLE, tempstaff.SUPERVISORCODE_I, tempstaff.BENADJDATE AS AdjustedStartDate

FROM tempstaff INNER JOIN tempstaffskills ON tempstaff.EMPLOYID = tempstaffskills.EMPID_I

WHERE tempstaff.DEPRTMNT Is Not Null And tempstaff.LastName Is Not Null And tempstaff.FRSTNAME Is...
```
### qryEXPIRATIONS19
```sql
SELECT tempstaffskills.EMPID_I, tempstaffskills.SKILLNUMBER_I, tempstaffskills.EXPIREDSKILL_I INTO temptbl1

FROM tempstaffskills INNER JOIN tblStaff ON tempstaffskills.EMPID_I = tblStaff.EMPLOYID

WHERE tempstaffskills.SKILLNUMBER_I=1 Or tempstaffskills.SKILLNUMBER_I=2 Or tempstaffskills.SKILLNUMBER_I=3 Or tempstaffskills.SKILLNUMBER_I=15 Or tempstaffskills.SKILLNUMBER_I=22 Or tempstaffskills.SKILLNUMBER_I=30 Or tempstaffskills.SKILLNUMBER_I=31 Or tempstaffskills.SKILLNUMBER_I=32 Or tempstaffsk...
```
### qryEXPIRATIONS20
```sql
SELECT temptbl1.*, DLookUp("Skill","catSkills","SkillID=" & [SKILLNUMBER_I]) AS SkillDesc INTO temptbl2

FROM temptbl1;
```
### qryEXPIRATIONS21
```sql
SELECT * INTO temptbl3

FROM qryExpirationsStaffBySkills;
```
### qryEXPIRATIONS22
```sql
UPDATE qrytblExpirations INNER JOIN temptbl3 ON (qrytblExpirations.FirstName = temptbl3.FRSTNAME) AND (qrytblExpirations.LastName = temptbl3.LASTNAME) AND (qrytblExpirations.Location = temptbl3.DEPRTMNT) SET qrytblExpirations.CPR = [temptbl3].[CPR], qrytblExpirations.FirstAid = [temptbl3].[FirstAid], qrytblExpirations.MAPCert = [temptbl3].[MAPCert], qrytblExpirations.DriversLicense = [temptbl3].[DriversLicense], qrytblExpirations.BBP = [temptbl3].[BBP], qrytblExpirations.BackInjuryPrevention = [...
```
### qryEXPIRATIONS23
```sql
UPDATE qrytblExpirations INNER JOIN qrytblStaffEvalsAndSupervisions ON (qrytblExpirations.LastName = qrytblStaffEvalsAndSupervisions.LastName) AND (qrytblExpirations.FirstName = qrytblStaffEvalsAndSupervisions.FirstName) SET qrytblExpirations.ThreeMonthEvaluation = [qrytblStaffEvalsAndSupervisions]![ThreeMonthEval], qrytblExpirations.EvalDueBy = [qrytblStaffEvalsAndSupervisions]![EvalDueBy], qrytblExpirations.LastSupervision = [qrytblStaffEvalsAndSupervisions]![LastSupervision], qrytblExpiration...
```
### qryEXPIRATIONS24
```sql
INSERT INTO tblExpirations ( Location, RecordType, LastName, FirstName, Supervisor, JobTitle, AdjustedStartDate, LastVehicleChecklistCompleted, MostRecentAsleepFireDrill, NextRecentAsleepFireDrill, HouseSafetyPlanExpires, HousePlansReviewedByStaffBefore, DAYStaffTrainedInPrivacyBefore, DAYAllPlansReviewedByStaffBefore, DAYQtrlySafetyChecklistDueBy, MAPChecklistCompleted, HumanRightsOfficer, HROTrainsStaffBefore, HROTrainsIndividualsBefore, FireSafetyOfficer, FSOTrainsStaffBefore, FSOTrainsIndivi...
```
### qryEXPIRATIONS25
```sql
DELETE tblExpirations.*

FROM tblExpirations;
```
### qryEXPIRATIONS26
```sql
DELETE [~TempSuperCodes].*

FROM [~TempSuperCodes];
```
### qryExpirationsStaffBySkills
```sql
TRANSFORM First(qryExpirationsStaffCull.EXPIREDSKILL_I) AS FirstOfEXPIREDSKILL_I

SELECT qryExpirationsStaffCull.DEPRTMNT, qryExpirationsStaffCull.LASTNAME, qryExpirationsStaffCull.FRSTNAME, qryExpirationsStaffCull.JOBTITLE

FROM qryExpirationsStaffCull

GROUP BY qryExpirationsStaffCull.DEPRTMNT, qryExpirationsStaffCull.LASTNAME, qryExpirationsStaffCull.FRSTNAME, qryExpirationsStaffCull.JOBTITLE

PIVOT qryExpirationsStaffCull.SkillDesc;
```
### qryExpirationsStaffCull
```sql
SELECT tempstaff.DEPRTMNT, tempstaff.LASTNAME, tempstaff.FRSTNAME, tempstaff.JOBTITLE, temptbl2.SkillDesc, temptbl2.EXPIREDSKILL_I

FROM tempstaff INNER JOIN temptbl2 ON tempstaff.EMPLOYID = temptbl2.EMPID_I

ORDER BY tempstaff.DEPRTMNT, tempstaff.LASTNAME;
```
### qryISPInfo
```sql
SELECT tblPeople.LastName, tblPeople.FirstName, tblPeople.PhysicalAddress, tblPeople.PhysicalCity, tblPeople.PhysicalState, tblPeople.PhysicalZIP, tblPeople.CLOLocation, tblPeople.DayLocation, tblPeople.ResLocation, IIf([tblPeople]![IsClientRes],Val(DLookUp("Cluster","tblLocations","CityTown='" & [tblPeopleClientsResidentialServices]![CityTown] & "' AND LocationName='" & [tblPeopleClientsResidentialServices]![Location] & "'")),Null) AS ResCluster, tblLocations.CommmunityRNName, IIf(IsDate([DateI...
```
### qryJamesContracts
```sql
SELECT tblContracts.ContractID, tblContractsBillingBook.BIllingBookNumber, tblContractsBillingBook.ProgramName, tblContractsBillingBook.CostCenter, tblContractsBillingBook.MaximumObligation, tblContractsBillingBook.Units, tblContractsBillingBook.BillingRate, tblContractsBillingBook.NumberOfClients, tblContractsBillingBook.InternalRate, tblContractsBillingBook.FundingSource, tblContractsBillingBook.Staff

FROM tblContracts INNER JOIN tblContractsBillingBook ON (tblContracts.ContractID = tblContra...
```
### qryJamesExport
```sql
SELECT tblContracts.ContractID, tblContractsBillingBook.BIllingBookNumber, tblContractsBillingBook.ProgramName, tblContractsBillingBook.CostCenter, tblContractsBillingBook.MaximumObligation, tblContractsBillingBook.MaximumObligationAsAmended, tblContractsBillingBook.Units, tblContractsBillingBook.UnitsAsAmended, tblContractsBillingBook.BillingRate, tblContractsBillingBook.NumberOfClients, tblContractsBillingBook.InternalRate, tblContractsBillingBook.FundingSource, tblContractsBillingBook.DDSArea...
```
### qryLoadConsultantsTable
```sql
INSERT INTO tblPeopleConsultants ( IndexedName, RecordAddedDate, RecordAddedBy )

SELECT """ & Left(Form_frmPeople.IndexedName, 160) & """ AS IndexedName, Now() AS RecordAddedDate, """ & Form_frmMainMenu.UserName & """ AS RecordAddedBy;
```
### qryLoadFormDemographics
```sql
INSERT INTO tblPeopleClientsDemographics ( IndexedName, RecordAddedDate, RecordAddedBy )

SELECT Left([Form_frmPeople].[IndexedName],160) AS IndexedName, Format(Now(),'mm/dd/yyyy') AS RecordAddedDate, [Form_frmMainMenu].[UserName] AS RecordAddedBy;
```
### qryLoadFormVendors
```sql
INSERT INTO tblPeopleClientsVendors ( IndexedName, RecordAddedDate, RecordAddedBy, LivingWithParentOrGuardian, LivingIndependently )

SELECT Left([Form_frmPeople].[IndexedName],160) AS IndexedName, Now() AS RecordAddedDate, [Form_frmMainMenu].[UserName] AS RecordAddedBy, False AS LivingWithParentOrGuardian, False AS LivingIndependently;
```
### qryLoadPhoneDirectory
```sql
INSERT INTO tblPhoneDirectory ( Department, Location, LocationDetail, LastName, FirstName, EmailAddress, JobTitle, InternalExtension, HasPhoneOnDesktop, ExternalPhoneNumber )

SELECT tblPeople.Department, tblPeople.OfficeCityTown AS Location, tblPeople.OfficeLocationName AS LocationDetail, tblPeople.LastName, tblPeople.FirstName, tblPeople.EmailAddress, tblPeople.StaffTitle AS JobTitle, tblPeople.DID AS InternalExtension, tblPeople.HasPhoneOnDesktop, tblPeople.StaffExtPhone AS ExternalPhoneNumbe...
```
### qryLoadTemporaryFamilyTable
```sql
SELECT tblPeopleFamily.IndexedName, tblPeopleFamily.ClientIndexedName, tblPeopleFamily.Guardian INTO temptbl

FROM tblPeople INNER JOIN tblPeopleFamily ON tblPeople.IndexedName = tblPeopleFamily.ClientIndexedName

WHERE (((tblPeopleFamily.ClientIndexedName)=tblPeople.IndexedName) And ((tblPeopleFamily.Inactive)=False) And ((tblPeople.IsDeceased)=False) And ((tblPeople.IsFamilyGuardian)=True));
```
### qryMSAMISC
```sql
SELECT tblContracts.FY, tblContractsBillingBook.AccountingStaff, IIf(Left([tblContracts]![ContractID],1)="1" Or Left([tblContracts]![ContractID],2)="IN","DDS","Non-DDS") AS DDS, tblContracts.ContractID, tblContractsBillingBook.BIllingBookNumber, tblContracts.ActivityCode, tblContracts.GPNumber, tblContracts.State, tblContracts.UnitRate, tblContracts.Units AS ContractUnits, tblContracts.MaximumObligation AS ContractMaximumObligation, tblContracts.MaximumObligationAsAmended, tblContracts.TotalClie...
```
### qryMSAMISCTEMP
```sql
SELECT tblContracts.FY, tblContractsBillingBook.AccountingStaff, IIf(Left([tblContracts]![ContractID],1)="1" Or Left([tblContracts]![ContractID],2)="IN","DDS","Non-DDS") AS DDS, tblContracts.ContractID, tblContractsBillingBook.BIllingBookNumber, tblContracts.ActivityCode, tblContracts.GPNumber, tblContracts.State, tblContracts.UnitRate, tblContracts.Units AS ContractUnits, tblContracts.MaximumObligation AS ContractMaximumObligation, tblContracts.MaximumObligationAsAmended, tblContracts.TotalClie...
```
### qryPeopleAddFamilyRepPayee
```sql
UPDATE (tblPeople INNER JOIN tblPeopleFamily ON tblPeople.IndexedName = tblPeopleFamily.IndexedName) INNER JOIN tblPeopleClientsDemographics ON tblPeopleFamily.ClientIndexedName = tblPeopleClientsDemographics.IndexedName SET tblPeopleClientsDemographics.RepresentativePayee = [tblPeople]![FirstName] & " " & [tblPeople]![LastName], tblPeopleClientsDemographics.RepPayeeAddress = [tblPeople]![MailingAddress], tblPeopleClientsDemographics.RepPayeeCity = [tblPeople]![MailingCity], tblPeopleClientsDemo...
```
### qryPeopleAllPeopleRecords
```sql
SELECT LastName & ', ' & FirstName & ' ' & IIf(Len(MiddleInitial)>0,MiddleInitial,'') AS Person, FirstName & ' ' & IIf(Len(MiddleInitial)<=0,'',MiddleInitial & ' ') & LastName AS PersonByFirstName, tblPeople.IndexedName, tblPeople.RecordAddedDate, tblPeople.RecordAddedBy, tblPeople.RecordLastViewedDate, tblPeople.RecordLastViewedBy, tblPeople.Salutation, tblPeople.LastName, tblPeople.FirstName, tblPeople.MiddleInitial, tblPeople.CompanyOrganization, tblPeople.Title, tblPeople.FamiliarGreeting, t...
```
### qryPeopleRemoveFamilyRepPayee
```sql
UPDATE (tblPeople INNER JOIN tblPeopleFamily ON tblPeople.IndexedName = tblPeopleFamily.IndexedName) INNER JOIN tblPeopleClientsDemographics ON tblPeopleFamily.ClientIndexedName = tblPeopleClientsDemographics.IndexedName SET tblPeopleClientsDemographics.RepresentativePayee = Null, tblPeopleClientsDemographics.RepPayeeAddress = Null, tblPeopleClientsDemographics.RepPayeeCity = Null, tblPeopleClientsDemographics.RepPayeeState = Null, tblPeopleClientsDemographics.RepPayeeZIP = Null, tblPeopleClient...
```
### qryPeopleResidentialClientsReportExport
```sql
SELECT tblPeople.IndexedName AS ClientIndexedName, tblPeople.LastName AS ClientLastName, tblPeople.FirstName AS ClientFirstName, tblPeopleClientsDemographics.SocialSecurityNumber AS ClientSSN, tblPeopleClientsDemographics.LegalStatus AS ClientLegalStatus, tblPeopleClientsDemographics.DateOfBirth AS ClientDOB, IIf([tblPeople]![IsClientRes],'RES',IIf([tblPeople]![IsCilentCLO],'CLO',IIf([tblPeople]![IsClientSharedLiving],'SL',''))) AS ClientService, IIf([tblPeopleClientsDemographics]![ActiveResiden...
```
### qryPeopleTILLGamesEmail
```sql
SELECT [tblPeople]![FirstName] & " " & [tblPeople]![LastName] AS FamilyName, StrConv([tblpeople].[EmailAddress],2) AS FamilyEmailAddress, [tblPeopleFamily]![ClientFirstName] & " " & [tblPeopleFamily]![ClientLastName] AS ClientName, tblPeople_1.ResLocation, tblPeople_1.CLOLocation

FROM (((tblPeople LEFT JOIN tblPeopleFamily ON tblPeople.IndexedName = tblPeopleFamily.IndexedName) LEFT JOIN tblPeople AS tblPeople_1 ON tblPeopleFamily.ClientIndexedName = tblPeople_1.IndexedName) LEFT JOIN tblPeople...
```
### qryProgramExpirations
```sql
SELECT tblLocations.CityTown, tblLocations.LocationName, tblLocations.Department, IIf(IsNumeric([Cluster]),Val([Cluster]),Null) AS ResCluster, IIf(IsDate([tblLocations].[HouseSafetyPlanExpires]),DateValue([tblLocations].[HouseSafetyPlanExpires]),Null) AS HouseSafetyPlanExpires, IIf(IsDate([tblLocations].[HousePlansReviewedByStaffBefore]),DateValue([tblLocations].[HousePlansReviewedByStaffBefore]),Null) AS HousePlansReviewedByStaffBefore, StrConv([tblLocations].[HumanRightsOfficer],3) AS HRO, IIf...
```
### qryRUNREPORT05
```sql
INSERT INTO temptbl ( EmplID, LName, FName, SKILLEXPIREDDATE, REDFLAG, LOCATION, SKILL )

SELECT tblStaffEvalsAndSupervisions.EmployeeID, tblStaffEvalsAndSupervisions.LastName, tblStaffEvalsAndSupervisions.FirstName, tblStaffEvalsAndSupervisions.EvalDueBy, True AS Expr1, tblStaffEvalsAndSupervisions.Loc AS LOCATION, 'EvalDueBy' AS SKILL

FROM tblStaffEvalsAndSupervisions INNER JOIN tempstaff ON tblStaffEvalsAndSupervisions.EmployeeID = tempstaff.EMPLOYID

WHERE (((tblStaffEvalsAndSupervisions.Ev...
```
### qryRefreshResidentialContacts
```sql
UPDATE qrytblLocations LEFT JOIN qrytblPeople ON (qrytblLocations.CityTown = qrytblPeople.OfficeCityTown) AND (qrytblLocations.LocationName = qrytblPeople.OfficeLocationName) SET qrytblLocations.StaffPrimaryContactIndexedName = qrytblPeople.IndexedName, qrytblLocations.StaffPrimaryContactLastName = qrytblPeople.LastName, qrytblLocations.StaffPrimaryContactFirstName = qrytblPeople.FirstName

WHERE (((qrytblLocations.StaffPrimaryContactIndexedName)<>qrytblPeople.IndexedName) And ((qrytblLocations....
```
### qryRepairAnomalies1
```sql
UPDATE (tblPeople INNER JOIN tblPeopleClientsResidentialServices ON tblPeople.IndexedName = tblPeopleClientsResidentialServices.IndexedName) INNER JOIN tblPeopleClientsVendors ON tblPeople.IndexedName = tblPeopleClientsVendors.IndexedName SET tblPeopleClientsVendors.LivingWithParentOrGuardian = False

WHERE (((tblPeopleClientsVendors.LivingWithParentOrGuardian)=True) AND ((tblPeople.IsClientRes)=True) AND ((tblPeopleClientsResidentialServices.Inactive)=False));
```
### qryRepairAnomalies2
```sql
UPDATE (tblPeople INNER JOIN tblPeopleClientsCLOServices ON tblPeople.IndexedName = tblPeopleClientsCLOServices.IndexedName) INNER JOIN tblPeopleClientsVendors ON tblPeople.IndexedName = tblPeopleClientsVendors.IndexedName SET tblPeopleClientsVendors.LivingWithParentOrGuardian = False

WHERE (((tblPeopleClientsVendors.LivingWithParentOrGuardian)=True) AND ((tblPeople.IsCilentCLO)=True) AND ((tblPeopleClientsCLOServices.Inactive)=False));
```
### qryRepairAnomalies3
```sql
UPDATE (tblPeople INNER JOIN tblPeopleClientsResidentialServices ON tblPeople.IndexedName = tblPeopleClientsResidentialServices.IndexedName) INNER JOIN tblPeopleClientsVendors ON tblPeople.IndexedName = tblPeopleClientsVendors.IndexedName SET tblPeopleClientsVendors.LivingIndependently = False

WHERE (((tblPeopleClientsVendors.LivingIndependently)=True) AND ((tblPeople.IsClientRes)=True) AND ((tblPeopleClientsResidentialServices.Inactive)=False));
```
### qryRepairAnomalies4
```sql
UPDATE (tblPeople INNER JOIN tblPeopleClientsCLOServices ON tblPeople.IndexedName = tblPeopleClientsCLOServices.IndexedName) INNER JOIN tblPeopleClientsVendors ON tblPeople.IndexedName = tblPeopleClientsVendors.IndexedName SET tblPeopleClientsVendors.LivingIndependently = False

WHERE (((tblPeopleClientsVendors.LivingIndependently)=True) AND ((tblPeople.IsCilentCLO)=True) AND ((tblPeopleClientsCLOServices.Inactive)=False));
```
### qryResClientsBySite
```sql
SELECT tblLocations.Cluster, tblLocations.CityTown, tblLocations.LocationName, tblLocations.NumClients, tblLocations.ResCapacity, [ResCapacity]-[NumClients] AS NumVacancies, tblPeople.LastName, tblPeople.FirstName, tblPeopleClientsDemographics.UsesWheelchair, tblPeopleClientsDemographics.UsesWalker

FROM ((tblPeople INNER JOIN tblPeopleClientsResidentialServices ON tblPeople.IndexedName = tblPeopleClientsResidentialServices.IndexedName) INNER JOIN tblLocations ON (tblPeopleClientsResidentialServ...
```
### qryRptSeverityRates
```sql
UPDATE temptbl SET temptbl.Rate = DLookUp("MedicaidRate","catSeverityRates","Severity='" & [temptbl].[Sev] & "'");
```
### qrySECTION8
```sql
SELECT vwSECTION8.IndexedName, vwSECTION8.LastName, vwSECTION8.FirstName, vwSECTION8.MiddleInitial, vwSECTION8.ClientCityTown, vwSECTION8.ClientLocation, vwSECTION8.ResTILLOwned, vwSECTION8.HAFunding, vwSECTION8.HAOffice, vwSECTION8.InspectionDate, vwSECTION8.PassFailure, vwSECTION8.ResSection8, vwSECTION8.ResWaitListSection8, vwSECTION8.ResWaitListSection8Date, vwSECTION8.RESWIP, vwSECTION8.RESLastIncrease, vwSECTION8.CLOSection8, vwSECTION8.CLOWaitListSection8, vwSECTION8.CLOWaitListSection8Da...
```
### qrySECTION8_Original
```sql
SELECT tblPeople.IndexedName, tblPeople.LastName, tblPeople.FirstName, tblPeople.MiddleInitial, IIf([tblPeople]![IsCilentCLO] And Not [tblPeopleClientsCLOServices]![Inactive],[tblPeopleClientsCLOServices]![CityTown],IIf([tblPeople]![IsClientRes] And Not [tblPeopleClientsResidentialServices]![Inactive],[tblPeopleClientsResidentialServices]![CityTown],"")) AS ClientCityTown, IIf([tblPeople]![IsCilentCLO] And Not [tblPeopleClientsCLOServices]![Inactive],[tblPeopleClientsCLOServices]![Location],IIf(...
```
### qrySTAFFWITHNOSKILLS
```sql
SELECT *

FROM vw_STAFFWITHNOTSKILLS;
```
### qrySTAFFWITHNOSKILLS_Original
```sql
SELECT tblStaff.EMPLOYID, tblStaff.LASTNAME, tblStaff.FRSTNAME, tblStaff.DIVISIONCODE_I, tblStaff.DEPRTMNT, tblStaff.JOBTITLE, DCount("EMPID_I","tblStaffSkills","EMPID_I='" & [tblStaff]![EMPLOYID] & "'") AS SkillsCount

FROM tblStaff

WHERE (((tblStaff.LASTNAME)<>"EXAMPLE") And ((DCount("EMPID_I","tblStaffSkills","EMPID_I='" & tblStaff!EMPLOYID & "'"))=0));
```
### qrySeedCONINWORKSSummary
```sql
INSERT INTO [~CONINWORKSSummary] ( FY, ContractID, DDSMaxObligation, ContractUnit, NumLocations, NumClients, Units, BillingRate, FundingSource, AccountingStaff )

SELECT qryCurrentFYContracts.FY, qryCurrentFYContracts.ContractID, qryCurrentFYContracts.MaximumObligationAsAmended, qryCurrentFYContracts.Units, DCount("ContractID","qryCONINWORKS","ContractID=""" & [qryCurrentFYContracts].[ContractID] & """") AS NumLocations, qryCurrentFYContracts.TotalClients, qryCurrentFYContracts.TotalUnitsAsAmend...
```
### qryStaffAndEvalsDeleteInactives
```sql
UPDATE temptbl RIGHT JOIN tblStaffEvalsAndSupervisions ON temptbl.EMPLOYID = tblStaffEvalsAndSupervisions.EmployeeID SET tblStaffEvalsAndSupervisions.DeleteFlag = -1

WHERE (((temptbl.EMPLOYID) Is Null));
```
### qrySurvey
```sql
SELECT temptbl0.LastName AS LN, temptbl0.FirstName AS FN, temptbl0.MiddleInitial AS MI, temptbl0.CompanyOrganization AS CO, temptbl0.FamiliarGreeting AS FamilyFamiliarGreeting, temptbl0.MailingAddress AS MailingAddress, temptbl0.MailingCity AS MailingCity, temptbl0.MailingState AS MailingState, temptbl0.MailingZIP AS MailingZIP, temptbl0.IsFamilyGuardian, temptbl0.IsDonor, temptbl0.IsInterestedParty, temptbl0.IsConsultant, temptbl0.InterestedPartyCategory, temptbl0.InterestedPartyInactive, tempt...
```
### qryTILLLocations
```sql
SELECT tblLocations.CityTown, tblLocations.LocationName, tblLocations.Department, tblLocations.CostCenter, tblLocations.Cluster, tblLocations.ABI, tblLocations.NumClients, tblLocations.ResCapacity, tblLocations.ResTILLOwned, tblLocations.Address, tblLocations.City, tblLocations.State, tblLocations.ZIP, tblLocations.County, tblLocations.PhoneNumber

FROM tblLocations

WHERE (((tblLocations.Department)="Residential Services" Or (tblLocations.Department)="Day Services")) OR (((tblLocations.CityTown...
```
### qryUpdateAllPeopleTable
```sql
SELECT LastName & ', ' & FirstName & ' ' & IIf(Len(MiddleInitial)>0,MiddleInitial,'') AS Person, FirstName & ' ' & IIf(Len(MiddleInitial)<=0,'',MiddleInitial & ' ') & LastName AS PersonByFirstName, tblPeople.* INTO AllPeopleRecords

FROM tblPeople

WHERE Left(IndexedName,3) <> '///'

ORDER BY tblPeople.IndexedName;
```
### qryUpdateAsstDirectors
```sql
UPDATE (tblLocations INNER JOIN catClusters ON tblLocations.Cluster = catClusters.ClusterID) INNER JOIN tblPeople ON (catClusters.ClusterDirectorFirstName = tblPeople.FirstName) AND (catClusters.ClusterDirectorLastName = tblPeople.LastName) SET tblLocations.StaffTertiaryContactIndexedName = [tblPeople].[IndexedName], tblLocations.StaffTertiaryContactLastName = [catClusters].[ClusterDirectorLastName], tblLocations.StaffTertiaryContactFirstName = [catClusters].[ClusterDirectorFirstName], tblLocati...
```
### qryUpdateCoordinators
```sql
UPDATE (tblLocations INNER JOIN catClusters ON tblLocations.Cluster = catClusters.ClusterID) INNER JOIN tblPeople ON (catClusters.ClusterManagerFirstName = tblPeople.FirstName) AND (catClusters.ClusterManagerLastName = tblPeople.LastName) SET tblLocations.StaffSecondaryContactIndexedName = [tblPeople].[IndexedName], tblLocations.StaffSecondaryContactLastName = [catClusters].[ClusterManagerLastName], tblLocations.StaffSecondaryContactFirstName = [catClusters].[ClusterManagerFirstName], tblLocatio...
```
### qryUpdateDedhamHQLocations
```sql
INSERT INTO tblLocations ( CityTown, LocationName, RecordAddedDate, RecordAddedBy, GPName, Department, CostCenter, Cluster, ABI, NumClients, ResCapacity, ResTILLOwned, EmailAddress, Address, City, State, ZIP, County, AddressValidated, PhoneNumber, DID, SpeedDial, FaxNumber, FaxEmailAddress, DDSArea, DDSRegion, StaffPrimaryContactIndexedName, StaffPrimaryContactLastName, StaffPrimaryContactFirstName, StaffPrimaryContactMiddleInitial, Leader, LOTR, ManagerLogonID, StaffSecondaryContactIndexedName,...
```
### qryUpdateDedhamManagers
```sql
INSERT INTO tblStaffDedhamManagers ( SUPERVISORCODE_I, SupervisorName, NewLocation, Location, IndexedName )

SELECT qrytblPeopleStaffSupervisors.SUPERVISORCODE_I, tblPeople.FirstName & " " & tblPeople.LastName AS SupervisorName, "DED-" & Left(tblPeople.FirstName,1) & Left(tblPeople.LastName,1) AS NewLocation, "Dedham - " & tblpeople.FirstName & ' ' & tblpeople.LastName & " Direct Reports" AS Location, tblPeople.IndexedName AS IndexedName

FROM qrytblPeopleStaffSupervisors INNER JOIN tblPeople ON...
```
### qryUpdateDedhamStaffCodes
```sql
UPDATE qrytblStaffDedhamManagers INNER JOIN tblLocations ON qrytblStaffDedhamManagers.IndexedName = tblLocations.StaffPrimaryContactIndexedName SET tblLocations.GPName = [qrytblStaffDedhamManagers].[NewLocation]

WHERE (((tblLocations.CityTown)="HQ"));
```
### qryUpdatePeopleGPSuperCode
```sql
UPDATE qrytblPeople INNER JOIN qrytblPeopleStaffSupervisors ON qrytblPeople.IndexedName = qrytblPeopleStaffSupervisors.INDEXEDNAME SET qrytblPeople.GPSuperCode = [qrytblPeopleStaffSupervisors].[SUPERVISORCODE_I];
```
### qryUpdateSpringboardClientsStep1
```sql
UPDATE tblPeopleClientsSpringboardServices SET tblPeopleClientsSpringboardServices.GroupCode = Null, tblPeopleClientsSpringboardServices.LeaderIndexedName = Null, tblPeopleClientsSpringboardServices.Leader = Null

WHERE (((tblPeopleClientsSpringboardServices.GroupCode) Is Not Null) AND ((tblPeopleClientsSpringboardServices.Inactive)=True));
```
### qryUpdateSpringboardClientsStep2
```sql
UPDATE tblPeopleClientsSpringboardServices SET tblPeopleClientsSpringboardServices.LeaderIndexedName = Null, tblPeopleClientsSpringboardServices.Leader = Null;
```
### qryUpdateSpringboardClientsStep3
```sql
SELECT tblPeopleConsultants.IndexedName, tblPeopleConsultants.SpringboardGroupCode1 AS SprGroup, tblPeople.LastName, tblPeople.FirstName INTO temptbl

FROM tblPeopleConsultants INNER JOIN tblPeople ON tblPeopleConsultants.IndexedName = tblPeople.IndexedName

WHERE (((tblPeopleConsultants.SpringboardGroupCode1) Is Not Null) AND ((tblPeopleConsultants.Department)='Springboard') AND ((tblPeopleConsultants.Inactive)=False))

ORDER BY tblPeopleConsultants.SpringboardGroupCode1;
```
### qryUpdateSpringboardClientsStep4
```sql
INSERT INTO temptbl ( IndexedName, SprGroup, LastName, FirstName )

SELECT tblPeopleConsultants.IndexedName, tblPeopleConsultants.SpringboardGroupCode2 AS SprGroup, tblPeople.LastName, tblPeople.FirstName

FROM tblPeopleConsultants INNER JOIN tblPeople ON tblPeopleConsultants.IndexedName = tblPeople.IndexedName

WHERE (((tblPeopleConsultants.SpringboardGroupCode2) Is Not Null) AND ((tblPeopleConsultants.Department)='Springboard') AND ((tblPeopleConsultants.Inactive)=False))

ORDER BY tblPeopleCo...
```
### qryUpdateSpringboardClientsStep5
```sql
INSERT INTO temptbl ( IndexedName, SprGroup, LastName, FirstName )

SELECT tblPeopleConsultants.IndexedName, tblPeopleConsultants.SpringboardGroupCode3 AS SprGroup, tblPeople.LastName, tblPeople.FirstName

FROM tblPeopleConsultants INNER JOIN tblPeople ON tblPeopleConsultants.IndexedName = tblPeople.IndexedName

WHERE (((tblPeopleConsultants.SpringboardGroupCode3) Is Not Null) AND ((tblPeopleConsultants.Department)='Springboard') AND ((tblPeopleConsultants.Inactive)=False))

ORDER BY tblPeopleCo...
```
### qryUpdateSpringboardClientsStep6
```sql
UPDATE tblPeopleClientsSpringboardServices INNER JOIN temptbl ON tblPeopleClientsSpringboardServices.GroupCode = temptbl.SprGroup SET tblPeopleClientsSpringboardServices.LeaderIndexedName = [temptbl]![IndexedName], tblPeopleClientsSpringboardServices.Leader = [temptbl]![FirstName] & ' ' & [temptbl]![LastName];
```
### qryUpdateSpringboardLeaders01
```sql
UPDATE tblPeopleClientsSpringboardServices SET tblPeopleClientsSpringboardServices.GroupCode = Null, tblPeopleClientsSpringboardServices.LeaderIndexedName = Null, tblPeopleClientsSpringboardServices.Leader = Null

WHERE (((tblPeopleClientsSpringboardServices.GroupCode) Is Not Null) AND ((tblPeopleClientsSpringboardServices.Inactive)=True));
```
### qryUpdateSpringboardLeaders02
```sql
UPDATE tblPeopleClientsSpringboardServices SET tblPeopleClientsSpringboardServices.LeaderIndexedName = Null, tblPeopleClientsSpringboardServices.Leader = Null;
```
### qryUpdateSpringboardLeaders03
```sql
SELECT tblPeopleConsultants.IndexedName, tblPeopleConsultants.SpringboardGroupCode1 AS SprGroup, tblPeople.LastName, tblPeople.FirstName INTO temptbl

FROM tblPeopleConsultants INNER JOIN tblPeople ON tblPeopleConsultants.IndexedName = tblPeople.IndexedName

WHERE (((tblPeopleConsultants.SpringboardGroupCode1) Is Not Null) AND ((tblPeopleConsultants.Department)='Springboard') AND ((tblPeopleConsultants.Inactive)=False))

ORDER BY tblPeopleConsultants.SpringboardGroupCode1;
```
### qryUpdateSpringboardLeaders04
```sql
INSERT INTO temptbl ( IndexedName, SprGroup, LastName, FirstName )

SELECT tblPeopleConsultants.IndexedName, tblPeopleConsultants.SpringboardGroupCode2 AS SprGroup, tblPeople.LastName, tblPeople.FirstName

FROM tblPeopleConsultants INNER JOIN tblPeople ON tblPeopleConsultants.IndexedName = tblPeople.IndexedName

WHERE (((tblPeopleConsultants.SpringboardGroupCode2) Is Not Null) AND ((tblPeopleConsultants.Department)='Springboard') AND ((tblPeopleConsultants.Inactive)=False))

ORDER BY tblPeopleCo...
```
### qryUpdateSpringboardLeaders05
```sql
INSERT INTO temptbl ( IndexedName, SprGroup, LastName, FirstName )

SELECT tblPeopleConsultants.IndexedName, tblPeopleConsultants.SpringboardGroupCode3 AS SprGroup, tblPeople.LastName, tblPeople.FirstName

FROM tblPeopleConsultants INNER JOIN tblPeople ON tblPeopleConsultants.IndexedName = tblPeople.IndexedName

WHERE (((tblPeopleConsultants.SpringboardGroupCode3) Is Not Null) AND ((tblPeopleConsultants.Department)='Springboard') AND ((tblPeopleConsultants.Inactive)=False))

ORDER BY tblPeopleCo...
```
### qryUpdateSpringboardLeaders06
```sql
UPDATE tblPeopleClientsSpringboardServices INNER JOIN temptbl ON tblPeopleClientsSpringboardServices.GroupCode = temptbl.SprGroup SET tblPeopleClientsSpringboardServices.LeaderIndexedName = [temptbl]![IndexedName], tblPeopleClientsSpringboardServices.Leader = [temptbl]![FirstName] & ' ' & [temptbl]![LastName];
```
### qryUpdateStaffSupervisors
```sql
UPDATE (tblPeople INNER JOIN tblStaff ON (tblPeople.LastName = tblStaff.LASTNAME) AND (tblPeople.FirstName = tblStaff.FRSTNAME)) INNER JOIN tblPeopleStaffSupervisors ON tblStaff.SUPERVISORCODE_I = tblPeopleStaffSupervisors.SUPERVISORCODE_I SET tblPeople.ManagerSuperCode = [tblPeopleStaffSupervisors]![SUPERVISORCODE_I]

WHERE tblPeople.isStaff=True;
```
### qryUpdateStaffSupervisorsLocations
```sql
UPDATE qrytblPeopleStaffSupervisors INNER JOIN tblPeople ON qrytblPeopleStaffSupervisors.INDEXEDNAME = tblPeople.IndexedName SET qrytblPeopleStaffSupervisors.LOCATION = tblPeople.OfficeCityTown & " - " & tblPeople.OfficeLocationName

WHERE (((tblPeople.OfficeCityTown) IS NOT NULL));
```
### qryUpdateStaffSupervisorsNames
```sql
UPDATE qrytblPeopleStaffSupervisors INNER JOIN qrytblStaff ON qrytblPeopleStaffSupervisors.SUPEMPLID = qrytblStaff.EMPLOYID SET qrytblPeopleStaffSupervisors.LASTNAME = StrConv (Trim([qrytblStaff].[LASTNAME]), 3), qrytblPeopleStaffSupervisors.FIRSTNAME = StrConv (Trim([qrytblStaff].[FRSTNAME]), 3), qrytblPeopleStaffSupervisors.INDEXEDNAME = StrConv (Trim([qrytblStaff].[LASTNAME]), 3) & '/' & StrConv (Trim([qrytblStaff].[FRSTNAME]), 3) & '//';
```
### qryUpdateStaffTable
```sql
UPDATE qrytblStaff SET qrytblStaff.EMPLOYID = Trim(qrytblStaff.EMPLOYID), qrytblStaff.EMPLCLAS = Trim(qrytblStaff.EMPLCLAS), qrytblStaff.LASTNAME = Trim(qrytblStaff.LASTNAME), qrytblStaff.FRSTNAME = Trim(qrytblStaff.FRSTNAME), qrytblStaff.MIDLNAME = Trim(qrytblStaff.MIDLNAME), qrytblStaff.DIVISIONCODE_I = Trim(qrytblStaff.DIVISIONCODE_I), qrytblStaff.DEPRTMNT = Trim(qrytblStaff.DEPRTMNT), qrytblStaff.JOBTITLE = Trim(qrytblStaff.JOBTITLE), qrytblStaff.SUPERVISORCODE_I = Trim(qrytblStaff.SUPERVISO...
```
### qryappParameters
```sql
SELECT appParameters.*

FROM appParameters;
```
### qrycatClusters
```sql
SELECT catClusters.*

FROM catClusters;
```
### qrytblContracts
```sql
SELECT tblContracts.*

FROM tblContracts;
```
### qrytblContractsAmendments
```sql
SELECT tblContractsAmendments.*

FROM tblContractsAmendments;
```
### qrytblContractsBillingBook
```sql
SELECT tblContractsBillingBook.*

FROM tblContractsBillingBook;
```
### qrytblExpirations
```sql
SELECT tblExpirations.*

FROM tblExpirations;
```
### qrytblLocations
```sql
SELECT tblLocations.*

FROM tblLocations;
```
### qrytblPeople
```sql
SELECT tblPeople.*

FROM tblPeople;
```
### qrytblPeopleClientsAFCServices
```sql
SELECT tblPeopleClientsAFCServices.*

FROM tblPeopleClientsAFCServices;
```
### qrytblPeopleClientsAutismServices
```sql
SELECT tblPeopleClientsAutismServices.*

FROM tblPeopleClientsAutismServices;
```
### qrytblPeopleClientsCLOServices
```sql
SELECT tblPeopleClientsCLOServices.*

FROM tblPeopleClientsCLOServices;
```
### qrytblPeopleClientsDayServices
```sql
SELECT tblPeopleClientsDayServices.*

FROM tblPeopleClientsDayServices;
```
### qrytblPeopleClientsDemographics
```sql
SELECT tblPeopleClientsDemographics.*

FROM tblPeopleClientsDemographics;
```
### qrytblPeopleClientsIndividualSupportServices
```sql
SELECT tblPeopleClientsIndividualSupportServices.*

FROM tblPeopleClientsIndividualSupportServices;
```
### qrytblPeopleClientsPCAServices
```sql
SELECT tblPeopleClientsPCAServices.*

FROM tblPeopleClientsPCAServices;
```
### qrytblPeopleClientsPCAServicesContactNotes
```sql
SELECT tblPeopleClientsPCAServicesContactNotes.*

FROM tblPeopleClientsPCAServicesContactNotes;
```
### qrytblPeopleClientsResidentialServices
```sql
SELECT tblPeopleClientsResidentialServices.*

FROM tblPeopleClientsResidentialServices;
```
### qrytblPeopleClientsSharedLivingServices
```sql
SELECT tblPeopleClientsSharedLivingServices.*

FROM tblPeopleClientsSharedLivingServices;
```
### qrytblPeopleClientsSpringboardServices
```sql
SELECT tblPeopleClientsSpringboardServices.*

FROM tblPeopleClientsSpringboardServices;
```
### qrytblPeopleClientsVendors
```sql
SELECT tblPeopleClientsVendors.*

FROM tblPeopleClientsVendors;
```
### qrytblPeopleClientsVocationalServices
```sql
SELECT tblPeopleClientsVocationalServices.*

FROM tblPeopleClientsVocationalServices;
```
### qrytblPeopleConsultants
```sql
SELECT tblPeopleConsultants.*

FROM tblPeopleConsultants;
```
### qrytblPeopleDonors
```sql
SELECT tblPeopleDonors.*

FROM tblPeopleDonors;
```
### qrytblPeopleFamily
```sql
SELECT tblPeopleFamily.*

FROM tblPeopleFamily;
```
### qrytblPeopleStaffSupervisors
```sql
SELECT tblPeopleStaffSupervisors.*

FROM tblPeopleStaffSupervisors;
```
### qrytblStaff
```sql
SELECT tblStaff.*

FROM tblStaff;
```
### qrytblStaffDedhamManagers
```sql
SELECT tblStaffDedhamManagers.*

FROM tblStaffDedhamManagers;
```
### qrytblStaffEvalsAndSupervisions
```sql
SELECT tblStaffEvalsAndSupervisions.*

FROM tblStaffEvalsAndSupervisions;
```
### qrytblStaffSkills
```sql
SELECT tblStaffSkills.*

FROM tblStaffSkills;
```

## VBA Object Inventory
| Type | Count | Objects |
|------|-------|--------|
| Forms | 71 | frmContracts, frmContractsAmendments, frmContractsBillingBook, frmDBChangeHistory, frmDBChanges, frmLocations, frmLocationsAddressMaintenance, frmLocationsContacts, frmLocationsHQManagers, frmLocationsSelectStaff, frmMainMenu, frmMainMenuUserPermissions, frmMaint, frmMaintAutismDiagnoses, frmMaintAutismReferral, frmMaintClusters, frmMaintEditReferenceTables, frmMaintLetterSignatures, frmMaintMonthlyMaster, frmMaintMonthlyMasterComments, frmMaintSalutations, frmMaintUserPermissions, frmPeople, frmPeopleAddressMaintenance, frmPeopleChangeName, frmPeopleClientsContacts, frmPeopleClientsDemographics, frmPeopleClientsDemographicsAddressMaintenance, frmPeopleClientsSelectLocation, frmPeopleClientsServiceAdultCoaching, frmPeopleClientsServiceAdultCompanion, frmPeopleClientsServiceAutism, frmPeopleClientsServiceCLO, frmPeopleClientsServiceCommunityConnections, frmPeopleClientsServiceDay, frmPeopleClientsServiceIndividualSupport, frmPeopleClientsServiceNHDay, frmPeopleClientsServiceNHRes, frmPeopleClientsServicePCA, frmPeopleClientsServicePCAContactNotes, frmPeopleClientsServicePCASurrogate, frmPeopleClientsServiceResidential, frmPeopleClientsServiceSharedLiving, frmPeopleClientsServiceSpringboard, frmPeopleClientsServiceTRASE, frmPeopleClientsServiceTransportation, frmPeopleClientsServiceVocational, frmPeopleClientsVendors, frmPeopleConsultants, frmPeopleCounts, frmPeopleDonors, frmPeopleDonorsNewDonation, frmPeopleEnterAndValidateAddress, frmPeopleEnterAndValidatePerson, frmPeopleFamily, frmPeopleFamilyEnterAndValidatePerson, frmPeopleScheduleStaffChanges, frmPeopleSelectPerson, frmPeopleShowOpenStaffPositions, frmPeopleShowScheduleStaffChanges, frmPleaseWait, frmPleaseWaitBrief, frmPleaseWaitCustom, frmPleaseWaitStaffandSkills, frmProgressMessages, frmRpt, frmRptExpDNRTILLEGRAM, frmRptExpMAILINGSANDSPREADSHEETS, frmRptFinancialAndLetters, frmRptPCAReportsAndExports, frmStaffEvalsAndSupervisions |
| Reports | 143 | ltrAUTODEPOSITAUTH, ltrAUTODEPOSITAUTHTILL, ltrEMGAUTH, ltrEMGAUTHSelfApproval, ltrEWDLS, ltrEWDLSTILL, ltrGUARDIANINFO, ltrGUARDIANINFOAllClients, ltrINDIVFINANCES, ltrINDIVFINANCESBLANK, ltrINDIVFINANCESBLANKold, ltrINDIVFINANCESCOMPLETELYBLANK, ltrINDIVFINANCESCOMPLETELYBLANKABI, ltrINDIVFINANCESold, ltrINTRODUCTION, ltrMEDIARELEASECOMPETENT, ltrMEDIARELEASEINCOMPETENT, ltrREPPAYEEFEE, ltrREPPAYEEFEEAllClients, ltrREPPAYEEFOLLOWUPAllClients, ltrREPPAYEEFOLLOWUPSelectedClient, ltrREPPAYEEFOLLOWUPTillIsNotRepPayee, ltrREPPAYEEFOLLOWUPTillIsRepPayee, ltrREQINFO, ltrRTNAUTH, ltrRTNAUTHSelfApproval, ltrSECTION8AUTH, ltrSIGONFILE, ltrSSAWARD, ltrSUPREL, ltrSUPRELSelfApproval, ltrTRVREL, ltrTRVRELSelfApproval, rptAMENDMENTS, rptAUTISM, rptAUTISMDEMO, rptAUTISMFamily, rptBADADDRESSES, rptBILLINGBOOK, rptCFCMETHOD, rptCLIENTCC, rptCLIENTCONTACTSGUARDIANS, rptCLIENTERRORS, rptCLIENTERRORS_LAND, rptCONINWORKS, rptCONSUMMARY, rptCONSUMMARYALL, rptCONTACTS, rptCONTACTSDaySort, rptCONTACTSResSort, rptDAYATTEND, rptDAYCLIENTS, rptDAYCLIENTSSHORT, rptDAYEMERGENCYPHONES, rptDAYEMERGENCYPHONESDETAILS, rptDAYEMERGENCYPHONESGLOBALS, rptDAYSERVICESDR, rptDAYSEVERITY, rptDDSContactsListForResidentialServices, rptDECEASED, rptDECEASEDClientFamily, rptDECEASEDFamilyClient, rptDIRCONTRACTS, rptDIRECTREPORTS, rptDNRSUMMARY, rptDirectoryAlphaShort, rptDirectoryAlphaShortDay, rptDirectoryAlphaShortDayLARGE, rptDirectoryAlphaShortLARGE, rptDirectoryAlphaShortNonRes, rptDirectoryAlphaShortNonResLARGE, rptDirectoryAlphaShortRes, rptDirectoryAlphaShortResLARGE, rptDirectoryAlphaShortVoc, rptDirectoryAlphaShortVocLARGE, rptDirectoryReceptionist, rptEXPIRATIONDATES, rptEXPIRATIONDATESclients, rptEXPIRATIONDATESclients_Original, rptEXPIRATIONDATESday, rptEXPIRATIONDATESday_Original, rptEXPIRATIONDATEShouse, rptEXPIRATIONDATEShouse_Original, rptEXPIRATIONDATESredreport, rptEXPIRATIONDATESredreportsupervisionsonly, rptEXPIRATIONDATESstaff, rptEXPIRATIONDATESstaff_Original, rptFIRSTTIMEDONORS, rptGPMONTHLY, rptINDIVSUP, rptJULIEBILLS, rptMNTHLYDONORS, rptMNTHLYDONORSOTHERS, rptMONTHLYMASTERCOMMENTS, rptMSAMISC, rptNAMESBYADDRESS, rptNHBILLS, rptNHCONTRACTS, rptONCALL, rptONCALLLocations, rptPCABILLING, rptPCAFACE, rptPROGCONT, rptPROGCONTSHORT, rptPROGCONTSHORTRESONLY, rptPROGRAMCOUNTS, rptREPPAYEESbyClient, rptREPPAYEESbyLocationDay, rptREPPAYEESbyLocationRes, rptRESBANKING, rptRESBENEFITS, rptRESCLIENTS, rptRESCLIENTSBYSITE, rptRESCLIENTSNoContacts, rptRESCLUSTERS, rptRESEMERGENCYPHONES, rptRESEMERGENCYPHONESDETAILS, rptRESEMERGENCYPHONESGLOBALS, rptRESEMERGENCYPHONESSUMMARY, rptRESIDENTIALDR, rptRESPHONENUMBERS, rptRESPHONENUMBERSleft, rptRESPHONENUMBERSmiddle, rptRESPHONENUMBERSright, rptRESRMBD, rptSECTION8, rptSHC, rptSNAP, rptSPRINGBOARD, rptSPRINGBOARDClients, rptSSASUMMARY, rptSTAFFWITHNOSKILLS, rptTILLLocations, rptTRASE, rptVALIDCLI, rptVALIDCLIAUT, rptVALIDCLIFAM, rptVALIDFAM, rptVALIDIP, rptVICTORIABILLS, rptVOCSERVICESDR, ~rptTEMPLATELandscape, ~rptTEMPLATEPortrait |
| Modules | 6 | AddressValidation, Expirations, GlobalVariables, ModReportFieldManager, PublicSubroutines, Utilities |
| Classes | 0 |  |
| Macros | 0 |  |

