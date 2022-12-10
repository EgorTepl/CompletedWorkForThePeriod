-- =============================================
-- Author: TeploukhovES
-- Create date: 13.07.2022
-- Description: Синхронизация данных по журналам запасов
-- =============================================
CREATE PROCEDURE [pbi_11709].[fctInventoryJournal_sync]

AS

BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
	
	BEGIN TRANSACTION

		ALTER TABLE [pbi_11709].fctInventoryJournal DROP CONSTRAINT [pk_fctInventoryJournal_RecId];
		
		TRUNCATE TABLE [pbi_11709].fctInventoryJournal;

		INSERT INTO [pbi_11709].fctInventoryJournal
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
			ijs.OperationTypeName,
			ijs.DocumentName,
			ijs.StatusName,
			ijs.DateId,
			ijs.RepairObjectName,
			ijs.DescriptionName,
			ijs.RepairObjectNumberName,
			ijs.ServiceKindName,
			ijs.ManufactoryName,
			ijs.DepotCodeName,
			ijs.ParentDepotCodeName,
			ijs.ResponsibleWorkerName,
			ijs.Qty,
			ijs.UnitName,
			ijs.RepairedCount,
			ijs.DateForReportName
		FROM [pbi_11709].[vInventoryJournalBySpecificationType] AS ijs

		UNION ALL

			SELECT 
			ijm.OperationTypeName,
			ijm.DocumentName,
			ijm.StatusName,
			ijm.DateId,
			ijm.RepairObjectName,
			ijm.DescriptionName,
			ijm.RepairObjectNumberName,
			ijm.ServiceKindName,
			ijm.ManufactoryName,
			ijm.DepotCodeName,
			ijm.ParentDepotCodeName,
			ijm.ResponsibleWorkerName,
			ijm.Qty,
			ijm.UnitName,
			ijm.RepairedCount,
			ijm.DateForReportName
		FROM [pbi_11709].[vInventoryJournalByMovementType] AS ijm

		UNION ALL

		SELECT 
			ijt.OperationTypeName,
			ijt.DocumentName,
			ijt.StatusName,
			ijt.DateId,
			ijt.RepairObjectName,
			ijt.DescriptionName,
			ijt.RepairObjectNumberName,
			ijt.ServiceKindName,
			ijt.ManufactoryName,
			ijt.DepotCodeName,
			ijt.ParentDepotCodeName,
			ijt.ResponsibleWorkerName,
			ijt.Qty,
			ijt.UnitName,
			ijt.RepairedCount,
			ijt.DateForReportName
		FROM [pbi_11709].[vInventoryJournalByTransferType] AS ijt;

		ALTER TABLE [pbi_11709].fctInventoryJournal ADD CONSTRAINT [pk_fctInventoryJournal_RecId] PRIMARY KEY (RecId);
	
	COMMIT TRANSACTION
END