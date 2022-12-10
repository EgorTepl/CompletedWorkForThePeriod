CREATE TABLE [pbi_11709].[stageJobTicketByRepairControlType] (
    [RecId]                            BIGINT           NOT NULL,
    [JobTicketType]                    INT              NOT NULL,
    [JobTicketNumber]                  NVARCHAR (30)    NOT NULL,
    [Status]                           INT              NOT NULL,
    [RepairConfirmDate]                DATETIME         NOT NULL,
    [RepairObject]                     NVARCHAR (46)    NOT NULL,
    [Description]                      NVARCHAR (256)   NULL,
    [NameAlias]                        NVARCHAR (100)   NULL,
    [FactoryId]                        NVARCHAR (23)    NULL,
    [InventSerialId]                   NVARCHAR (50)    NOT NULL,
    [InventBatchId]                    NVARCHAR (50)    NOT NULL,
    [ManufactoryName_RepairItem]       NVARCHAR (100)   NULL,
    [ManufactoryName_RepairLocomotive] NVARCHAR (100)   NULL,
    [RPayHrmOrganizationId]            NVARCHAR (25)    NOT NULL,
    [ParentOrganizationId]             NVARCHAR (25)    NULL,
    [ResponsibleWorker_RepairConfirm]  NVARCHAR (160)   NULL,
    [Qty]                              NUMERIC (32, 16) NOT NULL,
    [UnitId]                           NVARCHAR (10)    NOT NULL,
    [RepairedCount]                    INT              NOT NULL,
    [WorkCenterId]                     NVARCHAR (25)    NOT NULL,
    CONSTRAINT [pk_stageJobTicketByRepairControlType_RecId] PRIMARY KEY CLUSTERED ([RecId] ASC)
);

