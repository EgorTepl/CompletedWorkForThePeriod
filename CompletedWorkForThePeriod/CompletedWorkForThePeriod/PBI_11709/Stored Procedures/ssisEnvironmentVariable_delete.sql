-- =============================================
-- Author: TeploukhovES
-- Create date: 23.08.2022
-- Description:	Удаляет переменную в объекте 'Environment'
-- =============================================
CREATE PROCEDURE [pbi_11709].[ssisEnvironmentVariable_delete]
	@folderName AS nvarchar(128),
	@environmentName AS nvarchar(128),
	@variableName AS nvarchar(128)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @sqlCommand NVARCHAR(MAX)

	SET @sqlCommand = N'EXECUTE [SSISDB].[catalog].[delete_environment_variable] '
		+ N'@folder_name = N'''+ @folderName + ''', @environment_name = N''' + @environmentName + ''', '
		+ N'@variable_name = N''' + @variableName + ''''
	EXEC sp_executesql @sqlCommand;

END
