USE $(DB_TARGET_NAME)
GO

DECLARE @schemaName nvarchar(15)
DECLARE @objectName nvarchar(255)
DECLARE @objectDataType nvarchar(10)
DECLARE @sqlCmd nvarchar(MAX)

SELECT obj.schemaName, obj.objectName, obj.objectType, obj.objectTypeNumber
INTO #dbObject
FROM pbi_11709.dbObject AS obj
WHERE obj.objectType IN ('P', 'U', 'V', N'table type')

DECLARE dropObjectCur CURSOR FOR

SELECT obj.schemaName, obj.objectName, obj.objectType
FROM #dbObject AS obj
ORDER BY obj.schemaName, obj.objectTypeNumber, obj.objectName

OPEN dropObjectCur
FETCH NEXT FROM dropObjectCur INTO @schemaName, @objectName, @objectDataType
WHILE @@FETCH_STATUS = 0
BEGIN
	IF @objectDataType = N'P'
	BEGIN
		SET @sqlCmd = N'DROP PROCEDURE ' + @schemaName + '.' + @objectName
		EXEC dbo.sp_executesql @sqlCmd
		PRINT N'Dropped procedure: ' + @schemaName + '.' + @objectName
		FETCH NEXT FROM dropObjectCur INTO @schemaName, @objectName, @objectDataType
	END
	IF @objectDataType = N'V'
	BEGIN
		SET @sqlCmd = N'DROP VIEW ' + @schemaName + '.' + @objectName
		EXEC dbo.sp_executesql @sqlCmd
		PRINT N'Dropped view: ' + @schemaName + '.' + @objectName
		FETCH NEXT FROM dropObjectCur INTO @schemaName, @objectName, @objectDataType
	END
	IF @objectDataType = N'U'
	BEGIN
		SET @sqlCmd = N'DROP TABLE ' + @schemaName + '.' + @objectName
		EXEC dbo.sp_executesql @sqlCmd
		PRINT N'Dropped table: ' + @schemaName + '.' + @objectName
		FETCH NEXT FROM dropObjectCur INTO @schemaName, @objectName, @objectDataType
	END
	IF @objectDataType = N'table type'
	BEGIN
		SET @sqlCmd = N'DROP TYPE ' + @schemaName + '.' + @objectName
		EXEC dbo.sp_executesql @sqlCmd
		PRINT N'Dropped type: ' + @schemaName + '.' + @objectName
		FETCH NEXT FROM dropObjectCur INTO @schemaName, @objectName, @objectDataType
	END
END
CLOSE dropObjectCur
DEALLOCATE dropObjectCur

DROP TABLE #dbObject
GO
