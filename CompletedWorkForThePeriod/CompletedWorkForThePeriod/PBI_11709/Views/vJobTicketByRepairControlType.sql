-- =============================================
-- Author: TeploukhovES
-- Create date: 12.07.2022
-- Description: Обработка данных по заказ-нарядам по типу "Контроль ремонта"
-- =============================================

CREATE VIEW [pbi_11709].[vJobTicketByRepairControlType]
	AS

	SELECT
		N'Контроль ремонта' AS OperationTypeName,
		jtt.JobTicketNumber AS DocumentName,
		CASE jtt.Status
			WHEN 0 THEN N'Создан'
			WHEN 1 THEN N'В работе'
			WHEN 2 THEN N'Закрыт'
			WHEN 3 THEN N'Отменен'
			ELSE N''
			END AS StatusName,
		CAST(jtt.RepairConfirmDate AS date) AS DateId,
		jtt.RepairObject AS RepairObjectName,
		COALESCE(jtt.Description, N'') AS DescriptionName,
		COALESCE(jtt.FactoryId, N'') AS RepairObjectNumberName,
		N'Контроль ремонта' AS ServiceKindName,
		COALESCE(jtt.ManufactoryName_RepairLocomotive, N'') AS ManufactoryName,
		jtt.RPayHrmOrganizationId AS DepotCodeName,
		COALESCE(jtt.ParentOrganizationId, N'') AS ParentDepotCodeName,
		COALESCE(jtt.ResponsibleWorker_RepairConfirm, N'') AS ResponsibleWorkerName,
		jtt.Qty,
		jtt.UnitId AS UnitName,
		jtt.RepairedCount,
		CONVERT(nvarchar, jtt.RepairConfirmDate, 104) AS DateForReportName
	FROM [pbi_11709].stageJobTicketByRepairControlType AS jtt
	WHERE jtt.JobTicketType IN (0, 2)

	UNION ALL

		SELECT
		N'Контроль ремонта' AS OperationTypeName,
		jtt.JobTicketNumber AS DocumentName,
		CASE jtt.Status
			WHEN 0 THEN N'Создан'
			WHEN 1 THEN N'В работе'
			WHEN 2 THEN N'Закрыт'
			WHEN 3 THEN N'Отменен'
			ELSE N''
			END AS StatusName,
		CAST(jtt.RepairConfirmDate AS date) AS DateId,
		jtt.RepairObject AS RepairObjectName,
		COALESCE(jtt.NameAlias, N'') AS DescriptionName,
		COALESCE(IIF(jtt.InventSerialId != N'', jtt.InventSerialId, jtt.InventBatchId), N'') AS RepairObjectNumberName,
		N'Контроль ремонта' AS ServiceKindName,
		COALESCE(jtt.ManufactoryName_RepairItem, N'') AS ManufactoryName,
		jtt.RPayHrmOrganizationId AS DepotCodeName,
		COALESCE(jtt.ParentOrganizationId, N'') AS ParentDepotCodeName,
		COALESCE(jtt.ResponsibleWorker_RepairConfirm, N'') AS ResponsibleWorkerName,
		jtt.Qty,
		jtt.UnitId AS UnitName,
		jtt.RepairedCount,
		CONVERT(nvarchar, jtt.RepairConfirmDate, 104) AS DateForReportName
	FROM [pbi_11709].stageJobTicketByRepairControlType AS jtt
	WHERE jtt.JobTicketType = 1