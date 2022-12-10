/* Drop Ssis Project */
USE $(DB_TARGET_NAME)
GO

DECLARE @errorMsg nvarchar(200)
DECLARE @folderName AS nvarchar(128)

SELECT 
	@folderName = p.folderName
FROM pbi_11709.ssisProject AS p

IF NOT EXISTS
(
	SELECT 1
	FROM [SSISDB].[internal].[folders]
	WHERE [name] = @folderName
)
BEGIN
	SET @errorMsg = N'Каталога в Integration Services Catalogs с именем ' + @folderName + N' не существует';
	PRINT @errorMsg;
END
:r .\dropSsisEnvironment.sql
:r .\dropSsisDeployment.sql
:r .\dropSsisFolder.sql

GO