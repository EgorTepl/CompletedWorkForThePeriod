-- =============================================
-- Author: TeploukhovES
-- Create date: 23.08.2022
-- Description:	Создает переменную в объекте 'Environment'
-- =============================================
CREATE PROCEDURE [pbi_11709].[ssisEnvironmentVariable_create]
	@folderName AS nvarchar(128),
	@environmentName AS nvarchar(128),
	@variableName nvarchar(128),
	@dataType nvarchar(128),
	@sensitive bit,
	@value sql_variant
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @sqlCommand nvarchar(MAX)

	SET @sqlCommand = N'EXECUTE [SSISDB].[catalog].[create_environment_variable] '
		+ N'@folder_name = N'''+ @folderName + ''', @environment_name = N''' + @environmentName + ''', '
		+ N'@variable_name = N'''+ @variableName + ''', @data_type = N''' + @dataType + ''', '
		+ N'@sensitive = ' + CONVERT(nvarchar, @sensitive) + ', ' + N'@value = ' +
		CASE UPPER(@dataType)
			WHEN 'String' THEN 'N''' + CONVERT(nvarchar(1000), @value) + ''' '
			ELSE CONVERT(nvarchar(1000), @value)
		END + '; '
	EXEC sp_executesql @sqlCommand;
END
