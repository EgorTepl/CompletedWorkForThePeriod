-- =============================================
-- Author: TeploukhovES
-- Create date: 26.08.2022
-- Description:	Добавляет в значение параметра проекта значение переменной 'Environment'
-- =============================================
CREATE PROCEDURE [pbi_11709].[ssisEnvironmentToProjectConnection_create]
	@projectName AS nvarchar(128),
	@folderName AS nvarchar(128)

AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @projectParameterTable udtProjectParameter

	INSERT INTO @projectParameterTable
	(
		objectType,
		objectName,
		parameterName,
		parameterValue,
		valueType
	)
	SELECT
		op.object_type,
		op.object_name,
		op.parameter_name,
		ev.name AS parameterValue,
		N'R' AS referencesValueType
	FROM SSISDB.internal.object_parameters AS op
	INNER JOIN SSISDB.internal.environment_variables AS ev
		ON op.parameter_name = ev.name
	WHERE op.object_name = @projectName

	EXEC pbi_11709.ssisProjectParameter_set @projectParameterTable, @projectName, @folderName
END
