CREATE TYPE [pbi_11709].[udtEnvironmentVariable] AS TABLE
(
	id int identity(1, 1),
	variableName nvarchar(128),
	dataType nvarchar(128),
	sensitive bit,
	value nvarchar(4000)
)
