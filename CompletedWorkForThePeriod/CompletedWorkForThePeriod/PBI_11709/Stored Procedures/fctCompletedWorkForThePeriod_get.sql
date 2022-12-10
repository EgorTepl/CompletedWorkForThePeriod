-- =============================================
-- Author: TeploukhovES
-- Create date: 14.07.2022
-- Description: Запрос к отчету "Выполненные работы за период"
-- Ссылка на TFS: http://eka-devops/devops/Sinara/DAX/_workitems/edit/11709
-- =============================================
CREATE PROCEDURE [pbi_11709].[fctCompletedWorkForThePeriod_get]
	@DepotCodeName NVARCHAR(25),
	@startDateStr NVARCHAR(10),
	@endDateStr NVARCHAR(10)
	
AS

BEGIN
	SET NOCOUNT ON;

	DECLARE @startDate DATE
	DECLARE @endDate DATE

	SET @startDate = CONVERT(date, @startDateStr, 103)
	SET @endDate = CONVERT(date, @endDateStr, 103)

	SELECT
		[OperationTypeName] AS [Тип операции],
		[DocumentName] AS [Номер документа],
		StatusName AS [Статус по документу],
		DateForReportName AS [Дата],
		RepairObjectName AS [Объект ремонта/выпуска],
		DescriptionName AS [Описание],
		RepairObjectNumberName AS [Номер],
		ServiceKindName AS [Вид СО/операции],
		ManufactoryName AS [Цех ремонта],
		DepotCodeName AS [Код подразделения],
		ParentDepotCodeName AS [РУС],
		ResponsibleWorkerName AS [Ответственный],
		Qty AS [Количество по документу],
		UnitName AS [Единица измерения],
		RepairedCount AS [Отремонтировано/Изготовлено]
	FROM [pbi_11709].fctCompletedWorkForThePeriod
	WHERE 
		(DateId BETWEEN @startDate AND @endDate)
		AND DepotCodeName = @DepotCodeName
END