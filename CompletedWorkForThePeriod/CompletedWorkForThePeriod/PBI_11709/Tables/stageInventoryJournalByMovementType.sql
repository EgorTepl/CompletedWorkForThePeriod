CREATE TABLE [pbi_11709].[stageInventoryJournalByMovementType] (
    [RecId]                   BIGINT         NOT NULL,
    [Description]             NVARCHAR (60)  NULL,
    [JournalId]               NVARCHAR (10)  NOT NULL,
    [Posted]                  INT            NOT NULL,
    [TransDate]               DATETIME       NOT NULL,
    [JournalNameId]           NVARCHAR (10)  NOT NULL,
    [ManufactoryName]         NVARCHAR (100) NULL,
    [HrmOrganizationId] NVARCHAR (25)    NOT NULL,
    [PostedHrmOrganizationId] NVARCHAR (25)  NOT NULL,
    [ParentOrganizationId_PostedHrmOrgId]    NVARCHAR (25)  NULL,
    [ParentOrganizationId_HrmOrgId]    NVARCHAR (25)  NULL,
    [ResponsibleWorkerName]   NVARCHAR (40)  NULL,
    CONSTRAINT [pk_stageInventoryJournalByMovementType_RecId] PRIMARY KEY CLUSTERED ([RecId] ASC)
);

