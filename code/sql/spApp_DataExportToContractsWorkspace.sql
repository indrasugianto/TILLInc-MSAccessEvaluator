CREATE OR ALTER PROCEDURE [dbo].[spApp_DataExportToContractsWorkspace]
    @FiscalYear SMALLINT
AS
BEGIN
    SET NOCOUNT ON;

    -- Step 1: Clear the workspace table
    DELETE FROM dbo.tempContractsWorkspace;

    -- Step 2: Insert contract header data from tblTILLContracts + tblTILLContractNumbers
    --         filtered by the specified FiscalYear.
    --         This reverses the INSERT into tblTILLContractNumbers and tblTILLContracts.
    INSERT INTO dbo.tempContractsWorkspace
    (
        ContractGUID,
        [Line#],
        FY,
        FUNDER,
        [CONTRACT #],
        ALIAS,
        [GP#],
        [AREA OFFICE],
        [LAST NAME, FIRST NAME ],
        IndexedName,
        [ACTIVITY CODE],
        [EIM-SERVICE TYPE],
        DESCRIPTION,
        LOCATION,
        [OLD MAX OBL, before RATE increase],
        [MAX OBL],
        HOLDBACKS,
        [AMEND#],
        [TOTAL UNITS],
        [Unit Type],
        [Acct#Staff],
        [Directors Name],
        [UFR,NEW],
        [UFR,OLD],
        CCtr,
        [GP Line #]
    )
    SELECT
        c.ContractGUID,
        c.ContractLineNumber,
        cn.FiscalYear,
        cn.Funder,
        cn.ContractNumber,
        c.Alias,
        c.GPNumber,
        c.AreaOffice,
        c.ClientLastNameFirstName,
        p.IndexedName,
        c.ActivityCode,
        c.EIMServiceType,
        c.ContractDescription,
        c.ContractLocation,
        c.OldMaxOBL,
        c.MaxOBL,
        c.HoldBacks,
        c.AmendNumber,
        c.TotalUnits,
        c.UnitType,
        c.AcctStaff,
        c.DirectorName,
        c.UFR_New,
        c.UFR_Old,
        c.CCtr,
        c.GPLineNumber
    FROM dbo.tblTILLContracts c
        INNER JOIN dbo.tblTILLContractNumbers cn
            ON c.ContractNumberGUID = cn.ContractNumberGUID
        LEFT JOIN dbo.tblPeople p
            ON c.PeopleGUID = p.PeopleGUID
    WHERE cn.FiscalYear = @FiscalYear;


    -- Step 3: Pivot monthly billing data back into flat columns.
    --         This reverses the 12 monthly INSERTs into tblTILLContractBillings.

    -- Month 7 (July)
    UPDATE w
    SET [7-Billed $]     = b.BilledAmount,
        [7- Bill Rate]   = b.BillRate,
        [7-# Cli]        = b.NumberOfClient,
        [7-Billed Units] = b.BilledUnit,
        [7-$ Received]   = b.ReceivedAmount,
        [7-CfC]          = b.CfC,
        [7-Wrksh]        = b.Wrksh,
        [7-Sect8]        = b.Sect8,
        [7-SNAP]         = b.SNAP,
        [7-Insr#]        = b.Insr
    FROM dbo.tempContractsWorkspace w
        INNER JOIN dbo.tblTILLContractBillings b
            ON w.ContractGUID = b.ContractGUID
    WHERE b.MonthNumber = 7;

    -- Month 8 (August)
    UPDATE w
    SET [8-Billed $]     = b.BilledAmount,
        [8- Bill Rate]   = b.BillRate,
        [8-# Cli]        = b.NumberOfClient,
        [8-Billed Units] = b.BilledUnit,
        [8-$ Received]   = b.ReceivedAmount,
        [8-CfC]          = b.CfC,
        [8-Wrksh]        = b.Wrksh,
        [8-Sect8]        = b.Sect8,
        [8-SNAP]         = b.SNAP,
        [8-Insr#]        = b.Insr
    FROM dbo.tempContractsWorkspace w
        INNER JOIN dbo.tblTILLContractBillings b
            ON w.ContractGUID = b.ContractGUID
    WHERE b.MonthNumber = 8;

    -- Month 9 (September)
    UPDATE w
    SET [9-Billed $]     = b.BilledAmount,
        [9- Bill Rate]   = b.BillRate,
        [9-# Cli]        = b.NumberOfClient,
        [9-Billed Units] = b.BilledUnit,
        [9-$ Received]   = b.ReceivedAmount,
        [9-CfC]          = b.CfC,
        [9-Wrksh]        = b.Wrksh,
        [9-Sect8]        = b.Sect8,
        [9-SNAP]         = b.SNAP,
        [9-Insr#]        = b.Insr
    FROM dbo.tempContractsWorkspace w
        INNER JOIN dbo.tblTILLContractBillings b
            ON w.ContractGUID = b.ContractGUID
    WHERE b.MonthNumber = 9;

    -- Month 10 (October)
    UPDATE w
    SET [10-Billed $]     = b.BilledAmount,
        [10- Bill Rate]   = b.BillRate,
        [10-# Cli]        = b.NumberOfClient,
        [10-Billed Units] = b.BilledUnit,
        [10-$ Received]   = b.ReceivedAmount,
        [10-CfC]          = b.CfC,
        [10-Wrksh]        = b.Wrksh,
        [10-Sect8]        = b.Sect8,
        [10-SNAP]         = b.SNAP,
        [10-Insr#]        = b.Insr
    FROM dbo.tempContractsWorkspace w
        INNER JOIN dbo.tblTILLContractBillings b
            ON w.ContractGUID = b.ContractGUID
    WHERE b.MonthNumber = 10;

    -- Month 11 (November)
    UPDATE w
    SET [11-Billed $]     = b.BilledAmount,
        [11- Bill Rate]   = b.BillRate,
        [11-# Cli]        = b.NumberOfClient,
        [11-Billed Units] = b.BilledUnit,
        [11-$ Received]   = b.ReceivedAmount,
        [11-CfC]          = b.CfC,
        [11-Wrksh]        = b.Wrksh,
        [11-Sect8]        = b.Sect8,
        [11-SNAP]         = b.SNAP,
        [11-Insr#]        = b.Insr
    FROM dbo.tempContractsWorkspace w
        INNER JOIN dbo.tblTILLContractBillings b
            ON w.ContractGUID = b.ContractGUID
    WHERE b.MonthNumber = 11;

    -- Month 12 (December)
    UPDATE w
    SET [12-Billed $]     = b.BilledAmount,
        [12- Bill Rate]   = b.BillRate,
        [12-# Cli]        = b.NumberOfClient,
        [12-Billed Units] = b.BilledUnit,
        [12-$ Received]   = b.ReceivedAmount,
        [12-CfC]          = b.CfC,
        [12-Wrksh]        = b.Wrksh,
        [12-Sect8]        = b.Sect8,
        [12-SNAP]         = b.SNAP,
        [12-Insr#]        = b.Insr
    FROM dbo.tempContractsWorkspace w
        INNER JOIN dbo.tblTILLContractBillings b
            ON w.ContractGUID = b.ContractGUID
    WHERE b.MonthNumber = 12;

    -- Month 1 (January)
    UPDATE w
    SET [1-Billed $]     = b.BilledAmount,
        [1- Bill Rate]   = b.BillRate,
        [1-# Cli]        = b.NumberOfClient,
        [1-Billed Units] = b.BilledUnit,
        [1-$ Received]   = b.ReceivedAmount,
        [1-CfC]          = b.CfC,
        [1-Wrksh]        = b.Wrksh,
        [1-Sect8]        = b.Sect8,
        [1-SNAP]         = b.SNAP,
        [1-Insr#]        = b.Insr
    FROM dbo.tempContractsWorkspace w
        INNER JOIN dbo.tblTILLContractBillings b
            ON w.ContractGUID = b.ContractGUID
    WHERE b.MonthNumber = 1;

    -- Month 2 (February)
    UPDATE w
    SET [2-Billed $]     = b.BilledAmount,
        [2- Bill Rate]   = b.BillRate,
        [2-# Cli]        = b.NumberOfClient,
        [2-Billed Units] = b.BilledUnit,
        [2-$ Received]   = b.ReceivedAmount,
        [2-CfC]          = b.CfC,
        [2-Wrksh]        = b.Wrksh,
        [2-Sect8]        = b.Sect8,
        [2-SNAP]         = b.SNAP,
        [2-Insr#]        = b.Insr
    FROM dbo.tempContractsWorkspace w
        INNER JOIN dbo.tblTILLContractBillings b
            ON w.ContractGUID = b.ContractGUID
    WHERE b.MonthNumber = 2;

    -- Month 3 (March)
    UPDATE w
    SET [3-Billed $]     = b.BilledAmount,
        [3- Bill Rate]   = b.BillRate,
        [3-# Cli]        = b.NumberOfClient,
        [3-Billed Units] = b.BilledUnit,
        [3-$ Received]   = b.ReceivedAmount,
        [3-CfC]          = b.CfC,
        [3-Wrksh]        = b.Wrksh,
        [3-Sect8]        = b.Sect8,
        [3-SNAP]         = b.SNAP,
        [3-Insr#]        = b.Insr
    FROM dbo.tempContractsWorkspace w
        INNER JOIN dbo.tblTILLContractBillings b
            ON w.ContractGUID = b.ContractGUID
    WHERE b.MonthNumber = 3;

    -- Month 4 (April)
    UPDATE w
    SET [4-Billed $]     = b.BilledAmount,
        [4- Bill Rate]   = b.BillRate,
        [4-# Cli]        = b.NumberOfClient,
        [4-Billed Units] = b.BilledUnit,
        [4-$ Received]   = b.ReceivedAmount,
        [4-CfC]          = b.CfC,
        [4-Wrksh]        = b.Wrksh,
        [4-Sect8]        = b.Sect8,
        [4-SNAP]         = b.SNAP,
        [4-Insr#]        = b.Insr
    FROM dbo.tempContractsWorkspace w
        INNER JOIN dbo.tblTILLContractBillings b
            ON w.ContractGUID = b.ContractGUID
    WHERE b.MonthNumber = 4;

    -- Month 5 (May)
    UPDATE w
    SET [5-Billed $]     = b.BilledAmount,
        [5- Bill Rate]   = b.BillRate,
        [5-# Cli]        = b.NumberOfClient,
        [5-Billed Units] = b.BilledUnit,
        [5-$ Received]   = b.ReceivedAmount,
        [5-CfC]          = b.CfC,
        [5-Wrksh]        = b.Wrksh,
        [5-Sect8]        = b.Sect8,
        [5-SNAP]         = b.SNAP,
        [5-Insr#]        = b.Insr
    FROM dbo.tempContractsWorkspace w
        INNER JOIN dbo.tblTILLContractBillings b
            ON w.ContractGUID = b.ContractGUID
    WHERE b.MonthNumber = 5;

    -- Month 6 (June)
    UPDATE w
    SET [6-Billed $]     = b.BilledAmount,
        [6- Bill Rate]   = b.BillRate,
        [6-# Cli]        = b.NumberOfClient,
        [6-Billed Units] = b.BilledUnit,
        [6-$ Received]   = b.ReceivedAmount,
        [6-CfC]          = b.CfC,
        [6-Wrksh]        = b.Wrksh,
        [6-Sect8]        = b.Sect8,
        [6-SNAP]         = b.SNAP,
        [6-Insr#]        = b.Insr
    FROM dbo.tempContractsWorkspace w
        INNER JOIN dbo.tblTILLContractBillings b
            ON w.ContractGUID = b.ContractGUID
    WHERE b.MonthNumber = 6;

END;
GO
