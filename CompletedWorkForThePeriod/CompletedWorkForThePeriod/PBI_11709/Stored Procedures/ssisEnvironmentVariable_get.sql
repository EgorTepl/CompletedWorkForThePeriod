-- =============================================
-- Author: TeploukhovES
-- Create date: 23.08.2022
-- Description:	Возвращает переменную табличного типа для валидации 'Environment'
-- =============================================
CREATE PROCEDURE [pbi_11709].[ssisEnvironmentVariable_get]
	@sourceDbName nvarchar(4000),
	@targetDbName nvarchar(4000),
	@sourceServerName nvarchar(4000),
	@targetServerName nvarchar(4000)
AS
BEGIN
	DECLARE @environmentVariableTable udtEnvironmentVariable
	DECLARE @sourceDbVaribleName nvarchar(28) = N'AX_DB_SOURCE_INITIAL_CATALOG'
	DECLARE @targetDbVaribleName nvarchar(33) = N'STMS_AX_DB_TARGET_INITIAL_CATALOG'
	DECLARE @sourceServerVaribleName nvarchar(24) = N'AX_DB_SOURCE_SERVER_NAME'
	DECLARE @targetServerVaribleName nvarchar(29) = N'STMS_AX_DB_TARGET_SERVER_NAME'
	DECLARE @varibleDataTypeString nvarchar(100) = N'String'
	DECLARE @sensitiveValue bit = 0
	DECLARE @isVariableExists bit = 0

	INSERT INTO @environmentVariableTable
	(
		variableName,
		dataType,
		sensitive,
		value
	)
	VALUES
		(@sourceDbVaribleName, @varibleDataTypeString, @sensitiveValue, @sourceDbName),
		(@targetDbVaribleName, @varibleDataTypeString, @sensitiveValue, @targetDbName),
		(@sourceServerVaribleName, @varibleDataTypeString, @sensitiveValue, @sourceServerName),
		(@targetServerVaribleName, @varibleDataTypeString, @sensitiveValue, @targetServerName)
	
	SELECT
		variableName,
		dataType,
		sensitive,
		value
	FROM @environmentVariableTable
END
