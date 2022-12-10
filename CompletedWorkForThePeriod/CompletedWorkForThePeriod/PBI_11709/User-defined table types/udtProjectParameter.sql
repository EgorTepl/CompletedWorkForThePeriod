CREATE TYPE [pbi_11709].[udtProjectParameter] AS TABLE
(
	id int identity(1, 1),
	objectType smallint,
	objectName nvarchar(260),
	parameterName nvarchar(128),
	parameterValue sql_variant,
	valueType char(1)
)
