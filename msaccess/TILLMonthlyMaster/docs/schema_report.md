# Schema Report: TILLMonthlyMaster
---
## Tables
### AllClients
| Column | Type | Size |
|--------|------|------|
| IndexedName | VARCHAR | 160 |
| DisplayName | VARCHAR | 255 |
| ReverseDisplayName | VARCHAR | 255 |
| LastName | VARCHAR | 25 |
| FirstName | VARCHAR | 25 |
| MiddleInitial | VARCHAR | 1 |
| ProgramCityTown | VARCHAR | 50 |
| ProgramLocation | VARCHAR | 80 |

**Row count:** 4

### tblExpirations
| Column | Type | Size |
|--------|------|------|
| Location | VARCHAR | 75 |
| RecordType | VARCHAR | 6 |
| Supervisor | VARCHAR | 8 |
| LastName | VARCHAR | 25 |
| FirstName | VARCHAR | 25 |
| JobTitle | VARCHAR | 30 |
| AdjustedStartDate | VARCHAR | 10 |
| LastVehicleChecklistCompleted | VARCHAR | 10 |
| MostRecentAsleepFireDrill | VARCHAR | 10 |
| NextRecentAsleepFireDrill | VARCHAR | 10 |
| HouseSafetyPlanExpires | VARCHAR | 10 |
| HousePlansReviewedByStaffBefore | VARCHAR | 10 |
| DAYStaffTrainedInPrivacyBefore | VARCHAR | 10 |
| DAYAllPlansReviewedByStaffBefore | VARCHAR | 10 |
| DAYQtrlySafetyChecklistDueBy | VARCHAR | 10 |
| MAPChecklistCompleted | VARCHAR | 10 |
| HumanRightsOfficer | VARCHAR | 50 |
| HROTrainsStaffBefore | VARCHAR | 10 |
| HROTrainsIndividualsBefore | VARCHAR | 10 |
| FireSafetyOfficer | VARCHAR | 50 |
| FSOTrainsStaffBefore | VARCHAR | 10 |
| FSOTrainsIndividualsBefore | VARCHAR | 10 |
| DateISP | VARCHAR | 10 |
| DateConsentFormsSigned | VARCHAR | 10 |
| DateBMMExpires | VARCHAR | 10 |
| DateBMMAccessSignedHRC | VARCHAR | 10 |
| DateBMMAccessSigned | VARCHAR | 10 |
| DateSPDAuthExpires | VARCHAR | 10 |
| DateSPDSignedHRC | VARCHAR | 10 |
| DateSPDSigned | VARCHAR | 10 |
| DateSignaturesDueBy | VARCHAR | 10 |
| AllSPDSignaturesReceived | BIT | 1 |
| BBP | VARCHAR | 10 |
| BackInjuryPrevention | VARCHAR | 10 |
| CPR | VARCHAR | 10 |
| DefensiveDriving | VARCHAR | 10 |
| DriversLicense | VARCHAR | 10 |
| FirstAid | VARCHAR | 10 |
| MAPCert | VARCHAR | 10 |
| PBS | VARCHAR | 10 |
| SafetyCares | VARCHAR | 10 |
| TB | VARCHAR | 10 |
| WheelchairSafety | VARCHAR | 10 |
| WorkplaceViolence | VARCHAR | 10 |
| ProfessionalLicenses | VARCHAR | 10 |
| ThreeMonthEvaluation | BIT | 1 |
| EvalDueBy | VARCHAR | 10 |
| LastSupervision | VARCHAR | 10 |
| OnLeave | BIT | 1 |

**Row count:** 0

### tblPeopleClientsMonthlyMaster
| Column | Type | Size |
|--------|------|------|
| IndexedName | VARCHAR | 160 |
| FamilyLN | VARCHAR | 25 |
| FamilyFN | VARCHAR | 25 |
| ProgramType | VARCHAR | 15 |
| ProgramCity | VARCHAR | 30 |
| ProgramLocation | VARCHAR | 30 |
| StaffPrimaryContactLastName | VARCHAR | 25 |
| StaffPrimaryContactFirstName | VARCHAR | 25 |
| LastName | VARCHAR | 25 |
| FirstName | VARCHAR | 25 |
| MiddleInitial | VARCHAR | 1 |
| LegalStatus | VARCHAR | 20 |
| ClientIsDeceased | BIT | 1 |
| ClientIsDeceasedChanged | BIT | 1 |
| ClientDeceasedDate | VARCHAR | 10 |
| ClientDeceasedDateChanged | BIT | 1 |
| ClientIsInactive | BIT | 1 |
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
| ResVendorLocation | VARCHAR | 50 |
| ResVendorLocationChanged | BIT | 1 |
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
| DayVendorLocation | VARCHAR | 50 |
| DayVendorLocationChanged | BIT | 1 |
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
| FamilyLNChanged | BIT | 1 |
| FamilyFNChanged | BIT | 1 |
| FamilyMI | VARCHAR | 1 |
| FamilyMIChanged | BIT | 1 |
| FamilyIsDeceased | BIT | 1 |
| FamilyIsDeceasedChanged | BIT | 1 |
| FamilyDeceasedDate | VARCHAR | 10 |
| FamilyDeceasedDateChanged | BIT | 1 |
| FamilyIsInactive | BIT | 1 |
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
| LastUpdated | DATETIME | 19 |
| RecordUpdated | BIT | 1 |
| RemoveFamilyMember | BIT | 1 |
| RemoveFamilyMemberChanged | BIT | 1 |
| Comments | LONGCHAR | 1073741823 |
| InactDay | BIT | 1 |
| InactRes | BIT | 1 |
| InactCLO | BIT | 1 |
| InactVoc | BIT | 1 |
| InactNHD | BIT | 1 |
| InactNHR | BIT | 1 |
| InactSL | BIT | 1 |
| InactAFC | BIT | 1 |
| InactISS | BIT | 1 |

**Row count:** 992

### tblPeopleClientsMonthlyMasterUpdate
| Column | Type | Size |
|--------|------|------|
| IndexedName | VARCHAR | 160 |
| FamilyLN | VARCHAR | 25 |
| FamilyFN | VARCHAR | 25 |
| ProgramType | VARCHAR | 15 |
| ProgramCity | VARCHAR | 30 |
| ProgramLocation | VARCHAR | 30 |
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
| ResVendorLocation | VARCHAR | 50 |
| ResVendorLocationChanged | BIT | 1 |
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
| DayVendorLocation | VARCHAR | 50 |
| DayVendorLocationChanged | BIT | 1 |
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
| FamilyLNChanged | BIT | 1 |
| FamilyFNChanged | BIT | 1 |
| FamilyMI | VARCHAR | 1 |
| FamilyMIChanged | BIT | 1 |
| FamilyIsDeceased | BIT | 1 |
| FamilyIsDeceasedChanged | BIT | 1 |
| FamilyDeceasedDate | VARCHAR | 10 |
| FamilyDeceasedDateChanged | BIT | 1 |
| FamilyIsInactive | BIT | 1 |
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
| LastUpdated | DATETIME | 19 |
| RecordUpdated | BIT | 1 |
| RemoveFamilyMember | BIT | 1 |
| RemoveFamilyMemberChanged | BIT | 1 |
| Comments | LONGCHAR | 1073741823 |

**Row count:** 0

### temptbl1
| Column | Type | Size |
|--------|------|------|
| IndexedName | VARCHAR | 160 |
| LastName | VARCHAR | 80 |
| FirstName | VARCHAR | 25 |
| MiddleInitial | VARCHAR | 1 |
| PhysicalAddress | VARCHAR | 50 |
| PhysicalCity | VARCHAR | 25 |
| PhysicalState | VARCHAR | 2 |
| PhysicalZIP | VARCHAR | 10 |
| MailingAddress | VARCHAR | 50 |
| MailingCity | VARCHAR | 25 |
| MailingState | VARCHAR | 2 |
| MailingZIP | VARCHAR | 10 |
| HomePhone | VARCHAR | 15 |
| WorkPhone | VARCHAR | 15 |
| MobilePhone | VARCHAR | 15 |
| EmailAddress | VARCHAR | 60 |
| ClientIsDeceased | BIT | 1 |
| ClientDeceasedDate | VARCHAR | 10 |
| LegalStatus | VARCHAR | 20 |
| ActiveDayServices | BIT | 1 |
| ActiveResidentialServices | BIT | 1 |
| ActiveCLO | BIT | 1 |
| ActiveVocationalServices | BIT | 1 |
| ActiveNHDay | BIT | 1 |
| ActiveNHRes | BIT | 1 |
| ActiveSharedLiving | BIT | 1 |
| ActiveAFC | BIT | 1 |
| ActiveIndivSupport | BIT | 1 |
| DateISP | VARCHAR | 10 |
| DateConsentFormsSigned | VARCHAR | 10 |
| DateBMMAccessSigned | VARCHAR | 10 |
| DateSPDAuthExpires | VARCHAR | 10 |
| ResidentialVendor | VARCHAR | 30 |
| ResVendorAddress | VARCHAR | 40 |
| ResVendorCity | VARCHAR | 25 |
| ResVendorState | VARCHAR | 2 |
| ResVendorZIP | VARCHAR | 10 |
| ResidentialVendorPhoneNumber | VARCHAR | 15 |
| ResVendorLocation | VARCHAR | 50 |
| LivingWithParentOrGuardian | BIT | 1 |
| LivingIndependently | BIT | 1 |
| DayVendor | VARCHAR | 30 |
| DayVendorAddress | VARCHAR | 40 |
| DayVendorCity | VARCHAR | 25 |
| DayVendorState | VARCHAR | 2 |
| DayVendorZIP | VARCHAR | 10 |
| DayVendorPhoneNumber | VARCHAR | 15 |
| DayVendorLocation | VARCHAR | 50 |
| PCPName | VARCHAR | 50 |
| PCPOffice | VARCHAR | 50 |
| PCPAddress | VARCHAR | 50 |
| PCPCity | VARCHAR | 25 |
| PCPState | VARCHAR | 2 |
| PCPZIP | VARCHAR | 10 |
| PCPPhoneNumber | VARCHAR | 15 |
| PCPFaxNumber | VARCHAR | 15 |
| PCPEmailAddress | VARCHAR | 60 |
| PCPHospitalAffiliation | VARCHAR | 50 |
| PCPNPI | VARCHAR | 10 |
| InactDay | BIT | 1 |
| InactRes | BIT | 1 |
| InactCLO | BIT | 1 |
| InactVoc | BIT | 1 |
| InactNHD | BIT | 1 |
| InactNHR | BIT | 1 |
| InactSL | BIT | 1 |
| InactAFC | BIT | 1 |
| InactISS | BIT | 1 |

### temptbl2
| Column | Type | Size |
|--------|------|------|
| IndexedName | VARCHAR | 160 |
| LastName | VARCHAR | 80 |
| FirstName | VARCHAR | 25 |
| MiddleInitial | VARCHAR | 1 |
| PhysicalAddress | VARCHAR | 50 |
| PhysicalCity | VARCHAR | 25 |
| PhysicalState | VARCHAR | 2 |
| PhysicalZIP | VARCHAR | 10 |
| MailingAddress | VARCHAR | 50 |
| MailingCity | VARCHAR | 25 |
| MailingState | VARCHAR | 2 |
| MailingZIP | VARCHAR | 10 |
| HomePhone | VARCHAR | 15 |
| WorkPhone | VARCHAR | 15 |
| MobilePhone | VARCHAR | 15 |
| EmailAddress | VARCHAR | 60 |
| ClientIsDeceased | BIT | 1 |
| ClientDeceasedDate | VARCHAR | 10 |
| LegalStatus | VARCHAR | 20 |
| ActiveDayServices | BIT | 1 |
| ActiveResidentialServices | BIT | 1 |
| ActiveCLO | BIT | 1 |
| ActiveVocationalServices | BIT | 1 |
| ActiveNHDay | BIT | 1 |
| ActiveNHRes | BIT | 1 |
| ActiveSharedLiving | BIT | 1 |
| ActiveAFC | BIT | 1 |
| ActiveIndivSupport | BIT | 1 |
| DateISP | VARCHAR | 10 |
| DateConsentFormsSigned | VARCHAR | 10 |
| DateBMMAccessSigned | VARCHAR | 10 |
| DateSPDAuthExpires | VARCHAR | 10 |
| ResidentialVendor | VARCHAR | 30 |
| ResVendorAddress | VARCHAR | 40 |
| ResVendorCity | VARCHAR | 25 |
| ResVendorState | VARCHAR | 2 |
| ResVendorZIP | VARCHAR | 10 |
| ResidentialVendorPhoneNumber | VARCHAR | 15 |
| ResVendorLocation | VARCHAR | 50 |
| LivingWithParentOrGuardian | BIT | 1 |
| LivingIndependently | BIT | 1 |
| DayVendor | VARCHAR | 30 |
| DayVendorAddress | VARCHAR | 40 |
| DayVendorCity | VARCHAR | 25 |
| DayVendorState | VARCHAR | 2 |
| DayVendorZIP | VARCHAR | 10 |
| DayVendorPhoneNumber | VARCHAR | 15 |
| DayVendorLocation | VARCHAR | 50 |
| PCPName | VARCHAR | 50 |
| PCPOffice | VARCHAR | 50 |
| PCPAddress | VARCHAR | 50 |
| PCPCity | VARCHAR | 25 |
| PCPState | VARCHAR | 2 |
| PCPZIP | VARCHAR | 10 |
| PCPPhoneNumber | VARCHAR | 15 |
| PCPFaxNumber | VARCHAR | 15 |
| PCPEmailAddress | VARCHAR | 60 |
| PCPHospitalAffiliation | VARCHAR | 50 |
| PCPNPI | VARCHAR | 10 |
| InactDay | BIT | 1 |
| InactRes | BIT | 1 |
| InactCLO | BIT | 1 |
| InactVoc | BIT | 1 |
| InactNHD | BIT | 1 |
| InactNHR | BIT | 1 |
| InactSL | BIT | 1 |
| InactAFC | BIT | 1 |
| InactISS | BIT | 1 |
| FamilyIndexedName | VARCHAR | 160 |
| Relationship | VARCHAR | 30 |
| Guardian | BIT | 1 |
| PrimaryContact | BIT | 1 |

### temptbl3
| Column | Type | Size |
|--------|------|------|
| IndexedName | VARCHAR | 160 |
| LastName | VARCHAR | 80 |
| FirstName | VARCHAR | 25 |
| MiddleInitial | VARCHAR | 1 |
| PhysicalAddress | VARCHAR | 50 |
| PhysicalCity | VARCHAR | 25 |
| PhysicalState | VARCHAR | 2 |
| PhysicalZIP | VARCHAR | 10 |
| MailingAddress | VARCHAR | 50 |
| MailingCity | VARCHAR | 25 |
| MailingState | VARCHAR | 2 |
| MailingZIP | VARCHAR | 10 |
| HomePhone | VARCHAR | 15 |
| WorkPhone | VARCHAR | 15 |
| MobilePhone | VARCHAR | 15 |
| EmailAddress | VARCHAR | 60 |
| ClientIsDeceased | BIT | 1 |
| ClientDeceasedDate | VARCHAR | 10 |
| LegalStatus | VARCHAR | 20 |
| ActiveDayServices | BIT | 1 |
| ActiveResidentialServices | BIT | 1 |
| ActiveCLO | BIT | 1 |
| ActiveVocationalServices | BIT | 1 |
| ActiveNHDay | BIT | 1 |
| ActiveNHRes | BIT | 1 |
| ActiveSharedLiving | BIT | 1 |
| ActiveAFC | BIT | 1 |
| ActiveIndivSupport | BIT | 1 |
| DateISP | VARCHAR | 10 |
| DateConsentFormsSigned | VARCHAR | 10 |
| DateBMMAccessSigned | VARCHAR | 10 |
| DateSPDAuthExpires | VARCHAR | 10 |
| ResidentialVendor | VARCHAR | 30 |
| ResVendorAddress | VARCHAR | 40 |
| ResVendorCity | VARCHAR | 25 |
| ResVendorState | VARCHAR | 2 |
| ResVendorZIP | VARCHAR | 10 |
| ResidentialVendorPhoneNumber | VARCHAR | 15 |
| ResVendorLocation | VARCHAR | 50 |
| LivingWithParentOrGuardian | BIT | 1 |
| LivingIndependently | BIT | 1 |
| DayVendor | VARCHAR | 30 |
| DayVendorAddress | VARCHAR | 40 |
| DayVendorCity | VARCHAR | 25 |
| DayVendorState | VARCHAR | 2 |
| DayVendorZIP | VARCHAR | 10 |
| DayVendorPhoneNumber | VARCHAR | 15 |
| DayVendorLocation | VARCHAR | 50 |
| PCPName | VARCHAR | 50 |
| PCPOffice | VARCHAR | 50 |
| PCPAddress | VARCHAR | 50 |
| PCPCity | VARCHAR | 25 |
| PCPState | VARCHAR | 2 |
| PCPZIP | VARCHAR | 10 |
| PCPPhoneNumber | VARCHAR | 15 |
| PCPFaxNumber | VARCHAR | 15 |
| PCPEmailAddress | VARCHAR | 60 |
| PCPHospitalAffiliation | VARCHAR | 50 |
| PCPNPI | VARCHAR | 10 |
| InactDay | BIT | 1 |
| InactRes | BIT | 1 |
| InactCLO | BIT | 1 |
| InactVoc | BIT | 1 |
| InactNHD | BIT | 1 |
| InactNHR | BIT | 1 |
| InactSL | BIT | 1 |
| InactAFC | BIT | 1 |
| InactISS | BIT | 1 |
| FamilyIndexedName | VARCHAR | 160 |
| Relationship | VARCHAR | 30 |
| Guardian | BIT | 1 |
| PrimaryContact | BIT | 1 |
| FamilyLN | VARCHAR | 80 |
| FamilyFN | VARCHAR | 25 |
| FamilyMI | VARCHAR | 1 |
| FamilyIsDeceased | BIT | 1 |
| FamilyDeceasedDate | VARCHAR | 10 |
| FamilyPhysicalAddress | VARCHAR | 50 |
| FamilyPhysicalCity | VARCHAR | 25 |
| FamilyPhysicalState | VARCHAR | 2 |
| FamilyPhysicalZIP | VARCHAR | 10 |
| FamilyMailingAddress | VARCHAR | 50 |
| FamilyMailingCity | VARCHAR | 25 |
| FamilyMailingState | VARCHAR | 2 |
| FamilyMailingZIP | VARCHAR | 10 |
| FamilyHomePhone | VARCHAR | 15 |
| FamilyWorkPhone | VARCHAR | 15 |
| FamilyMobilePhone | VARCHAR | 15 |
| FamilyEmailAddress | VARCHAR | 60 |

### temptbl7
| Column | Type | Size |
|--------|------|------|
| PeopleFamilyGUID | GUID | 36 |
| PeopleGUID | GUID | 36 |
| IndexedName | VARCHAR | 160 |
| ClientIndexedName | VARCHAR | 160 |
| RecordAddedDate | VARCHAR | 10 |
| RecordAddedBy | VARCHAR | 128 |
| ClientLastName | VARCHAR | 25 |
| ClientFirstName | VARCHAR | 25 |
| ClientMiddleInitial | VARCHAR | 1 |
| Relationship | VARCHAR | 30 |
| Guardian | BIT | 1 |
| PrimaryContact | BIT | 1 |
| Surrogate | BIT | 1 |
| RepPayee | BIT | 1 |
| Inactive | BIT | 1 |
| SSMA_TimeStamp | VARBINARY | 8 |

## Relationships
No relationships extracted.

## Queries
### Copy Of qryExportDayAttendance
```sql
SELECT tblPeopleDayAttendance.ClientID, tblPeopleDayAttendance.LastName, tblPeopleDayAttendance.FirstName, tblPeopleDayAttendance.MiddleInitial, tblPeopleDayAttendance.City, tblPeopleDayAttendance.Loc, tblPeopleDayAttendance.Prf, tblPeopleDayAttendance.Sev, tblPeopleDayAttendance.Rate, tblPeopleDayAttendance.Fund, tblPeopleDayAttendance.SpecialFundingCode, tblPeopleDayAttendance.STM, tblPeopleDayAttendance.IsDeceased, tblPeopleDayAttendance.CostCenter, tblPeopleDayAttendance.UnitsMO, tblPeopleDa...
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
INSERT INTO [~TempSuperCodes] ( GPCode, GPSuperCode )

SELECT tblStaff.DEPRTMNT, tblStaff.SUPERVISORCODE_I

FROM tblStaff

WHERE (((tblStaff.DIVISIONCODE_I) = 'RESIDE') AND ((tblStaff.JobTitle) = 'RESUNT')) OR 

(((tblStaff.DIVISIONCODE_I) = 'RESIDE') And ((tblStaff.JobTitle) = 'RESUPR')) OR 

(((tblStaff.DIVISIONCODE_I) = 'DAYHAB') And ((tblStaff.JobTitle) = 'DASUPR'))

ORDER BY tblStaff.DEPRTMNT;
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

SELECT GPName ...
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
UPDATE qrytblExpirations INNER JOIN temptbl3 ON (qrytblExpirations.Location = temptbl3.DEPRTMNT) AND (qrytblExpirations.LastName = temptbl3.LASTNAME) AND (qrytblExpirations.FirstName = temptbl3.FRSTNAME) SET qrytblExpirations.CPR = [temptbl3].[CPR], qrytblExpirations.FirstAid = [temptbl3].[FirstAid], qrytblExpirations.MAPCert = [temptbl3].[MAPCert], qrytblExpirations.DriversLicense = [temptbl3].[DriversLicense], qrytblExpirations.BBP = [temptbl3].[BBP], qrytblExpirations.BackInjuryPrevention = [...
```
### qryEXPIRATIONS23
```sql
UPDATE qrytblExpirations INNER JOIN qrytblStaffEvalsAndSupervisions ON (qrytblExpirations.FirstName = qrytblStaffEvalsAndSupervisions.FirstName) AND (qrytblExpirations.LastName = qrytblStaffEvalsAndSupervisions.LastName) SET qrytblExpirations.ThreeMonthEvaluation = [qrytblStaffEvalsAndSupervisions]![ThreeMonthEval], qrytblExpirations.EvalDueBy = [qrytblStaffEvalsAndSupervisions]![EvalDueBy], qrytblExpirations.LastSupervision = [qrytblStaffEvalsAndSupervisions]![LastSupervision], qrytblExpiration...
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
### qryExportDayAttendance
```sql
SELECT tblPeopleDayAttendance.ClientID, tblPeopleDayAttendance.LastName, tblPeopleDayAttendance.FirstName, tblPeopleDayAttendance.MiddleInitial, tblPeopleDayAttendance.City, tblPeopleDayAttendance.Loc, tblPeopleDayAttendance.Prf, tblPeopleDayAttendance.Sev, tblPeopleDayAttendance.Rate, tblPeopleDayAttendance.Fund, tblPeopleDayAttendance.SpecialFundingCode, tblPeopleDayAttendance.IsDeceased, tblPeopleDayAttendance.CostCenter, tblPeopleDayAttendance.UnitsMO, tblPeopleDayAttendance.WhereMO, tblPeop...
```
### qryExportDayAttendanceCalculated
```sql
SELECT temptbl0.ClientID, temptbl0.LastName, temptbl0.FirstName, temptbl0.MiddleInitial, temptbl0.City, temptbl0.Loc, temptbl0.Prf, temptbl0.Sev, temptbl0.Rate, temptbl0.Fund, temptbl0.SpecialFundingCode, temptbl0.IsDeceased, temptbl0.CostCenter, temptbl0.WeekEnding, temptbl0.CodeMO AS Expr1, temptbl0.HrsMO AS Expr2, temptbl0.CodeTU AS Expr3, temptbl0.HrsTU AS Expr4, temptbl0.CodeWE AS Expr5, temptbl0.HrsWE AS Expr6, temptbl0.CodeTH AS Expr7, temptbl0.HrsTH AS Expr8, temptbl0.CodeFR AS Expr9, te...
```
### qryExportDayAttendanceCalculatedOLD
```sql
SELECT temptbl0.ClientID AS Expr1, temptbl0.LastName AS Expr2, temptbl0.FirstName AS Expr3, temptbl0.MiddleInitial AS Expr4, temptbl0.City AS Expr5, temptbl0.Loc AS Expr6, temptbl0.Prf AS Expr7, temptbl0.Sev AS Expr8, temptbl0.Rate AS Expr9, temptbl0.Fund AS Expr10, temptbl0.SpecialFundingCode AS Expr11, temptbl0.IsDeceased AS Expr12, temptbl0.CostCenter AS Expr13, temptbl0.WeekEnding AS Expr14, temptbl0.CodeMO AS Expr15, temptbl0.HrsMO AS Expr16, temptbl0.CodeTU AS Expr17, temptbl0.HrsTU AS Exp...
```
### qryExportDayAttendanceOLD
```sql
SELECT DLookUp("ClientID","tblPeopleClientsDemographics","IndexedName=""" & [tblPeopleDayAttendance].[IndexedName] & """") AS ClientID, tblPeopleDayAttendance.LastName, tblPeopleDayAttendance.FirstName, tblPeopleDayAttendance.MiddleInitial, tblPeopleDayAttendance.City, tblPeopleDayAttendance.Loc, tblPeopleDayAttendance.Prf, tblPeopleDayAttendance.Sev, tblPeopleDayAttendance.Rate, tblPeopleDayAttendance.Fund, tblPeopleDayAttendance.SpecialFundingCode, tblPeopleDayAttendance.STM, tblPeopleDayAtten...
```
### qryExportDayAttendanceOLDER
```sql
SELECT tblPeopleDayAttendance.ClientID, tblPeopleDayAttendance.LastName, tblPeopleDayAttendance.FirstName, tblPeopleDayAttendance.MiddleInitial, tblPeopleDayAttendance.City, tblPeopleDayAttendance.Loc, tblPeopleDayAttendance.Prf, tblPeopleDayAttendance.Sev, tblPeopleDayAttendance.Rate, tblPeopleDayAttendance.Fund, tblPeopleDayAttendance.SpecialFundingCode, tblPeopleDayAttendance.STM, tblPeopleDayAttendance.IsDeceased, tblPeopleDayAttendance.CostCenter, tblPeopleDayAttendance.UnitsMO, tblPeopleDa...
```
### qryProgramsByCity
```sql
SELECT DISTINCT tblTILLMonthlyMaster.ProgramLocation AS Expr1

FROM tblTILLMonthlyMaster

WHERE (((tblTILLMonthlyMaster.ProgramCity)=[Forms]![frmMainMenu]![SelectedCity]))

ORDER BY tblTILLMonthlyMaster.ProgramLocation;
```
### qryRptSeverityRates
```sql
UPDATE tblPeopleDayAttendance SET tblPeopleDayAttendance.Rate = DLookUp("MedicaidRate","catSeverityRates","Severity='" & [tblPeopleDayAttendance].[Sev] & "'");
```
### qrySelectedClients
```sql
SELECT tblPeopleClientsMonthlyMaster.*

FROM tblPeopleClientsMonthlyMaster

WHERE (((tblPeopleClientsMonthlyMaster.ProgramCity)=Forms!frmMainMenu!SelectedCity) And ((tblPeopleClientsMonthlyMaster.ProgramLocation)=Forms!frmMainMenu!SelectedProgram));
```
### qrytblExpirations
```sql
SELECT tblExpirations.*

FROM tblExpirations;
```
### qrytblPeopleClientsDemographics
```sql
SELECT tblPeopleClientsDemographics.*

FROM tblPeopleClientsDemographics;
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

## VBA Object Inventory
| Type | Count | Objects |
|------|-------|--------|
| Forms | 12 | frmMainMenu, frmPeopleClientsComments, frmPeopleClientsConsentForms, frmPeopleClientsMonthlyMaster, frmPeopleClientsMonthlyMasterFamily, frmPeopleClientsMonthlyMasterFamilyUpdate, frmPeopleClientsMonthlyMasterUpdate, frmPeopleDayAttendance, frmPeopleDayAttendanceInit, frmPeopleDayAttendanceOLD, frmStartup, frmStartupExp |
| Reports | 21 | ltrEMGAUTH, ltrEMGAUTHSelfApproval, ltrMEDIARELEASECOMPETENT, ltrMEDIARELEASEINCOMPETENT, ltrRTNAUTH, ltrRTNAUTHSelfApproval, ltrSUPREL, ltrSUPRELSelfApproval, ltrTRVREL, ltrTRVRELSelfApproval, rptDAYATTEND, rptDAYATTEND-NEW, rptDAYATTENDETC, rptDAYATTENDOLD, rptDAYATTENDolder, rptEXPIRATIONDATES, rptEXPIRATIONDATESclients, rptEXPIRATIONDATESday, rptEXPIRATIONDATEShouse, rptEXPIRATIONDATESstaff, rptEXPIRATIONDATESstaffOLD |
| Modules | 1 | GlobalCode |
| Classes | 0 |  |
| Macros | 0 |  |

