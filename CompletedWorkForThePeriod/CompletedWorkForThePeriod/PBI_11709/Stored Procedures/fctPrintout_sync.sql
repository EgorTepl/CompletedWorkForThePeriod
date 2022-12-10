-- =============================================
-- Author: TeploukhovES
-- Create date: 07.07.2022
-- Description: Синхронизация данных по документам о поступлении ТМЦ от поставщиков
-- =============================================
CREATE PROCEDURE [pbi_11709].[fctPrintout_sync]

AS

BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
	
	BEGIN TRANSACTION
	
		ALTER TABLE [pbi_11709].[fctPrintout] DROP CONSTRAINT [pk_fctPrintout_RecId];

		TRUNCATE TABLE [pbi_11709].[fctPrintout];

		INSERT INTO [pbi_11709].[fctPrintout]
		(
			OperationTypeName,
			DocumentName,
			StatusName,
			DateId,
			RepairObjectName,
			DescriptionName,
			RepairObjectNumberName,
			ServiceKindName,
			ManufactoryName,
			DepotCodeName,
			ParentDepotCodeName,
			ResponsibleWorkerName,
			Qty,
			UnitName,
			RepairedCount,
			DateForReportName
		)
		SELECT 
			recii.OperationTypeName,
			recii.DocumentName,
			recii.StatusName,
			recii.DateId,
			recii.RepairObjectName,
			recii.DescriptionName,
			recii.RepairObjectNumberName,
			recii.ServiceKindName,
			recii.ManufactoryName,
			recii.DepotCodeName,
			recii.ParentDepotCodeName,
			recii.ResponsibleWorkerName,
			recii.Qty,
			recii.UnitName,
			recii.RepairedCount,
			recii.DateForReportName
		FROM [pbi_11709].[vPrintout] AS recii

		ALTER TABLE [pbi_11709].[fctPrintout] ADD CONSTRAINT [pk_fctPrintout_RecId] PRIMARY KEY (RecId);

	COMMIT TRANSACTION
END