-- =============================================
-- Author: TeploukhovES
-- Create date: 13.07.2022
-- Description: Подготовка данных для синхронизации отчета
-- =============================================
CREATE VIEW [pbi_11709].[vCompletedWorkForThePeriod]
	AS

	SELECT
		jt.OperationTypeName,
		jt.DocumentName,
		jt.StatusName,
		jt.DateId,
		jt.RepairObjectName,
		jt.DescriptionName,
		jt.RepairObjectNumberName,
		jt.ServiceKindName,
		jt.ManufactoryName,
		jt.DepotCodeName,
		jt.ParentDepotCodeName,
		jt.ResponsibleWorkerName,
		jt.Qty,
		jt.UnitName,
		jt.RepairedCount,
		jt.DateForReportName
	FROM [pbi_11709].fctJobTicket AS jt

	UNION ALL

	SELECT
		ij.OperationTypeName,
		ij.DocumentName,
		ij.StatusName,
		ij.DateId,
		ij.RepairObjectName,
		ij.DescriptionName,
		ij.RepairObjectNumberName,
		ij.ServiceKindName,
		ij.ManufactoryName,
		ij.DepotCodeName,
		ij.ParentDepotCodeName,
		ij.ResponsibleWorkerName,
		ij.Qty,
		ij.UnitName,
		ij.RepairedCount,
		ij.DateForReportName
	FROM [pbi_11709].fctInventoryJournal AS ij

	UNION ALL

	SELECT
		rii.OperationTypeName,
		rii.DocumentName,
		rii.StatusName,
		rii.DateId,
		rii.RepairObjectName,
		rii.DescriptionName,
		rii.RepairObjectNumberName,
		rii.ServiceKindName,
		rii.ManufactoryName,
		rii.DepotCodeName,
		rii.ParentDepotCodeName,
		rii.ResponsibleWorkerName,
		rii.Qty,
		rii.UnitName,
		rii.RepairedCount,
		rii.DateForReportName
	FROM [pbi_11709].[fctPrintout] AS rii