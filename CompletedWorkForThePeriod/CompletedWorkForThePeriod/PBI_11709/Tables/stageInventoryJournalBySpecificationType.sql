CREATE TABLE [pbi_11709].[stageInventoryJournalBySpecificationType] (
    [RecId]                   BIGINT           NOT NULL,
    [Description]             NVARCHAR (60)    NULL,
    [JournalId]               NVARCHAR (10)    NOT NULL,
    [Posted]                  INT              NOT NULL,
    [TransDate]               DATETIME         NOT NULL,
    [ItemId]                  NVARCHAR (20)    NULL,
    [NameAlias]               NVARCHAR (100)   NULL,
    [InventSerialId]          NVARCHAR (50)    NULL,
    [InventBatchId]           NVARCHAR (50)    NULL,
    [JournalNameId]           NVARCHAR (10)    NOT NULL,
    [ManufactoryName]         NVARCHAR (100)   NULL,
    [HrmOrganizationId] NVARCHAR (25)    NOT NULL,
    [ParentOrganizationId]    NVARCHAR (25)    NULL,
    [ResponsibleWorkerName]   NVARCHAR (40)    NULL,
    [Qty]                     NUMERIC (32, 16) NULL,
    [UnitId]                  NVARCHAR (10)    NULL,
    CONSTRAINT [pk_stageInventoryJournalBySpecificationType_RecId] PRIMARY KEY CLUSTERED ([RecId] ASC)
);

