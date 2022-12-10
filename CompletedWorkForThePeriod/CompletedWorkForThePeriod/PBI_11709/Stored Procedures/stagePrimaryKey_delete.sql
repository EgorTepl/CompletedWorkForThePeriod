-- =============================================
-- Author: TeploukhovES
-- Create date: 18.08.2022
-- Description: Удаляет первичные ключи из таблиц с префиксом stage
-- =============================================
CREATE PROCEDURE [pbi_11709].[stagePrimaryKey_delete]
AS

BEGIN
	SET NOCOUNT ON;

	DECLARE @schemaName NVARCHAR(9)
	DECLARE @tableName NVARCHAR(200)
	DECLARE @primaryKeyName NVARCHAR(200)
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
		DECLARE dropPrimaryKeyCur CURSOR FOR
		SELECT
			stageObj.schemaName,
			stageObj.objectName,
			stageObj.primaryKeyName
		FROM pbi_11709.dbObject AS stageObj
		WHERE 
			stageObj.objectType = N'U'
			AND stageObj.objectName LIKE N'stage%'

		OPEN dropPrimaryKeyCur
		FETCH NEXT FROM dropPrimaryKeyCur INTO @schemaName, @tableName, @primaryKeyName
		WHILE @@FETCH_STATUS = 0
		BEGIN
			SET @sql = 'ALTER TABLE ' + @schemaName + '.' + @tableName + ' DROP CONSTRAINT ' + @primaryKeyName
			EXEC dbo.sp_executesql @sql
			FETCH NEXT FROM dropPrimaryKeyCur INTO @schemaName, @tableName, @primaryKeyName
		END 
		CLOSE dropPrimaryKeyCur
		DEALLOCATE dropPrimaryKeyCur
	END
END
