CREATE TABLE [pbi_11709].[stagePrintout] (
    [RecId]                 BIGINT        NOT NULL,
    [DocumentId]            NVARCHAR (20) NOT NULL,
    [DocumentDate]          DATETIME      NOT NULL,
    [JournalType]           INT           NOT NULL,
    [HrmOrganizationId]     NVARCHAR (25) NULL,
    [ParentOrganizationId]  NVARCHAR (25) NULL,
    [ResponsibleWorkerName] NVARCHAR (40) NULL,
    CONSTRAINT [pk_stagePrintout_RecId] PRIMARY KEY CLUSTERED ([RecId] ASC)
);

