-- =============================================
-- Author: TeploukhovES
-- Create date: 14.07.2022
-- Description: Синхронизация отчета
-- =============================================
CREATE PROCEDURE [pbi_11709].[fctCompletedWorkForThePeriod_sync]

AS

BEGIN
	SET NOCOUNT ON;
	SET XACT_ABORT ON;
	
	BEGIN TRANSACTION
	
		ALTER TABLE [pbi_11709].fctCompletedWorkForThePeriod DROP CONSTRAINT [pk_fctCompletedWorkForThePeriod_RecId];

		TRUNCATE TABLE [pbi_11709].fctCompletedWorkForThePeriod;

		INSERT INTO [pbi_11709].fctCompletedWorkForThePeriod
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
			cwp.OperationTypeName,
			cwp.DocumentName,
			cwp.StatusName,
			cwp.DateId,
			cwp.RepairObjectName,
			cwp.DescriptionName,
			cwp.RepairObjectNumberName,
			cwp.ServiceKindName,
			cwp.ManufactoryName,
			cwp.DepotCodeName,
			cwp.ParentDepotCodeName,
			cwp.ResponsibleWorkerName,
			cwp.Qty,
			cwp.UnitName,
			cwp.RepairedCount,
			cwp.DateForReportName
		FROM [pbi_11709].[vCompletedWorkForThePeriod] AS cwp;

		ALTER TABLE [pbi_11709].fctCompletedWorkForThePeriod ADD CONSTRAINT [pk_fctCompletedWorkForThePeriod_RecId] PRIMARY KEY ([RecId]);

	COMMIT TRANSACTION
END