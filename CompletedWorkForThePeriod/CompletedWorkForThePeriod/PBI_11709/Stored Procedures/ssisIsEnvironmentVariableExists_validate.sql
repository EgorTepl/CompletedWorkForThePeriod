-- =============================================
-- Author: TeploukhovES
-- Create date: 24.08.2022
-- Description:	Проверяет переменную объекта 'Environment'
-- =============================================
CREATE PROCEDURE [pbi_11709].[ssisIsEnvironmentVariableExists_validate]
	@variableName AS nvarchar(128),
	@environmentName AS nvarchar(128),
	@folderName AS nvarchar(128)
AS
BEGIN
	DECLARE @isVariableExists bit = 0

	IF EXISTS
	(
		SELECT 1
		FROM [SSISDB].[internal].[environment_variables] AS v
		INNER JOIN [SSISDB].[internal].[environments] AS e
			ON E.environment_id = V.environment_id
		INNER JOIN [SSISDB].[internal].[folders] AS f
			ON E.folder_id = F.folder_id
		WHERE
			v.name = @variableName
			AND e.environment_name = @environmentName
			AND f.[name] = @folderName
	)
	BEGIN
		SET @isVariableExists = 1
	END
	RETURN @isVariableExists
END
