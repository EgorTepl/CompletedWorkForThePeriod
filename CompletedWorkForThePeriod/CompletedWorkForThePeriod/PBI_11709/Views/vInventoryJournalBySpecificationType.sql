-- =============================================
-- Author: TeploukhovES
-- Create date: 12.07.2022
-- Description: Обработка данных по журналам запасов по типу "Спецификация"
-- =============================================

CREATE VIEW [pbi_11709].[vInventoryJournalBySpecificationType]
	AS

	SELECT
		COALESCE(ij.Description, N'') AS OperationTypeName,
		ij.JournalId AS DocumentName,
		CASE ij.Posted
			WHEN 0 THEN N'Создан'
			WHEN 1 THEN N'Разнесено'
			ELSE N''
			END AS StatusName,
		ij.TransDate AS DateId,
		COALESCE(ij.ItemId, N'') AS RepairObjectName,
		COALESCE(ij.NameAlias, N'') AS DescriptionName,
		COALESCE
		(
			IIF(ij.InventBatchId != N'', ij.InventBatchId, ij.InventSerialId), N''
		) AS RepairObjectNumberName,
		ij.JournalNameId AS ServiceKindName,
		COALESCE(ij.ManufactoryName, N'') AS ManufactoryName,
		ij.HrmOrganizationId AS DepotCodeName,
		COALESCE(ij.ParentOrganizationId, N'') AS ParentDepotCodeName,
		COALESCE(ij.ResponsibleWorkerName, N'') AS ResponsibleWorkerName,
		ABS(ij.Qty) AS Qty,
		COALESCE(ij.UnitId, N'') AS UnitName,
		CASE ij.Posted
			WHEN 1 THEN ABS(ij.Qty)
			ELSE NULL
			END AS RepairedCount,
		CONVERT(nvarchar, ij.TransDate, 104) AS DateForReportName
	FROM [pbi_11709].stageInventoryJournalBySpecificationType AS ij