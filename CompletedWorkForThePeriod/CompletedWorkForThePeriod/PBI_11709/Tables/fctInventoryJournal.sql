CREATE TABLE [pbi_11709].[fctInventoryJournal] (
    [RecId]                  INT            IDENTITY (1, 1) NOT NULL,
    [OperationTypeName]      NVARCHAR (60)  NOT NULL,
    [DocumentName]           NVARCHAR (10)  NOT NULL,
    [StatusName]             NVARCHAR (9)  NOT NULL,
    [DateId]                 DATE           NOT NULL,
    [RepairObjectName]       NVARCHAR (20)  NOT NULL,
    [DescriptionName]        NVARCHAR (100) NOT NULL,
    [RepairObjectNumberName] NVARCHAR (50)  NOT NULL,
    [ServiceKindName]        NVARCHAR (10)  NOT NULL,
    [ManufactoryName]        NVARCHAR (100) NOT NULL,
    [DepotCodeName]          NVARCHAR (25)  NOT NULL,
    [ParentDepotCodeName]    NVARCHAR (25)  NOT NULL,
    [ResponsibleWorkerName]  NVARCHAR (160) NOT NULL,
    [Qty]                    NUMERIC (9, 3) NULL,
    [UnitName]               NVARCHAR (10)  NOT NULL,
    [RepairedCount]          INT            NULL,
    [DateForReportName]      NVARCHAR (10)  NOT NULL,
    CONSTRAINT [pk_fctInventoryJournal_RecId] PRIMARY KEY CLUSTERED ([RecId] ASC)
);

