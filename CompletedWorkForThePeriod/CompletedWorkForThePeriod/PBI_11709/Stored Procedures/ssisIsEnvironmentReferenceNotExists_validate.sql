-- =============================================
-- Author: TeploukhovES
-- Create date: 24.08.2022
-- Description:	Проверяет ссылку объекта 'Environment'
-- =============================================
CREATE PROCEDURE [pbi_11709].[ssisIsEnvironmentReferenceNotExists_validate]
	@projectName AS nvarchar(128),
	@environmentName AS nvarchar(128),
	@folderName AS nvarchar(128)
		
AS
BEGIN
	DECLARE @isReferenceNotExists bit = 0

	IF NOT EXISTS
	(
		SELECT 1
		FROM [SSISDB].[internal].[environment_references] AS R
		INNER JOIN [SSISDB].[internal].[projects] AS P
			ON P.project_id = R.project_id
		INNER JOIN [SSISDB].[internal].[folders] AS F
			ON P.folder_id = F.folder_id
		WHERE
			P.name = @projectName
			AND R.environment_name = @environmentName
			AND F.[name] = @folderName
	)
	BEGIN
		SET @isReferenceNotExists = 1
	END
	RETURN @isReferenceNotExists
END
