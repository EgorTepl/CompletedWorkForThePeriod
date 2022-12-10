-- =============================================
-- Author: TeploukhovES
-- Create date: 23.08.2022
-- Description:	Валидация переменной объекта 'Environment'
-- =============================================
CREATE PROCEDURE [pbi_11709].[ssisEnvironmentVariable_validate]
	@folderName AS nvarchar(128),
	@environmentName AS nvarchar(128),
	@sourceDbName nvarchar(4000),
	@targetDbName nvarchar(4000),
	@sourceServerName nvarchar(4000),
	@targetServerName nvarchar(4000)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @environmentVariableTable udtEnvironmentVariable
	DECLARE @id int
	DECLARE @maxId int
	DECLARE @variableName nvarchar(128)
	DECLARE @dataType nvarchar(128)
	DECLARE @sensitive bit
	DECLARE @value sql_variant
	DECLARE @isVariableExists bit = 0
	
	INSERT INTO @environmentVariableTable
	EXEC pbi_11709.ssisEnvironmentVariable_get @sourceDbName, @targetDbName, @sourceServerName, @targetServerName

	SELECT
		@id = 1,
		@maxId = MAX(id)
	FROM @environmentVariableTable
	WHILE @id <= @maxId
	BEGIN
		SELECT
			@variableName = v.variableName,
			@dataType = v.dataType,
			@sensitive = v.sensitive,
			@value = v.value
		FROM @environmentVariableTable AS v
		WHERE id = @id;

		EXEC @isVariableExists = pbi_11709.ssisIsEnvironmentVariableExists_validate @variableName, @environmentName, @folderName;
		IF @isVariableExists = 1
		BEGIN
			EXEC pbi_11709.ssisEnvironmentVariable_delete @folderName, @environmentName, @variableName;
		END
		EXEC pbi_11709.ssisEnvironmentVariable_create @folderName, @environmentName, @variableName, @dataType, @sensitive, @value;
		SET @id = @id + 1
	END
END
