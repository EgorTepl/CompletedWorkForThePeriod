-- =============================================
-- Author: TeploukhovES
-- Create date: 26.08.2022
-- Description: устанавливает значение переменной 'Environment' в параметр проекта
-- =============================================
CREATE PROCEDURE [pbi_11709].[ssisProjectParameter_set]
	@projectParameterTable udtProjectParameter READONLY,
	@projectName AS nvarchar(128),
	@folderName AS nvarchar(128)

AS
BEGIN
	DECLARE @id int
	DECLARE @maxId int
	DECLARE @objectType smallint
	DECLARE @objectName nvarchar(260)
	DECLARE @parameterName nvarchar(128)
	DECLARE @parameterValue sql_variant
	DECLARE @valueType char(1)
	DECLARE @sqlCommand NVARCHAR(MAX)

	SELECT 
		@id = 1,
		@maxId = MAX([id]) 
	FROM @projectParameterTable
	WHILE @id <= @maxId
	BEGIN
		SELECT
			@objectType = v.objectType,
			@objectName = v.objectName,
			@parameterName = v.parameterName,
			@parameterValue = v.parameterValue,
			@valueType = v.valueType
		FROM @projectParameterTable AS v
		WHERE id = @id;
  
		SET @sqlCommand = N'EXECUTE [SSISDB].[catalog].[set_object_parameter_value]'
			+ N'@object_type = ''' + CAST(@objectType AS nvarchar(10)) + ''', '
			+ N'@folder_name = N''' + @folderName + ''', '
			+ N'@project_name = N''' + @projectName + ''', '
			+ N'@parameter_name = N''' + @parameterName + ''', '
			+ N'@parameter_value = N''' + CAST(@parameterValue AS Nvarchar(100)) + ''', '
			+ N'@object_name = N''' + @objectName + ''', '
			+ N'@value_type = N''' + @valueType + ''';'
 
		EXEC sp_executesql @sqlCommand;
		SET @id = @id + 1
	END	
END
