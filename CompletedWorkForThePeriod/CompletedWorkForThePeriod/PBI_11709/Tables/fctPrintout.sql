CREATE TABLE [pbi_11709].[fctPrintout] (
    [RecId]                  INT            IDENTITY (1, 1) NOT NULL,
    [OperationTypeName]      NVARCHAR (29)  NOT NULL,
    [DocumentName]           NVARCHAR (20)  NOT NULL,
    [StatusName]             NVARCHAR (8)   NOT NULL,
    [DateId]                 DATE           NOT NULL,
    [RepairObjectName]       NVARCHAR (1)  NOT NULL,
    [DescriptionName]        NVARCHAR (1)  NOT NULL,
    [RepairObjectNumberName] NVARCHAR (1)  NOT NULL,
    [ServiceKindName]        NVARCHAR (53)  NOT NULL,
    [ManufactoryName]        NVARCHAR (1)  NOT NULL,
    [DepotCodeName]          NVARCHAR (25)  NOT NULL,
    [ParentDepotCodeName]    NVARCHAR (25)  NOT NULL,
    [ResponsibleWorkerName]  NVARCHAR (40)  NOT NULL,
    [Qty]                    NUMERIC (9, 3) NULL,
    [UnitName]               NVARCHAR (1)  NOT NULL,
    [RepairedCount]          INT            NULL,
    [DateForReportName]      NVARCHAR (10)  NOT NULL,
    CONSTRAINT [pk_fctPrintout_RecId] PRIMARY KEY CLUSTERED ([RecId] ASC)
);

