CREATE TABLE [pbi_11709].[fctJobTicket] (
    [RecId]                  INT            IDENTITY (1, 1) NOT NULL,
    [OperationTypeName]      NVARCHAR (16)  NOT NULL,
    [DocumentName]           NVARCHAR (30)  NOT NULL,
    [StatusName]             NVARCHAR (8)  NOT NULL,
    [DateId]                 DATE           NOT NULL,
    [RepairObjectName]       NVARCHAR (46)  NOT NULL,
    [DescriptionName]        NVARCHAR (256) NOT NULL,
    [RepairObjectNumberName] NVARCHAR (50)  NOT NULL,
    [ServiceKindName]        NVARCHAR (35)  NOT NULL,
    [ManufactoryName]        NVARCHAR (100) NOT NULL,
    [DepotCodeName]          NVARCHAR (25)  NOT NULL,
    [ParentDepotCodeName]    NVARCHAR (25)  NOT NULL,
    [ResponsibleWorkerName]  NVARCHAR (160) NOT NULL,
    [Qty]                    NUMERIC (9, 3) NOT NULL,
    [UnitName]               NVARCHAR (10)  NOT NULL,
    [RepairedCount]          INT            NOT NULL,
    [DateForReportName]      NVARCHAR (10)  NOT NULL,
    CONSTRAINT [pk_fctJobTicket_RecId] PRIMARY KEY CLUSTERED ([RecId] ASC)
);

