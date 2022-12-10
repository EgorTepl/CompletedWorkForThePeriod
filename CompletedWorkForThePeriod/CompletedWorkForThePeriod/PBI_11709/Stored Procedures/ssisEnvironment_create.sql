-- =============================================
-- Author: TeploukhovES
-- Create date: 23.08.2022
-- Description:	Создает объект 'Environment' в каталоге проекта Ssis для хранения и инициализации переменных
-- =============================================
CREATE PROCEDURE [pbi_11709].[ssisEnvironment_create]
	@folderName AS nvarchar(128),
	@environmentName AS nvarchar(128)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @sqlCommand nvarchar(MAX)
	DECLARE @errorMsg nvarchar(200)

	IF NOT EXISTS
	(
		SELECT 1
		FROM [SSISDB].[internal].[environments] AS e
		INNER JOIN [SSISDB].[internal].[folders] AS f 
			ON E.folder_id = F.folder_id
		WHERE
			e.environment_name = @environmentName
			AND f.name = @folderName
	)
	BEGIN
		SET @sqlCommand = N'[SSISDB].[catalog].[create_environment] N''' + @folderName + ''', N''' +
					@environmentName + '''';
		EXEC sp_executesql @sqlCommand;
	END
	ELSE
	BEGIN
		SET @errorMsg = 'Невозможно создать среду ' + @environmentName  + ' поскольку она уже существует в каталоге ' + @folderName;
		PRINT @errorMsg;
	END
END
