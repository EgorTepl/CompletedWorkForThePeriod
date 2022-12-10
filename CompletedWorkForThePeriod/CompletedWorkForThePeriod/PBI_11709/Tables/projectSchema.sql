CREATE TABLE [pbi_11709].[projectSchema]
(
	recId INT IDENTITY(1, 1) NOT NULL,
	pbiSchemaName NVARCHAR(9) NOT NULL
	CONSTRAINT [pk_projectSchema_recId] PRIMARY KEY CLUSTERED (recId ASC)
)
