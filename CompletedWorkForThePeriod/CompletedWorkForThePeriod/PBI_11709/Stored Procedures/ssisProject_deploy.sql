-- =============================================
-- Author: TeploukhovES
-- Create date: 24.08.2022
-- Description:	Деплоймент проекта Ssis в каталоге проекта
-- =============================================
CREATE PROCEDURE [pbi_11709].[ssisProject_deploy]
	@folderName AS nvarchar(128),
	@ispacPath AS nvarchar(MAX),
	@projectName AS nvarchar(128)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @sqlCommand nvarchar(MAX)
	DECLARE @ispacBinary as varbinary(MAX)

	SET @sqlCommand = 'SET @ispacBinary = (SELECT * FROM OPENROWSET(BULK N''' + @ispacPath + ''', SINGLE_BLOB) as BinaryData)'
	EXEC sp_executesql
		@Query  = @sqlCommand,
		@Params = N'@ispacBinary varbinary(max) OUTPUT',
		@ispacBinary = @ispacBinary OUTPUT;
 
	SET @sqlCommand = N'EXECUTE [SSISDB].[catalog].[deploy_project] '
		+ N'@folder_name = N'''+ @folderName + ''', @project_name = N''' + @projectName + ''', '
		+ N'@Project_Stream = @ispacBinary'
	EXEC sp_executesql
		@sqlCommand, 
		@Params = N'@ispacBinary varbinary(MAX)', 
		@ispacBinary = @ispacBinary;
END
