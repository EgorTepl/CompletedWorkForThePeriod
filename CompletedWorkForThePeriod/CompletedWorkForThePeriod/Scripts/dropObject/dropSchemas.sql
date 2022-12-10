/* Drop schemas */
USE $(DB_TARGET_NAME)
GO

DECLARE @sqlCmd nvarchar(254)

IF EXISTS (SELECT 1 FROM sys.schemas WHERE name = $(PBI_SCHEMA_NAME))
BEGIN
	SELECT @sqlCmd = N'DROP SCHEMA ' + $(PBI_SCHEMA_NAME)
	EXEC(@sqlCmd)
	PRINT N'Dropped schema: ' + $(PBI_SCHEMA_NAME)
END

GO