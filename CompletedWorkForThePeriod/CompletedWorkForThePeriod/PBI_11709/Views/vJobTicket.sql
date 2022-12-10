-- =============================================
-- Author: TeploukhovES
-- Create date: 11.07.2022
-- Description: Обработка данных по заказ-нарядам
-- =============================================

CREATE VIEW [pbi_11709].[vJobTicket]
	AS

	SELECT
		CASE jtt.JobTicketType
			WHEN 0 THEN N'СО локомотива'
			WHEN 1 THEN N'Ремонт МПИ'
			WHEN 2 THEN N'Межпоездное СО'
			ELSE N''
			END AS OperationTypeName,
		jtt.JobTicketNumber AS DocumentName,
		CASE jtt.Status
			WHEN 0 THEN N'Создан'
			WHEN 1 THEN N'В работе'
			WHEN 2 THEN N'Закрыт'
			WHEN 3 THEN N'Отменен'
			ELSE N''
			END AS StatusName,
		CAST(DATEADD(hour, CAST('$(UTC_OFFSET)' AS int), jtt.CloseDateTime) AS date) AS DateId,
		jtt.RepairObject AS RepairObjectName,
		COALESCE(jtt.Description, N'') AS DescriptionName,
		COALESCE(jtt.FactoryId, N'') AS RepairObjectNumberName,
		jtt.ServiceKindId AS ServiceKindName,
		COALESCE(jtt.ManufactoryName_RepairLocomotive, N'') AS ManufactoryName,
		jtt.RPayHrmOrganizationId AS DepotCodeName,
		COALESCE(jtt.ParentOrganizationId, N'') AS ParentDepotCodeName,
		COALESCE
		(
			IIF(jtt.CloseWorker != 0, jtt.ResponsibleWorker_CloseWorkerIsNotNull,
					jtt.ResponsibleWorker_CloseWorkerIsNull
			), N''
		) AS ResponsibleWorkerName,
		jtt.Qty,
		jtt.UnitId AS UnitName,
		jtt.RepairedCount,
		CONVERT(nvarchar, DATEADD(hour, CAST('$(UTC_OFFSET)' AS int), jtt.CloseDateTime), 104) AS DateForReportName
	FROM [pbi_11709].stageJobTicket AS jtt
	WHERE jtt.JobTicketType IN (0, 2)

	UNION ALL

	SELECT
		CASE jtt.JobTicketType
			WHEN 0 THEN N'СО локомотива'
			WHEN 1 THEN N'Ремонт МПИ'
			WHEN 2 THEN N'Межпоездное СО'
			ELSE N''
			END AS OperationTypeName,
		jtt.JobTicketNumber AS DocumentName,
		CASE jtt.Status
			WHEN 0 THEN N'Создан'
			WHEN 1 THEN N'В работе'
			WHEN 2 THEN N'Закрыт'
			WHEN 3 THEN N'Отменен'
			ELSE N''
			END AS StatusName,
		CAST(DATEADD(hour, CAST('$(UTC_OFFSET)' AS int), jtt.CloseDateTime) AS date) AS DateId,
		jtt.RepairObject AS RepairObjectName,
		COALESCE(jtt.NameAlias, N'') AS DescriptionName,
		COALESCE(IIF(jtt.InventSerialId != N'', jtt.InventSerialId, jtt.InventBatchId), N'') AS RepairObjectNumberName,
		jtt.ServiceKindId AS ServiceKindName,
		COALESCE(jtt.ManufactoryName_RepairItem, N'') AS ManufactoryName,
		jtt.RPayHrmOrganizationId AS DepotCodeName,
		COALESCE(jtt.ParentOrganizationId, N'') AS ParentDepotCodeName,
		COALESCE
		(
			IIF(jtt.CloseWorker != 0, jtt.ResponsibleWorker_CloseWorkerIsNotNull,
					jtt.ResponsibleWorker_CloseWorkerIsNull
			), N''
		) AS ResponsibleWorkerName,
		jtt.Qty,
		jtt.UnitId AS UnitName,
		jtt.RepairedCount,
		CONVERT(nvarchar, DATEADD(hour, CAST('$(UTC_OFFSET)' AS int), jtt.CloseDateTime), 104) AS DateForReportName
	FROM [pbi_11709].stageJobTicket AS jtt
	WHERE jtt.JobTicketType = 1