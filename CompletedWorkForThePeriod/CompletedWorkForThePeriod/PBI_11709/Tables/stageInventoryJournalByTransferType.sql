CREATE TABLE [pbi_11709].[stageInventoryJournalByTransferType] (
    [RecId]                             BIGINT         NOT NULL,
    [JournalId]                         NVARCHAR (10)  NOT NULL,
    [Posted]                            INT            NOT NULL,
    [TransDate]                         DATETIME       NOT NULL,
    [JournalNameId]                     NVARCHAR (10)  NOT NULL,
    [ManufactoryName_From]              NVARCHAR (100) NULL,
    [ManufactoryName_To]                NVARCHAR (100) NULL,
    [HrmOrganizationId_From]            NVARCHAR (25)  NULL,
    [HrmOrganizationId_To]              NVARCHAR (25)  NULL,
    [ParentOrganizationId_From]         NVARCHAR (25)  NULL,
    [ParentOrganizationId_To]           NVARCHAR (25)  NULL,
    [ResponsibleWorkerName_From]        NVARCHAR (40)  NULL,
    [ResponsibleWorkerName_To]          NVARCHAR (160) NULL,
    [HcmWorker]                         BIGINT         NULL,
    [ResponsibleWorkerName_To_UserInfo] NVARCHAR (40)  NULL,
    CONSTRAINT [pk_stageInventoryJournalByTransferType_RecId] PRIMARY KEY CLUSTERED ([RecId] ASC)
);

