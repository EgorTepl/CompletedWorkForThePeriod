-- =============================================
-- Author: TeploukhovES
-- Create date: 23.08.2022
-- Description:	Создает папку проекта Ssis в каталоге Integration Services Catalogs -> SSISDB
-- =============================================
CREATE PROCEDURE [pbi_11709].[ssisProjectFolder_create]
	@folderName AS nvarchar(128)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @sqlCommand nvarchar(MAX)
	DECLARE @errorMsg nvarchar(200)

	IF NOT EXISTS
	(
		SELECT 1
		FROM [SSISDB].[internal].[folders]
		WHERE [name] = @folderName
	)
	BEGIN
		SET @sqlCommand = N'[SSISDB].[catalog].[create_folder] N''' +  @folderName + ''';'
		EXEC sp_executesql @sqlCommand;
		SET @sqlCommand = N'[SSISDB].[catalog].[set_folder_description] ' + @folderName + N', @folder_description = @folderDescription'
		EXEC sp_executesql 
			@sqlCommand,
			@Params = N'@folderDescription nvarchar(MAX)',
			@folderDescription = N'Проект синхронизации отчета "Выполненные работы за период"';
	END
	ELSE
	BEGIN
		SET @errorMsg = N'Не удалось создать каталог в Integration Services Catalogs с именем ' + @folderName + ' поскольку он уже существует';
		PRINT @errorMsg;
	END
END
