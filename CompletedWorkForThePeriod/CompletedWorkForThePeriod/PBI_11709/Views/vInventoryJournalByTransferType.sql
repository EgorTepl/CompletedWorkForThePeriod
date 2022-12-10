-- =============================================
-- Author: TeploukhovES
-- Create date: 12.07.2022
-- Description: Обработка данных по журналам запасов по типу "Перенос"
-- =============================================

CREATE VIEW [pbi_11709].[vInventoryJournalByTransferType]
	AS

	SELECT
		N'Отгрузка' AS OperationTypeName,
		ij1.JournalId AS DocumentName,
		CASE ij1.Posted
			WHEN 0 THEN N'Создан'
			WHEN 1 THEN N'Разнесено'
			ELSE N''
			END AS StatusName,
		ij1.TransDate AS DateId,
		N'' AS RepairObjectName,
		N'' AS DescriptionName,
		N'' AS RepairObjectNumberName,
		ij1.JournalNameId AS ServiceKindName,
		COALESCE(ij1.ManufactoryName_From, N'') AS ManufactoryName,
		COALESCE(ij1.HrmOrganizationId_From, N'') AS DepotCodeName,
		COALESCE(ij1.ParentOrganizationId_From, N'') AS ParentDepotCodeName,
		COALESCE(ij1.ResponsibleWorkerName_From, N'') AS ResponsibleWorkerName,
		NULL AS Qty,
		N'' AS UnitName,
		NULL AS RepairedCount,
		CONVERT(nvarchar, ij1.TransDate, 104) AS DateForReportName
	FROM [pbi_11709].stageInventoryJournalByTransferType AS ij1
	WHERE ij1.HrmOrganizationId_From != ij1.HrmOrganizationId_To

	UNION ALL

	SELECT
		N'Получение' AS OperationTypeName,
		ij2.JournalId AS DocumentName,
		CASE ij2.Posted
			WHEN 0 THEN N'Создан'
			WHEN 1 THEN N'Разнесено'
			ELSE N''
			END AS StatusName,
		ij2.TransDate AS DateId,
		N'' AS RepairObjectName,
		N'' AS DescriptionName,
		N'' AS RepairObjectNumberName,
		ij2.JournalNameId AS ServiceKindName,
		COALESCE(ij2.ManufactoryName_To, N'') AS ManufactoryName,
		COALESCE(ij2.HrmOrganizationId_To, N'') AS DepotCodeName,
		COALESCE(ij2.ParentOrganizationId_To, N'') AS ParentDepotCodeName,
		COALESCE
		(
			CASE ij2.HcmWorker
				WHEN 0 THEN ij2.ResponsibleWorkerName_To_UserInfo
				WHEN NULL THEN ij2.ResponsibleWorkerName_To_UserInfo
				ELSE ij2.ResponsibleWorkerName_To
				END, N''
		) AS ResponsibleWorkerName,		
		NULL AS Qty,
		N'' AS UnitName,
		NULL AS RepairedCount,
		CONVERT(nvarchar, ij2.TransDate, 104) AS DateForReportName
	FROM [pbi_11709].stageInventoryJournalByTransferType AS ij2
	WHERE ij2.HrmOrganizationId_From != ij2.HrmOrganizationId_To

	UNION ALL

	SELECT
		N'Отгрузка' AS OperationTypeName,
		ij3.JournalId AS DocumentName,
		CASE ij3.Posted
			WHEN 0 THEN N'Создан'
			WHEN 1 THEN N'Разнесено'
			ELSE N''
			END AS StatusName,
		ij3.TransDate AS DateId,
		N'' AS RepairObjectName,
		N'' AS DescriptionName,
		N'' AS RepairObjectNumberName,
		ij3.JournalNameId AS ServiceKindName,
		COALESCE(ij3.ManufactoryName_From, N'') AS ManufactoryName,
		COALESCE(ij3.HrmOrganizationId_From, N'') AS DepotCodeName,
		COALESCE(ij3.ParentOrganizationId_From, N'') AS ParentDepotCodeName,
		COALESCE(ij3.ResponsibleWorkerName_From, N'') AS ResponsibleWorkerName,
		NULL AS Qty,
		N'' AS UnitName,
		NULL AS RepairedCount,
		CONVERT(nvarchar, ij3.TransDate, 104) AS DateForReportName
	FROM [pbi_11709].stageInventoryJournalByTransferType AS ij3
	WHERE ij3.HrmOrganizationId_From = ij3.HrmOrganizationId_To

	UNION ALL

	SELECT
		N'Отгрузка' AS OperationTypeName,
		ij4.JournalId AS DocumentName,
		CASE ij4.Posted
			WHEN 0 THEN N'Создан'
			WHEN 1 THEN N'Разнесено'
			ELSE N''
			END AS StatusName,
		ij4.TransDate AS DateId,
		N'' AS RepairObjectName,
		N'' AS DescriptionName,
		N'' AS RepairObjectNumberName,
		ij4.JournalNameId AS ServiceKindName,
		COALESCE(ij4.ManufactoryName_From, N'') AS ManufactoryName,
		COALESCE(ij4.HrmOrganizationId_From, N'') AS DepotCodeName,
		COALESCE(ij4.ParentOrganizationId_From, N'') AS ParentDepotCodeName,
		COALESCE(ij4.ResponsibleWorkerName_From, N'') AS ResponsibleWorkerName,
		NULL AS Qty,
		N'' AS UnitName,
		NULL AS RepairedCount,
		CONVERT(nvarchar, ij4.TransDate, 104) AS DateForReportName
	FROM [pbi_11709].stageInventoryJournalByTransferType AS ij4
	WHERE ((ij4.HrmOrganizationId_From IS NOT NULL) AND ( ij4.HrmOrganizationId_To IS NULL))

	UNION ALL

	SELECT
		N'Получение' AS OperationTypeName,
		ij5.JournalId AS DocumentName,
		CASE ij5.Posted
			WHEN 0 THEN N'Создан'
			WHEN 1 THEN N'Разнесено'
			ELSE N''
			END AS StatusName,
		ij5.TransDate AS DateId,
		N'' AS RepairObjectName,
		N'' AS DescriptionName,
		N'' AS RepairObjectNumberName,
		ij5.JournalNameId AS ServiceKindName,
		COALESCE(ij5.ManufactoryName_To, N'') AS ManufactoryName,
		COALESCE(ij5.HrmOrganizationId_To, N'') AS DepotCodeName,
		COALESCE(ij5.ParentOrganizationId_To, N'') AS ParentDepotCodeName,
		COALESCE
		(
			CASE ij5.HcmWorker
				WHEN 0 THEN ij5.ResponsibleWorkerName_To_UserInfo
				WHEN NULL THEN ij5.ResponsibleWorkerName_To_UserInfo
				ELSE ij5.ResponsibleWorkerName_To
				END, N''
		) AS ResponsibleWorkerName,		
		NULL AS Qty,
		N'' AS UnitName,
		NULL AS RepairedCount,
		CONVERT(nvarchar, ij5.TransDate, 104) AS DateForReportName
	FROM [pbi_11709].stageInventoryJournalByTransferType AS ij5
	WHERE ((ij5.HrmOrganizationId_From IS NULL) AND ( ij5.HrmOrganizationId_To IS NOT NULL))

	UNION ALL

	SELECT
		N'Получение' AS OperationTypeName,
		ij6.JournalId AS DocumentName,
		CASE ij6.Posted
			WHEN 0 THEN N'Создан'
			WHEN 1 THEN N'Разнесено'
			ELSE N''
			END AS StatusName,
		ij6.TransDate AS DateId,
		N'' AS RepairObjectName,
		N'' AS DescriptionName,
		N'' AS RepairObjectNumberName,
		ij6.JournalNameId AS ServiceKindName,
		COALESCE(ij6.ManufactoryName_To, N'') AS ManufactoryName,
		COALESCE(ij6.HrmOrganizationId_To, N'') AS DepotCodeName,
		COALESCE(ij6.ParentOrganizationId_To, N'') AS ParentDepotCodeName,
		COALESCE
		(
			CASE ij6.HcmWorker
				WHEN 0 THEN ij6.ResponsibleWorkerName_To_UserInfo
				WHEN NULL THEN ij6.ResponsibleWorkerName_To_UserInfo
				ELSE ij6.ResponsibleWorkerName_To
				END, N''
		) AS ResponsibleWorkerName,		
		NULL AS Qty,
		N'' AS UnitName,
		NULL AS RepairedCount,
		CONVERT(nvarchar, ij6.TransDate, 104) AS DateForReportName
	FROM [pbi_11709].stageInventoryJournalByTransferType AS ij6
	WHERE ij6.HrmOrganizationId_From = ij6.HrmOrganizationId_To