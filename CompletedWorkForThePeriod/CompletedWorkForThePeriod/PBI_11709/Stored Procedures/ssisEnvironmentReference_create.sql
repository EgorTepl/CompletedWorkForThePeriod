-- =============================================
-- Author: TeploukhovES
-- Create date: 23.08.2022
-- Description:	Создает ссылку на объект 'Environment' в проекте Ssis
-- =============================================
CREATE PROCEDURE [pbi_11709].[ssisEnvironmentReference_create]
	@projectName AS nvarchar(128),
	@environmentName AS nvarchar(128),
	@folderName AS nvarchar(128)

AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @referenceId bigint
	DECLARE @sqlCommand nvarchar(MAX)
	DECLARE @isReferenceNotExists bit = 0

	EXEC @isReferenceNotExists = pbi_11709.ssisIsEnvironmentReferenceNotExists_validate @projectName, @environmentName, @folderName;
	IF @isReferenceNotExists = 1
	BEGIN
		SET @sqlCommand = N'EXECUTE [SSISDB].[catalog].[create_environment_reference] '
			+ N'@environment_name = N''' + @environmentName + ''', '
			+ N'@reference_id = @referenceId , @project_name = N''' + @projectName + ''', '
			+ N'@folder_name = N''' + @folderName + ''', @reference_type = N''' + 'R' +''''
		EXEC sp_executesql 
			@sqlCommand,
			@Params = N'@referenceId bigint',
			@referenceId = @referenceId;
	END
END