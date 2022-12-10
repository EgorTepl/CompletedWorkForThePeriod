-- =============================================
-- Author: TeploukhovES
-- Create date: 24.08.2022
-- Description: создает переменную в 'Environment' и ее значение добавляет в значение параметра проекта
-- =============================================
CREATE PROCEDURE [pbi_11709].[ssisEnvironmentToProjectConnection_sync]
	@folderName AS nvarchar(128),
	@environmentName AS nvarchar(128),
	@sourceDbName nvarchar(4000),
	@targetDbName nvarchar(4000),
	@sourceServerName nvarchar(4000),
	@targetServerName nvarchar(4000),
	@projectName AS nvarchar(128)

AS
BEGIN
	EXEC pbi_11709.ssisEnvironmentVariable_validate
		@folderName,
		@environmentName,
		@sourceDbName,
		@targetDbName,
		@sourceServerName,
		@targetServerName
	EXEC pbi_11709.ssisEnvironmentReference_create @projectName, @environmentName, @folderName
	EXEC pbi_11709.ssisEnvironmentToProjectConnection_create @projectName, @folderName
END
