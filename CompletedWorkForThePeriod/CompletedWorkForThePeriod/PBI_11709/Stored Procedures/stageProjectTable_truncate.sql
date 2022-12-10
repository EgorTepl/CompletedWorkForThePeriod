-- =============================================
-- Author: TeploukhovES
-- Create date: 18.08.2022
-- Description: Удаляет строки из таблиц с префиксом stage
-- =============================================
CREATE PROCEDURE [pbi_11709].[stageProjectTable_truncate]
AS

BEGIN
	SET NOCOUNT ON;

	DECLARE @schemaName NVARCHAR(9)
	DECLARE @tableName NVARCHAR(200)
	DECLARE @sql NVARCHAR(MAX)

	IF EXISTS
	(
		SELECT 1
		FROM pbi_11709.dbObject AS obj
		WHERE
			obj.objectType = N'U'
			AND obj.objectName LIKE N'stage%'
	)
	BEGIN
		DECLARE truncateTableCur CURSOR FOR
		SELECT
			stageObj.schemaName,
			stageObj.objectName
		FROM pbi_11709.dbObject AS stageObj
		WHERE 
			stageObj.objectType = N'U'
			AND stageObj.objectName LIKE N'stage%'

		OPEN truncateTableCur
		FETCH NEXT FROM truncateTableCur INTO @schemaName, @tableName
		WHILE @@FETCH_STATUS = 0
		BEGIN
			SET @sql = 'TRUNCATE TABLE ' + @schemaName + '.' + @tableName
			EXEC dbo.sp_executesql @sql
			FETCH NEXT FROM truncateTableCur INTO @schemaName, @tableName
		END 
		CLOSE truncateTableCur
		DEALLOCATE truncateTableCur
	END
END
