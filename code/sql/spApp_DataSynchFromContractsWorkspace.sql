CREATE OR ALTER PROCEDURE [dbo].[spApp_DataSynchFromContractsWorkspace]
AS
BEGIN
    SET NOCOUNT ON;

    ---------------------------------------------------------------------------
    -- PART A: Handle NEW records (ContractGUID IS NULL in workspace)
    ---------------------------------------------------------------------------

    -- A1: Assign new ContractGUIDs to workspace rows that don't have one
    UPDATE dbo.tempContractsWorkspace
    SET ContractGUID = NEWID()
    WHERE ContractGUID IS NULL;

    -- A2: Insert any new Funders that don't already exist in tblTILLFunders
    INSERT INTO dbo.tblTILLFunders (Funder)
    SELECT w.FUNDER
    FROM dbo.tempContractsWorkspace w
    WHERE w.FUNDER IS NOT NULL
      AND NOT EXISTS (
          SELECT 1
          FROM dbo.tblTILLFunders f
          WHERE f.Funder = w.FUNDER
      )
    GROUP BY w.FUNDER;

    -- A3: Insert new ContractNumbers that don't already exist in tblTILLContractNumbers
    INSERT INTO dbo.tblTILLContractNumbers
    (
        ContractNumber,
        FiscalYear,
        Funder
    )
    SELECT w.[CONTRACT #],
           w.FY,
           w.FUNDER
    FROM dbo.tempContractsWorkspace w
    WHERE NOT EXISTS (
        SELECT 1
        FROM dbo.tblTILLContractNumbers cn
        WHERE cn.ContractNumber = w.[CONTRACT #]
          AND cn.FiscalYear = w.FY
          AND cn.Funder = w.FUNDER
    )
    GROUP BY w.[CONTRACT #],
             w.FY,
             w.FUNDER;

    -- A4: Insert new Contracts that don't already exist in tblTILLContracts
    INSERT INTO dbo.tblTILLContracts
    (
        ContractGUID,
        ContractLineNumber,
        ContractNumberGUID,
        Alias,
        GPNumber,
        AreaOffice,
        ClientLastNameFirstName,
        ActivityCode,
        EIMServiceType,
        ContractDescription,
        OldMaxOBL,
        MaxOBL,
        HoldBacks,
        AmendNumber,
        TotalUnits,
        UnitType,
        AcctStaff,
        DirectorName,
        ContractLocation,
        UFR_New,
        UFR_Old,
        CCtr,
        GPLineNumber
    )
    SELECT w.ContractGUID,
           w.[Line#],
           cn.ContractNumberGUID,
           ISNULL(w.ALIAS, ''),
           w.[GP#],
           ISNULL(w.[AREA OFFICE], ''),
           ISNULL(w.[LAST NAME, FIRST NAME ], ''),
           ISNULL(w.[ACTIVITY CODE], ''),
           ISNULL(w.[EIM-SERVICE TYPE], ''),
           ISNULL(w.DESCRIPTION, ''),
           w.[OLD MAX OBL, before RATE increase],
           w.[MAX OBL],
           w.HOLDBACKS,
           w.[AMEND#],
           w.[TOTAL UNITS],
           ISNULL(w.[Unit Type], ''),
           ISNULL(w.[Acct#Staff], ''),
           ISNULL(w.[Directors Name], ''),
           ISNULL(w.LOCATION, ''),
           w.[UFR,NEW],
           w.[UFR,OLD],
           ISNULL(w.CCtr, ''),
           ISNULL(w.[GP Line #], '')
    FROM dbo.tempContractsWorkspace w
        INNER JOIN dbo.tblTILLContractNumbers cn
            ON w.[CONTRACT #] = cn.ContractNumber
               AND w.FY = cn.FiscalYear
               AND w.FUNDER = cn.Funder
    WHERE NOT EXISTS (
        SELECT 1
        FROM dbo.tblTILLContracts c
        WHERE c.ContractGUID = w.ContractGUID
    );

    -- A5: Update PeopleGUID for newly inserted contracts
    UPDATE c
    SET c.PeopleGUID = p.PeopleGUID
    FROM dbo.tblTILLContracts c
        INNER JOIN dbo.tempContractsWorkspace w
            ON w.ContractGUID = c.ContractGUID
        INNER JOIN dbo.tblPeople p
            ON w.IndexedName = p.IndexedName
    WHERE c.PeopleGUID IS NULL
      AND w.IndexedName IS NOT NULL;

    -- A6: Insert billings for new contracts (all 12 months)
    --     Only insert if the billing row doesn't already exist
    INSERT INTO dbo.tblTILLContractBillings
    (
        ContractGUID, MonthNumber,
        BilledAmount, BillRate, NumberOfClient, BilledUnit, ReceivedAmount,
        RepP, CfC, Wrksh, Sect8, SNAP, Insr
    )
    -- Month 7 (July)
    SELECT w.ContractGUID, 7,
           ISNULL(w.[7-Billed $], 0), ISNULL(w.[7- Bill Rate], 0),
           CAST(ISNULL(w.[7-# Cli], 0) AS SMALLINT), CAST(ISNULL(w.[7-Billed Units], 0) AS SMALLINT),
           ISNULL(w.[7-$ Received], 0), 0,
           ISNULL(w.[7-CfC], 0), ISNULL(w.[7-Wrksh], 0),
           ISNULL(w.[7-Sect8], 0), ISNULL(w.[7-SNAP], 0), ISNULL(w.[7-Insr#], 0)
    FROM dbo.tempContractsWorkspace w
    WHERE NOT EXISTS (SELECT 1 FROM dbo.tblTILLContractBillings b WHERE b.ContractGUID = w.ContractGUID AND b.MonthNumber = 7)
    UNION ALL
    -- Month 8 (August)
    SELECT w.ContractGUID, 8,
           ISNULL(w.[8-Billed $], 0), ISNULL(w.[8- Bill Rate], 0),
           CAST(ISNULL(w.[8-# Cli], 0) AS SMALLINT), CAST(ISNULL(w.[8-Billed Units], 0) AS SMALLINT),
           ISNULL(w.[8-$ Received], 0), 0,
           ISNULL(w.[8-CfC], 0), ISNULL(w.[8-Wrksh], 0),
           ISNULL(w.[8-Sect8], 0), ISNULL(w.[8-SNAP], 0), ISNULL(w.[8-Insr#], 0)
    FROM dbo.tempContractsWorkspace w
    WHERE NOT EXISTS (SELECT 1 FROM dbo.tblTILLContractBillings b WHERE b.ContractGUID = w.ContractGUID AND b.MonthNumber = 8)
    UNION ALL
    -- Month 9 (September)
    SELECT w.ContractGUID, 9,
           ISNULL(w.[9-Billed $], 0), ISNULL(w.[9- Bill Rate], 0),
           CAST(ISNULL(w.[9-# Cli], 0) AS SMALLINT), CAST(ISNULL(w.[9-Billed Units], 0) AS SMALLINT),
           ISNULL(w.[9-$ Received], 0), 0,
           ISNULL(w.[9-CfC], 0), ISNULL(w.[9-Wrksh], 0),
           ISNULL(w.[9-Sect8], 0), ISNULL(w.[9-SNAP], 0), ISNULL(w.[9-Insr#], 0)
    FROM dbo.tempContractsWorkspace w
    WHERE NOT EXISTS (SELECT 1 FROM dbo.tblTILLContractBillings b WHERE b.ContractGUID = w.ContractGUID AND b.MonthNumber = 9)
    UNION ALL
    -- Month 10 (October)
    SELECT w.ContractGUID, 10,
           ISNULL(w.[10-Billed $], 0), ISNULL(w.[10- Bill Rate], 0),
           CAST(ISNULL(w.[10-# Cli], 0) AS SMALLINT), CAST(ISNULL(w.[10-Billed Units], 0) AS SMALLINT),
           ISNULL(w.[10-$ Received], 0), 0,
           ISNULL(w.[10-CfC], 0), ISNULL(w.[10-Wrksh], 0),
           ISNULL(w.[10-Sect8], 0), ISNULL(w.[10-SNAP], 0), ISNULL(w.[10-Insr#], 0)
    FROM dbo.tempContractsWorkspace w
    WHERE NOT EXISTS (SELECT 1 FROM dbo.tblTILLContractBillings b WHERE b.ContractGUID = w.ContractGUID AND b.MonthNumber = 10)
    UNION ALL
    -- Month 11 (November)
    SELECT w.ContractGUID, 11,
           ISNULL(w.[11-Billed $], 0), ISNULL(w.[11- Bill Rate], 0),
           CAST(ISNULL(w.[11-# Cli], 0) AS SMALLINT), CAST(ISNULL(w.[11-Billed Units], 0) AS SMALLINT),
           ISNULL(w.[11-$ Received], 0), 0,
           ISNULL(w.[11-CfC], 0), ISNULL(w.[11-Wrksh], 0),
           ISNULL(w.[11-Sect8], 0), ISNULL(w.[11-SNAP], 0), ISNULL(w.[11-Insr#], 0)
    FROM dbo.tempContractsWorkspace w
    WHERE NOT EXISTS (SELECT 1 FROM dbo.tblTILLContractBillings b WHERE b.ContractGUID = w.ContractGUID AND b.MonthNumber = 11)
    UNION ALL
    -- Month 12 (December)
    SELECT w.ContractGUID, 12,
           ISNULL(w.[12-Billed $], 0), ISNULL(w.[12- Bill Rate], 0),
           CAST(ISNULL(w.[12-# Cli], 0) AS SMALLINT), CAST(ISNULL(w.[12-Billed Units], 0) AS SMALLINT),
           ISNULL(w.[12-$ Received], 0), 0,
           ISNULL(w.[12-CfC], 0), ISNULL(w.[12-Wrksh], 0),
           ISNULL(w.[12-Sect8], 0), ISNULL(w.[12-SNAP], 0), ISNULL(w.[12-Insr#], 0)
    FROM dbo.tempContractsWorkspace w
    WHERE NOT EXISTS (SELECT 1 FROM dbo.tblTILLContractBillings b WHERE b.ContractGUID = w.ContractGUID AND b.MonthNumber = 12)
    UNION ALL
    -- Month 1 (January)
    SELECT w.ContractGUID, 1,
           ISNULL(w.[1-Billed $], 0), ISNULL(w.[1- Bill Rate], 0),
           CAST(ISNULL(w.[1-# Cli], 0) AS SMALLINT), CAST(ISNULL(w.[1-Billed Units], 0) AS SMALLINT),
           ISNULL(w.[1-$ Received], 0), 0,
           ISNULL(w.[1-CfC], 0), ISNULL(w.[1-Wrksh], 0),
           ISNULL(w.[1-Sect8], 0), ISNULL(w.[1-SNAP], 0), ISNULL(w.[1-Insr#], 0)
    FROM dbo.tempContractsWorkspace w
    WHERE NOT EXISTS (SELECT 1 FROM dbo.tblTILLContractBillings b WHERE b.ContractGUID = w.ContractGUID AND b.MonthNumber = 1)
    UNION ALL
    -- Month 2 (February)
    SELECT w.ContractGUID, 2,
           ISNULL(w.[2-Billed $], 0), ISNULL(w.[2- Bill Rate], 0),
           CAST(ISNULL(w.[2-# Cli], 0) AS SMALLINT), CAST(ISNULL(w.[2-Billed Units], 0) AS SMALLINT),
           ISNULL(w.[2-$ Received], 0), 0,
           ISNULL(w.[2-CfC], 0), ISNULL(w.[2-Wrksh], 0),
           ISNULL(w.[2-Sect8], 0), ISNULL(w.[2-SNAP], 0), ISNULL(w.[2-Insr#], 0)
    FROM dbo.tempContractsWorkspace w
    WHERE NOT EXISTS (SELECT 1 FROM dbo.tblTILLContractBillings b WHERE b.ContractGUID = w.ContractGUID AND b.MonthNumber = 2)
    UNION ALL
    -- Month 3 (March)
    SELECT w.ContractGUID, 3,
           ISNULL(w.[3-Billed $], 0), ISNULL(w.[3- Bill Rate], 0),
           CAST(ISNULL(w.[3-# Cli], 0) AS SMALLINT), CAST(ISNULL(w.[3-Billed Units], 0) AS SMALLINT),
           ISNULL(w.[3-$ Received], 0), 0,
           ISNULL(w.[3-CfC], 0), ISNULL(w.[3-Wrksh], 0),
           ISNULL(w.[3-Sect8], 0), ISNULL(w.[3-SNAP], 0), ISNULL(w.[3-Insr#], 0)
    FROM dbo.tempContractsWorkspace w
    WHERE NOT EXISTS (SELECT 1 FROM dbo.tblTILLContractBillings b WHERE b.ContractGUID = w.ContractGUID AND b.MonthNumber = 3)
    UNION ALL
    -- Month 4 (April)
    SELECT w.ContractGUID, 4,
           ISNULL(w.[4-Billed $], 0), ISNULL(w.[4- Bill Rate], 0),
           CAST(ISNULL(w.[4-# Cli], 0) AS SMALLINT), CAST(ISNULL(w.[4-Billed Units], 0) AS SMALLINT),
           ISNULL(w.[4-$ Received], 0), 0,
           ISNULL(w.[4-CfC], 0), ISNULL(w.[4-Wrksh], 0),
           ISNULL(w.[4-Sect8], 0), ISNULL(w.[4-SNAP], 0), ISNULL(w.[4-Insr#], 0)
    FROM dbo.tempContractsWorkspace w
    WHERE NOT EXISTS (SELECT 1 FROM dbo.tblTILLContractBillings b WHERE b.ContractGUID = w.ContractGUID AND b.MonthNumber = 4)
    UNION ALL
    -- Month 5 (May)
    SELECT w.ContractGUID, 5,
           ISNULL(w.[5-Billed $], 0), ISNULL(w.[5- Bill Rate], 0),
           CAST(ISNULL(w.[5-# Cli], 0) AS SMALLINT), CAST(ISNULL(w.[5-Billed Units], 0) AS SMALLINT),
           ISNULL(w.[5-$ Received], 0), 0,
           ISNULL(w.[5-CfC], 0), ISNULL(w.[5-Wrksh], 0),
           ISNULL(w.[5-Sect8], 0), ISNULL(w.[5-SNAP], 0), ISNULL(w.[5-Insr#], 0)
    FROM dbo.tempContractsWorkspace w
    WHERE NOT EXISTS (SELECT 1 FROM dbo.tblTILLContractBillings b WHERE b.ContractGUID = w.ContractGUID AND b.MonthNumber = 5)
    UNION ALL
    -- Month 6 (June)
    SELECT w.ContractGUID, 6,
           ISNULL(w.[6-Billed $], 0), ISNULL(w.[6- Bill Rate], 0),
           CAST(ISNULL(w.[6-# Cli], 0) AS SMALLINT), CAST(ISNULL(w.[6-Billed Units], 0) AS SMALLINT),
           ISNULL(w.[6-$ Received], 0), 0,
           ISNULL(w.[6-CfC], 0), ISNULL(w.[6-Wrksh], 0),
           ISNULL(w.[6-Sect8], 0), ISNULL(w.[6-SNAP], 0), ISNULL(w.[6-Insr#], 0)
    FROM dbo.tempContractsWorkspace w
    WHERE NOT EXISTS (SELECT 1 FROM dbo.tblTILLContractBillings b WHERE b.ContractGUID = w.ContractGUID AND b.MonthNumber = 6);


    ---------------------------------------------------------------------------
    -- PART B: Handle EXISTING records (ContractGUID already existed)
    ---------------------------------------------------------------------------

    -- B1: Update tblTILLContractNumbers
    UPDATE cn
    SET cn.ContractNumber = w.[CONTRACT #],
        cn.Funder         = w.FUNDER,
        cn.UpdatedOn      = GETDATE(),
        cn.UpdatedBy      = 'spApp_DataSynch'
    FROM dbo.tblTILLContractNumbers cn
        INNER JOIN dbo.tblTILLContracts c
            ON cn.ContractNumberGUID = c.ContractNumberGUID
        INNER JOIN dbo.tempContractsWorkspace w
            ON c.ContractGUID = w.ContractGUID
    WHERE w.ContractGUID IS NOT NULL;

    -- B2: Update tblTILLContracts
    UPDATE c
    SET c.ContractLineNumber      = w.[Line#],
        c.Alias                   = ISNULL(w.ALIAS, ''),
        c.GPNumber                = w.[GP#],
        c.AreaOffice              = ISNULL(w.[AREA OFFICE], ''),
        c.ClientLastNameFirstName = ISNULL(w.[LAST NAME, FIRST NAME ], ''),
        c.ActivityCode            = ISNULL(w.[ACTIVITY CODE], ''),
        c.EIMServiceType          = ISNULL(w.[EIM-SERVICE TYPE], ''),
        c.ContractDescription     = ISNULL(w.DESCRIPTION, ''),
        c.OldMaxOBL               = w.[OLD MAX OBL, before RATE increase],
        c.MaxOBL                  = w.[MAX OBL],
        c.HoldBacks               = w.HOLDBACKS,
        c.AmendNumber             = w.[AMEND#],
        c.TotalUnits              = w.[TOTAL UNITS],
        c.UnitType                = ISNULL(w.[Unit Type], ''),
        c.AcctStaff               = ISNULL(w.[Acct#Staff], ''),
        c.DirectorName            = ISNULL(w.[Directors Name], ''),
        c.ContractLocation        = ISNULL(w.LOCATION, ''),
        c.UFR_New                 = w.[UFR,NEW],
        c.UFR_Old                 = w.[UFR,OLD],
        c.CCtr                    = ISNULL(w.CCtr, ''),
        c.GPLineNumber            = ISNULL(w.[GP Line #], ''),
        c.UpdatedOn               = GETDATE(),
        c.UpdatedBy               = 'spApp_DataSynch'
    FROM dbo.tblTILLContracts c
        INNER JOIN dbo.tempContractsWorkspace w
            ON c.ContractGUID = w.ContractGUID;

    -- B3: Update PeopleGUID for all contracts based on IndexedName
    UPDATE c
    SET c.PeopleGUID = p.PeopleGUID
    FROM dbo.tblTILLContracts c
        INNER JOIN dbo.tempContractsWorkspace w
            ON c.ContractGUID = w.ContractGUID
        INNER JOIN dbo.tblPeople p
            ON w.IndexedName = p.IndexedName
    WHERE w.IndexedName IS NOT NULL;

    -- B4: Update billing data for each month
    -- Month 7
    UPDATE b
    SET b.BilledAmount   = ISNULL(w.[7-Billed $], 0),
        b.BillRate       = ISNULL(w.[7- Bill Rate], 0),
        b.NumberOfClient = CAST(ISNULL(w.[7-# Cli], 0) AS SMALLINT),
        b.BilledUnit     = CAST(ISNULL(w.[7-Billed Units], 0) AS SMALLINT),
        b.ReceivedAmount = ISNULL(w.[7-$ Received], 0),
        b.CfC            = ISNULL(w.[7-CfC], 0),
        b.Wrksh          = ISNULL(w.[7-Wrksh], 0),
        b.Sect8          = ISNULL(w.[7-Sect8], 0),
        b.SNAP           = ISNULL(w.[7-SNAP], 0),
        b.Insr           = ISNULL(w.[7-Insr#], 0),
        b.UpdatedOn      = GETDATE(),
        b.UpdatedBy      = 'spApp_DataSynch'
    FROM dbo.tblTILLContractBillings b
        INNER JOIN dbo.tempContractsWorkspace w ON b.ContractGUID = w.ContractGUID
    WHERE b.MonthNumber = 7;

    -- Month 8
    UPDATE b
    SET b.BilledAmount   = ISNULL(w.[8-Billed $], 0),
        b.BillRate       = ISNULL(w.[8- Bill Rate], 0),
        b.NumberOfClient = CAST(ISNULL(w.[8-# Cli], 0) AS SMALLINT),
        b.BilledUnit     = CAST(ISNULL(w.[8-Billed Units], 0) AS SMALLINT),
        b.ReceivedAmount = ISNULL(w.[8-$ Received], 0),
        b.CfC            = ISNULL(w.[8-CfC], 0),
        b.Wrksh          = ISNULL(w.[8-Wrksh], 0),
        b.Sect8          = ISNULL(w.[8-Sect8], 0),
        b.SNAP           = ISNULL(w.[8-SNAP], 0),
        b.Insr           = ISNULL(w.[8-Insr#], 0),
        b.UpdatedOn      = GETDATE(),
        b.UpdatedBy      = 'spApp_DataSynch'
    FROM dbo.tblTILLContractBillings b
        INNER JOIN dbo.tempContractsWorkspace w ON b.ContractGUID = w.ContractGUID
    WHERE b.MonthNumber = 8;

    -- Month 9
    UPDATE b
    SET b.BilledAmount   = ISNULL(w.[9-Billed $], 0),
        b.BillRate       = ISNULL(w.[9- Bill Rate], 0),
        b.NumberOfClient = CAST(ISNULL(w.[9-# Cli], 0) AS SMALLINT),
        b.BilledUnit     = CAST(ISNULL(w.[9-Billed Units], 0) AS SMALLINT),
        b.ReceivedAmount = ISNULL(w.[9-$ Received], 0),
        b.CfC            = ISNULL(w.[9-CfC], 0),
        b.Wrksh          = ISNULL(w.[9-Wrksh], 0),
        b.Sect8          = ISNULL(w.[9-Sect8], 0),
        b.SNAP           = ISNULL(w.[9-SNAP], 0),
        b.Insr           = ISNULL(w.[9-Insr#], 0),
        b.UpdatedOn      = GETDATE(),
        b.UpdatedBy      = 'spApp_DataSynch'
    FROM dbo.tblTILLContractBillings b
        INNER JOIN dbo.tempContractsWorkspace w ON b.ContractGUID = w.ContractGUID
    WHERE b.MonthNumber = 9;

    -- Month 10
    UPDATE b
    SET b.BilledAmount   = ISNULL(w.[10-Billed $], 0),
        b.BillRate       = ISNULL(w.[10- Bill Rate], 0),
        b.NumberOfClient = CAST(ISNULL(w.[10-# Cli], 0) AS SMALLINT),
        b.BilledUnit     = CAST(ISNULL(w.[10-Billed Units], 0) AS SMALLINT),
        b.ReceivedAmount = ISNULL(w.[10-$ Received], 0),
        b.CfC            = ISNULL(w.[10-CfC], 0),
        b.Wrksh          = ISNULL(w.[10-Wrksh], 0),
        b.Sect8          = ISNULL(w.[10-Sect8], 0),
        b.SNAP           = ISNULL(w.[10-SNAP], 0),
        b.Insr           = ISNULL(w.[10-Insr#], 0),
        b.UpdatedOn      = GETDATE(),
        b.UpdatedBy      = 'spApp_DataSynch'
    FROM dbo.tblTILLContractBillings b
        INNER JOIN dbo.tempContractsWorkspace w ON b.ContractGUID = w.ContractGUID
    WHERE b.MonthNumber = 10;

    -- Month 11
    UPDATE b
    SET b.BilledAmount   = ISNULL(w.[11-Billed $], 0),
        b.BillRate       = ISNULL(w.[11- Bill Rate], 0),
        b.NumberOfClient = CAST(ISNULL(w.[11-# Cli], 0) AS SMALLINT),
        b.BilledUnit     = CAST(ISNULL(w.[11-Billed Units], 0) AS SMALLINT),
        b.ReceivedAmount = ISNULL(w.[11-$ Received], 0),
        b.CfC            = ISNULL(w.[11-CfC], 0),
        b.Wrksh          = ISNULL(w.[11-Wrksh], 0),
        b.Sect8          = ISNULL(w.[11-Sect8], 0),
        b.SNAP           = ISNULL(w.[11-SNAP], 0),
        b.Insr           = ISNULL(w.[11-Insr#], 0),
        b.UpdatedOn      = GETDATE(),
        b.UpdatedBy      = 'spApp_DataSynch'
    FROM dbo.tblTILLContractBillings b
        INNER JOIN dbo.tempContractsWorkspace w ON b.ContractGUID = w.ContractGUID
    WHERE b.MonthNumber = 11;

    -- Month 12
    UPDATE b
    SET b.BilledAmount   = ISNULL(w.[12-Billed $], 0),
        b.BillRate       = ISNULL(w.[12- Bill Rate], 0),
        b.NumberOfClient = CAST(ISNULL(w.[12-# Cli], 0) AS SMALLINT),
        b.BilledUnit     = CAST(ISNULL(w.[12-Billed Units], 0) AS SMALLINT),
        b.ReceivedAmount = ISNULL(w.[12-$ Received], 0),
        b.CfC            = ISNULL(w.[12-CfC], 0),
        b.Wrksh          = ISNULL(w.[12-Wrksh], 0),
        b.Sect8          = ISNULL(w.[12-Sect8], 0),
        b.SNAP           = ISNULL(w.[12-SNAP], 0),
        b.Insr           = ISNULL(w.[12-Insr#], 0),
        b.UpdatedOn      = GETDATE(),
        b.UpdatedBy      = 'spApp_DataSynch'
    FROM dbo.tblTILLContractBillings b
        INNER JOIN dbo.tempContractsWorkspace w ON b.ContractGUID = w.ContractGUID
    WHERE b.MonthNumber = 12;

    -- Month 1
    UPDATE b
    SET b.BilledAmount   = ISNULL(w.[1-Billed $], 0),
        b.BillRate       = ISNULL(w.[1- Bill Rate], 0),
        b.NumberOfClient = CAST(ISNULL(w.[1-# Cli], 0) AS SMALLINT),
        b.BilledUnit     = CAST(ISNULL(w.[1-Billed Units], 0) AS SMALLINT),
        b.ReceivedAmount = ISNULL(w.[1-$ Received], 0),
        b.CfC            = ISNULL(w.[1-CfC], 0),
        b.Wrksh          = ISNULL(w.[1-Wrksh], 0),
        b.Sect8          = ISNULL(w.[1-Sect8], 0),
        b.SNAP           = ISNULL(w.[1-SNAP], 0),
        b.Insr           = ISNULL(w.[1-Insr#], 0),
        b.UpdatedOn      = GETDATE(),
        b.UpdatedBy      = 'spApp_DataSynch'
    FROM dbo.tblTILLContractBillings b
        INNER JOIN dbo.tempContractsWorkspace w ON b.ContractGUID = w.ContractGUID
    WHERE b.MonthNumber = 1;

    -- Month 2
    UPDATE b
    SET b.BilledAmount   = ISNULL(w.[2-Billed $], 0),
        b.BillRate       = ISNULL(w.[2- Bill Rate], 0),
        b.NumberOfClient = CAST(ISNULL(w.[2-# Cli], 0) AS SMALLINT),
        b.BilledUnit     = CAST(ISNULL(w.[2-Billed Units], 0) AS SMALLINT),
        b.ReceivedAmount = ISNULL(w.[2-$ Received], 0),
        b.CfC            = ISNULL(w.[2-CfC], 0),
        b.Wrksh          = ISNULL(w.[2-Wrksh], 0),
        b.Sect8          = ISNULL(w.[2-Sect8], 0),
        b.SNAP           = ISNULL(w.[2-SNAP], 0),
        b.Insr           = ISNULL(w.[2-Insr#], 0),
        b.UpdatedOn      = GETDATE(),
        b.UpdatedBy      = 'spApp_DataSynch'
    FROM dbo.tblTILLContractBillings b
        INNER JOIN dbo.tempContractsWorkspace w ON b.ContractGUID = w.ContractGUID
    WHERE b.MonthNumber = 2;

    -- Month 3
    UPDATE b
    SET b.BilledAmount   = ISNULL(w.[3-Billed $], 0),
        b.BillRate       = ISNULL(w.[3- Bill Rate], 0),
        b.NumberOfClient = CAST(ISNULL(w.[3-# Cli], 0) AS SMALLINT),
        b.BilledUnit     = CAST(ISNULL(w.[3-Billed Units], 0) AS SMALLINT),
        b.ReceivedAmount = ISNULL(w.[3-$ Received], 0),
        b.CfC            = ISNULL(w.[3-CfC], 0),
        b.Wrksh          = ISNULL(w.[3-Wrksh], 0),
        b.Sect8          = ISNULL(w.[3-Sect8], 0),
        b.SNAP           = ISNULL(w.[3-SNAP], 0),
        b.Insr           = ISNULL(w.[3-Insr#], 0),
        b.UpdatedOn      = GETDATE(),
        b.UpdatedBy      = 'spApp_DataSynch'
    FROM dbo.tblTILLContractBillings b
        INNER JOIN dbo.tempContractsWorkspace w ON b.ContractGUID = w.ContractGUID
    WHERE b.MonthNumber = 3;

    -- Month 4
    UPDATE b
    SET b.BilledAmount   = ISNULL(w.[4-Billed $], 0),
        b.BillRate       = ISNULL(w.[4- Bill Rate], 0),
        b.NumberOfClient = CAST(ISNULL(w.[4-# Cli], 0) AS SMALLINT),
        b.BilledUnit     = CAST(ISNULL(w.[4-Billed Units], 0) AS SMALLINT),
        b.ReceivedAmount = ISNULL(w.[4-$ Received], 0),
        b.CfC            = ISNULL(w.[4-CfC], 0),
        b.Wrksh          = ISNULL(w.[4-Wrksh], 0),
        b.Sect8          = ISNULL(w.[4-Sect8], 0),
        b.SNAP           = ISNULL(w.[4-SNAP], 0),
        b.Insr           = ISNULL(w.[4-Insr#], 0),
        b.UpdatedOn      = GETDATE(),
        b.UpdatedBy      = 'spApp_DataSynch'
    FROM dbo.tblTILLContractBillings b
        INNER JOIN dbo.tempContractsWorkspace w ON b.ContractGUID = w.ContractGUID
    WHERE b.MonthNumber = 4;

    -- Month 5
    UPDATE b
    SET b.BilledAmount   = ISNULL(w.[5-Billed $], 0),
        b.BillRate       = ISNULL(w.[5- Bill Rate], 0),
        b.NumberOfClient = CAST(ISNULL(w.[5-# Cli], 0) AS SMALLINT),
        b.BilledUnit     = CAST(ISNULL(w.[5-Billed Units], 0) AS SMALLINT),
        b.ReceivedAmount = ISNULL(w.[5-$ Received], 0),
        b.CfC            = ISNULL(w.[5-CfC], 0),
        b.Wrksh          = ISNULL(w.[5-Wrksh], 0),
        b.Sect8          = ISNULL(w.[5-Sect8], 0),
        b.SNAP           = ISNULL(w.[5-SNAP], 0),
        b.Insr           = ISNULL(w.[5-Insr#], 0),
        b.UpdatedOn      = GETDATE(),
        b.UpdatedBy      = 'spApp_DataSynch'
    FROM dbo.tblTILLContractBillings b
        INNER JOIN dbo.tempContractsWorkspace w ON b.ContractGUID = w.ContractGUID
    WHERE b.MonthNumber = 5;

    -- Month 6
    UPDATE b
    SET b.BilledAmount   = ISNULL(w.[6-Billed $], 0),
        b.BillRate       = ISNULL(w.[6- Bill Rate], 0),
        b.NumberOfClient = CAST(ISNULL(w.[6-# Cli], 0) AS SMALLINT),
        b.BilledUnit     = CAST(ISNULL(w.[6-Billed Units], 0) AS SMALLINT),
        b.ReceivedAmount = ISNULL(w.[6-$ Received], 0),
        b.CfC            = ISNULL(w.[6-CfC], 0),
        b.Wrksh          = ISNULL(w.[6-Wrksh], 0),
        b.Sect8          = ISNULL(w.[6-Sect8], 0),
        b.SNAP           = ISNULL(w.[6-SNAP], 0),
        b.Insr           = ISNULL(w.[6-Insr#], 0),
        b.UpdatedOn      = GETDATE(),
        b.UpdatedBy      = 'spApp_DataSynch'
    FROM dbo.tblTILLContractBillings b
        INNER JOIN dbo.tempContractsWorkspace w ON b.ContractGUID = w.ContractGUID
    WHERE b.MonthNumber = 6;

    -- Fix Area Office - ONE SKY
    UPDATE dbo.tblTILLContracts
    SET AreaOffice = 'ONE'
    WHERE AreaOffice = 'ONE SKY';

END;
GO
