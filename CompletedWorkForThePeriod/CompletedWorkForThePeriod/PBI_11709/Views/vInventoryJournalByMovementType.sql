-- =============================================
-- Author: TeploukhovES
-- Create date: 12.07.2022
-- Description: Обработка данных по журналам запасов по типу "Проводка"
-- =============================================

CREATE VIEW [pbi_11709].[vInventoryJournalByMovementType]
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
		N'' AS RepairObjectName,
		N'' AS DescriptionName,
		N'' AS RepairObjectNumberName,
		ij.JournalNameId AS ServiceKindName,
		COALESCE(ij.ManufactoryName, N'') AS ManufactoryName,
		ij.HrmOrganizationId AS DepotCodeName,
		COALESCE(ij.ParentOrganizationId_HrmOrgId, N'') AS ParentDepotCodeName,
		COALESCE(ij.ResponsibleWorkerName, N'') AS ResponsibleWorkerName,
		NULL AS Qty,
		N'' AS UnitName,
		NULL AS RepairedCount,
		CONVERT(nvarchar, ij.TransDate, 104) AS DateForReportName
	FROM [pbi_11709].stageInventoryJournalByMovementType AS ij
	WHERE ij.HrmOrganizationId != N''

	UNION ALL

		SELECT
		COALESCE(ij.Description, N'') AS OperationTypeName,
		ij.JournalId AS DocumentName,
		CASE ij.Posted
			WHEN 0 THEN N'Создан'
			WHEN 1 THEN N'Разнесено'
			ELSE N''
			END AS StatusName,
		ij.TransDate AS DateId,
		N'' AS RepairObjectName,
		N'' AS DescriptionName,
		N'' AS RepairObjectNumberName,
		ij.JournalNameId AS ServiceKindName,
		COALESCE(ij.ManufactoryName, N'') AS ManufactoryName,
		ij.PostedHrmOrganizationId AS DepotCodeName,
		COALESCE(ij.ParentOrganizationId_PostedHrmOrgId, N'') AS ParentDepotCodeName,
		COALESCE(ij.ResponsibleWorkerName, N'') AS ResponsibleWorkerName,
		NULL AS Qty,
		N'' AS UnitName,
		NULL AS RepairedCount,
		CONVERT(nvarchar, ij.TransDate, 104) AS DateForReportName
	FROM [pbi_11709].stageInventoryJournalByMovementType AS ij
	WHERE
		(ij.HrmOrganizationId != ij.PostedHrmOrganizationId)
		AND ij.PostedHrmOrganizationId != N''