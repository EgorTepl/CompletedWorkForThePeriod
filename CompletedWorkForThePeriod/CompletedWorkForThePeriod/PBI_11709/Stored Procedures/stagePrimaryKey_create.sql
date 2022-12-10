-- =============================================
-- Author: TeploukhovES
-- Create date: 18.08.2022
-- Description: Создает первичные ключи для таблиц с префиксом stage
-- =============================================
CREATE PROCEDURE [pbi_11709].[stagePrimaryKey_create]
AS

BEGIN
	SET NOCOUNT ON;
	
	DECLARE @schemaName NVARCHAR(9)
	DECLARE @tableName NVARCHAR(200)
	DECLARE @primaryKeyName NVARCHAR(200)
	DECLARE @columnName NVARCHAR(200)
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
		DECLARE createPrimaryKeyCur CURSOR FOR
		SELECT
			stageObj.schemaName,
			stageObj.objectName,
			stageObj.primaryKeyName,
			stageObj.primaryKeyColumnName
		FROM pbi_11709.dbObject AS stageObj
		WHERE 
			stageObj.objectType = N'U'
			AND stageObj.objectName LIKE N'stage%'

		OPEN createPrimaryKeyCur
		FETCH NEXT FROM createPrimaryKeyCur INTO @schemaName, @tableName, @primaryKeyName, @columnName
		WHILE @@FETCH_STATUS = 0
		BEGIN
			SET @sql = 'ALTER TABLE ' + @schemaName + '.' + @tableName + ' ADD CONSTRAINT ' + @primaryKeyName + ' PRIMARY KEY (' + @columnName + ')'
			EXEC dbo.sp_executesql @sql
			FETCH NEXT FROM createPrimaryKeyCur INTO @schemaName, @tableName, @primaryKeyName, @columnName
		END 
		CLOSE createPrimaryKeyCur
		DEALLOCATE createPrimaryKeyCur	
	END
END
