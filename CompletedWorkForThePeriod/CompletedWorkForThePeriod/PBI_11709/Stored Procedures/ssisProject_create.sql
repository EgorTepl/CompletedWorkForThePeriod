-- =============================================
-- Author: TeploukhovES
-- Create date: 23.08.2022
-- Description:	Создает проект Ssis в каталоге Integration Services Catalogs -> SSISDB
-- =============================================
CREATE PROCEDURE [pbi_11709].[ssisProject_create]
	@sourceDbName nvarchar(4000),
	@targetDbName nvarchar(4000),
	@sourceServerName nvarchar(4000),
	@targetServerName nvarchar(4000)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE
		@folderName AS nvarchar(128),
		@environmentName AS nvarchar(128),
		@projectName AS nvarchar(128),
		@ispacPath AS nvarchar(MAX) = '$(ISPACK_PATH)'

	SELECT
		@folderName = p.folderName,
		@environmentName = p.environmentName,
		@projectName = p.projectName
	FROM pbi_11709.ssisProject AS p

	EXEC pbi_11709.ssisProjectFolder_create @folderName;
	EXEC pbi_11709.ssisProject_deploy @folderName, @ispacPath, @projectName;
	EXEC pbi_11709.ssisEnvironment_create @folderName, @environmentName;
	EXEC pbi_11709.ssisEnvironmentToProjectConnection_sync
		@folderName,
		@environmentName,
		@sourceDbName,
		@targetDbName,
		@sourceServerName,
		@targetServerName,
		@projectName;
END
