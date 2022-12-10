-- =============================================
-- Author: TeploukhovES
-- Create date: 12.07.2022
-- Description: Синхронизация данных по заказ-нарядам
-- =============================================
CREATE PROCEDURE [pbi_11709].[fctJobTicket_sync]

AS

BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
	
	BEGIN TRANSACTION
	
		ALTER TABLE [pbi_11709].fctJobTicket DROP CONSTRAINT [pk_fctJobTicket_RecId];

		TRUNCATE TABLE [pbi_11709].fctJobTicket;

		INSERT INTO [pbi_11709].fctJobTicket
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
			jtt.OperationTypeName,
			jtt.DocumentName,
			jtt.StatusName,
			jtt.DateId,
			jtt.RepairObjectName,
			jtt.DescriptionName,
			jtt.RepairObjectNumberName,
			jtt.ServiceKindName,
			jtt.ManufactoryName,
			jtt.DepotCodeName,
			jtt.ParentDepotCodeName,
			jtt.ResponsibleWorkerName,
			jtt.Qty,
			jtt.UnitName,
			jtt.RepairedCount,
			jtt.DateForReportName
		FROM [pbi_11709].[vJobTicket] AS jtt

		UNION ALL

		SELECT 
			jtt1.OperationTypeName,
			jtt1.DocumentName,
			jtt1.StatusName,
			jtt1.DateId,
			jtt1.RepairObjectName,
			jtt1.DescriptionName,
			jtt1.RepairObjectNumberName,
			jtt1.ServiceKindName,
			jtt1.ManufactoryName,
			jtt1.DepotCodeName,
			jtt1.ParentDepotCodeName,
			jtt1.ResponsibleWorkerName,
			jtt1.Qty,
			jtt1.UnitName,
			jtt1.RepairedCount,
			jtt1.DateForReportName
		FROM [pbi_11709].[vJobTicketByTestType] AS jtt1

		UNION ALL

		SELECT 
			jtt2.OperationTypeName,
			jtt2.DocumentName,
			jtt2.StatusName,
			jtt2.DateId,
			jtt2.RepairObjectName,
			jtt2.DescriptionName,
			jtt2.RepairObjectNumberName,
			jtt2.ServiceKindName,
			jtt2.ManufactoryName,
			jtt2.DepotCodeName,
			jtt2.ParentDepotCodeName,
			jtt2.ResponsibleWorkerName,
			jtt2.Qty,
			jtt2.UnitName,
			jtt2.RepairedCount,
			jtt2.DateForReportName
		FROM [pbi_11709].[vJobTicketByRepairControlType] AS jtt2;

		ALTER TABLE [pbi_11709].fctJobTicket ADD CONSTRAINT [pk_fctJobTicket_RecId] PRIMARY KEY (RecId);

	COMMIT TRANSACTION
END