-- =============================================
-- Author: TeploukhovES
-- Create date: 11.07.2022
-- Description: Обработка данных по документам о поступлении ТМЦ от поставщиков
-- =============================================

CREATE VIEW [pbi_11709].[vPrintout]
	AS

	SELECT 
		N'Поступление ТМЦ от Поставщика' AS OperationTypeName,
		recii.DocumentId AS DocumentName,
		N'Получено' AS StatusName,
		CAST(recii.DocumentDate AS date) AS DateId,
		N'' AS RepairObjectName,
		N'' AS DescriptionName,
		N'' AS RepairObjectNumberName,
		CASE recii.JournalType
			WHEN 0 THEN N'Накладная на отпуск материалов на сторону (M-15)'
			WHEN 1 THEN N'Приходный ордер (M-4)'
			WHEN 2 THEN N'Акт о приемке материалов (M7)'
			WHEN 3 THEN N'Акт о приемке товаров (ТОРГ-1)'
			WHEN 4 THEN N'Акт о приемке товаров (ТОРГ-2)'
			WHEN 5 THEN N'Акт о приемке товаров (ТОРГ-3)'
			WHEN 6 THEN N'Накладная на отпуск по заказу на перемещение (М-15)'
			WHEN 7 THEN N'Акт о приемке товара, поступившего без счета (ТОРГ-4)'
			WHEN 8 THEN N'Приходный ордер (СТМ-С-М-4)'
			WHEN 9 THEN N'Акт о приемке ТМЦ СТМ-С-М-3'
			ELSE N''
			END AS ServiceKindName,
		N'' AS ManufactoryName,		
		COALESCE(recii.HrmOrganizationId, N'') AS DepotCodeName,
		COALESCE(recii.ParentOrganizationId, N'') AS ParentDepotCodeName,
		COALESCE(recii.ResponsibleWorkerName, N'') AS ResponsibleWorkerName,
		NULL AS Qty,
		N'' AS UnitName,
		NULL AS RepairedCount,
		CONVERT(nvarchar, recii.DocumentDate, 104) AS DateForReportName
	FROM [pbi_11709].[stagePrintout] AS recii